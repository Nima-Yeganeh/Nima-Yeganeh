#!/usr/bin/env bash
#  vim:ts=4:sts=4:sw=4:et
#
#  Author: Hari Sekhon
#  Date: 2019-07-28 14:56:41 +0100 (Sun, 28 Jul 2019)
#
#  https://github.com/HariSekhon/DevOps-Bash-tools
#
#  License: see accompanying Hari Sekhon LICENSE file
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
#
#  https://www.linkedin.com/in/HariSekhon
#

# ============================================================================ #
#                  K u b e r n e t e s   /   O p e n S h i f t
# ============================================================================ #

bash_tools="${bash_tools:-$(dirname "${BASH_SOURCE[0]}")/..}"

# shellcheck disable=SC1090,SC1091
type add_PATH &>/dev/null || . "$bash_tools/.bash.d/paths.sh"


for x in kubectl oc helm flux; do
    autocomplete "$x"
done

# minishift oc-env > ~/.minishift.env
if [ -f ~/.minishift.env ]; then
    # remove .minishift.env if it causes errors, which can happen if it was generated when there was no MiniShift VM running
    # shellcheck disable=SC1090
    . ~/.minishift.env || rm -f -- ~/.minishift.env
fi

#if [ -f "/usr/local/opt/kube-ps1/share/kube-ps1.sh" ]; then
#    . "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
#    # overriden in prompt.sh which is evaluated later so this is sourced there
#    #PS1='$(kube_ps1)'" $PS1"
#fi

# unreliable that HOME is set, ensure shell evaluates to the right thing before we use it
[ -n "${HOME:-}" ] || HOME=~

add_PATH "${KREW_ROOT:-$HOME/.krew}"

for x in "$bash_tools"/kubernetes*.sh; do
    x="${x##*/}"
    name="${x#kubernetes_}"
    eval "k8s_${name}(){
        '$x' \"\$@\"
    }"
done

# ============================================================================ #

# replaced by function further down
#alias k=kubectl
# still need this autocomplete
complete -F __start_kubectl k

# 'k8s-app' label is set by dashboard creation but who uses that
# false positive, the comma doesn't separate args
# shellcheck disable=SC2054
k8s_get_pod_opts=(-o wide -L app,env --show-labels)

#alias po='k get po "${k8s_get_pod_opts[@]}"'
alias po='k get po'
alias pow='po -o wide'
alias powc='poc -o wide'
alias pocw='poc -o wide'
alias kapply='k apply -f'
alias kapp=kapply
alias kdel='k delete'
alias kdelf='kdel -f'
alias wp=watchpods
alias kd=kdesc
alias ke=kubectl_exec.sh
alias ke2=kubectl_exec2.sh
alias keg=kubectl_exec_grep.sh
alias kg='k get'
alias ka='k apply'
alias kaf='ka -f'
alias kl='k logs'
alias ktp='k top po'
alias kshell='kube-shell'
alias kubesh='kube-shell'
alias kubeconfig='$EDITOR "${KUBECONFIG:-~/.kube/config}"'
alias kubeconf=kubeconfig

alias use="k config use-context"
alias contexts="k config get-contexts"
#alias context="k config current-context"
context(){ k config current-context; }
# contexts has this info and is more useful
#alias clusters="k config get-clusters"

alias namespace='k config get-contexts | awk "/$(kubectl config current-context)/ {print \$NF}"'

alias kcd='k config set-context "$(kubectl config current-context)" --namespace'

alias menv='eval $(minikube docker-env)'

# scripts at top level, automatically included in $PATH
alias labels="kubectl_node_labels.sh"
alias taints="kubectl_node_taints.sh"

kubectl_namespace(){
    kubectl config get-contexts | awk '/^\*/{print $5}'
}

#alias poc='po | grep -v Completed'
unalias poc &>/dev/null
poc(){
    po "$@" | grep -v Completed
}

#alias dat='datree test --only-k8s-files --ignore-missing-schemas'
dat(){
    if [ $# -eq 0 ]; then
        find . -type f -iname '*.y*ml' |
        # datree doesn't handle patches well
        grep -v patch |
        tr '\n' '\0' |
        xargs -0 datree test --only-k8s-files --ignore-missing-schemas
    else
        datree test --only-k8s-files --ignore-missing-schemas "$@"
    fi
}
datkust(){
    datree_kustomize_all.sh . -- --enable-helm
}

# kustomize
alias kbuild='kustomize build --enable-helm'
alias kustomizebuilddiff='kbuild | kubectl_create_namespaces.sh; kbuild | kubectl diff -f -'
alias kbuilddiff=kustomizebuilddiff
alias kbuildd=kbuilddiff
alias kbd=kbuildd
alias kda=kustomize_diff_apply.sh

# workaround for the fact that kustomize doesn't accept other filenames
kustomize_build_file(){
    local kustomization="$1"
    if [ -z "$kustomization" ]; then
        echo "usage: kustomize_build_file <something>-kustomization.yaml" >&2
        return 1
    fi
    # because shell completion will stop at the prefix, so allow us to just enter and have it figure out what we're doing
    if ! [ -f "$kustomization" ];then
        if [ -f "${kustomization}kustomization.yaml" ]; then
            kustomization+="kustomization.yaml"
        elif [ -f "${kustomization}kustomization.yml" ]; then
            kustomization+="kustomization.yml"
        else
            echo "File not found: $kustomization" >&2
            return 1
        fi
    fi
    local prefix="${kustomization%kustomization.y*ml}"
    prefix="${prefix%-}"
    prefix="${prefix%_}"
    command cp -v -- "$prefix"*.yaml /tmp/ >&2
    cd /tmp >&2 || return 1
    echo >&2
    command mv -v -- "$kustomization" kustomization.yaml >&2
    echo >&2
    kbuild
    local result=$?
    echo >&2
    cd - >&2 || return 1
    return $result
}
alias kbuildf=kustomize_build_file
alias kbf=kbuildf
kbfa(){
    kbuildf "$@" >/dev/null || return 1
    cd /tmp >&2 || return 1
    kustomize_diff_apply.sh
    cd - >&2 || return 1
}

# copies kustomization and values files while stripping their comments and filename prefixes
kustcp(){
    local name="$1"
    local dir="$2"
    echo "Copying $name-kustomization.yaml to $dir/kustomization.yaml" >&2
    decomment "$name-kustomization.yaml" > "$dir/kustomization.yaml"
    echo "Copying $name-values.yaml to $dir/values.yaml" >&2
    decomment "$name-values.yaml" > "$dir/values.yaml"
    echo "Replacing values filename reference in kustomization.yaml" >&2
    perl -pi -e "s/$name-values\\.yaml/values.yaml/" "$dir/kustomization.yaml"
    echo "Done" >&2
}

# ============================================================================ #

# results in a blank arg which breaks kubectl command
#kubectl_opts=("${KUBECTL_OPTS:-}")
# split KUBECTL_OPTS to array properly
read -r -a kubectl_opts <<< "${KUBECTL_OPTS:-}"
# set K8S_NAMESPACE in local .bashrc or similar files for environments where your ~/.kube/config
# gets regenerated daily with certification authentication from a kerberos login script, which
# resets the 'kcd bigdata' namespace change. This way you automatically send the right namespace every time
if [ "${K8S_NAMESPACE:-}" ]; then
    kubectl_opts+=(-n "$K8S_NAMESPACE")
fi
# TODO: might split this later
oc_opts=("${kubectl_opts[@]}")

# ============================================================================ #

# oc() and kubectl() fix future invocations of k() to the each command if you want to explicitly switch between them
oc(){
    export KUBERNETES_CLI=oc
    command oc "${oc_opts[@]}" "$@"
}

kubectl(){
    export KUBERNETES_CLI=kubectl
    # if empty causes 'bash: kubectl_opts[@]: unbound variable', and can't use "${kubectl_opts[@]:-}" default because this results in a blank arg which ruins commands
    if [ -n "${kubectl_opts[*]:-}" ]; then
        command kubectl "${kubectl_opts[@]}" "$@"
    else
        command kubectl "$@"
    fi
}

k(){
    local opts=()
    # more efficient than forking to check history every time
    if [ -n "$KUBERNETES_CLI" ]; then
        case "$KUBERNETES_CLI" in
            kubectl)    opts+=("${kubectl_opts[@]}")
                        ;;
                 oc)    opts+=("${oc_opts[@]}")
                        ;;
                  *)    echo "invalid command '$KUBERNETES_CLI' listed in \$KUBERNETES_CLI (must be either 'kubectl' or 'oc' depending on whether you are using straight Kubernetes or OpenShift). Fix the variable or unset it to auto-detect when calling the k() function"
                        return
                        ;;
        esac
        command "$KUBERNETES_CLI" "${opts[@]}" "$@"
    else
        # shellcheck disable=SC2086
        case "$(k8s_or_openshift)" in
                openshift)   command oc "${oc_opts[@]}" "$@"
                             export KUBERNETES_CLI=oc
                             ;;
                    k8s|*)   command kubectl "${kubectl_opts[@]}" "$@"
                             export KUBERNETES_CLI=kubectl
                             ;;
        esac
    fi
}

krun(){
    local image="$1"
    local name="${image//\//-}"
    shift
    # sleep infinity only works on some distros
    k run --generator=run-pod/v1 "$name" --image "$image" -ti -- /bin/sh
}

kexec(){
    local line
    local name="${1//\//-}"
    if [ -z "$name" ]; then
        echo "usage: kexec <name>"
        return 1
    fi
    for ((i=0;i<100;i++)); do
        line="$(k get po | grep -F "$name")"
        if [ -z "$line" ]; then
            echo "No pod matching name $name found!"
            return 1
        fi
        name="$(awk '/Running/{print $1}' <<< "$line")"
        if [ -n "$name" ]; then
            break
        fi
        echo "waiting for pod to start running..."
        sleep 1
    done
    k exec -ti "$name" -- /bin/sh
}

# looks like both of these work on OpenShift context
#
# 'kubectl get pods'
#
# 'oc get pods'

# figure out if we're using k8s or openshift via most recent commands - return either 'k8s' or 'openshift'
k8s_or_openshift(){
    local last_k8s_cmd
    last_k8s_cmd="$(
        history |
        grep -v history |
        grep -Eo -e '\<oc\>' \
                 -e '\<kubect[l]\>' \
                 -e '\<minikub[e]\>' \
                 -e '\<minishif[t]\>' |
        tail -n 1
    )"
    case "$last_k8s_cmd" in
            oc|minishift)   echo openshift
                            # these end up in a subshell so aren't really useful, set in k() instead
                            #export KUBERNETES_CLI=oc
                            ;;
        kubectl|minikube)   echo k8s
                            #export KUBERNETES_CLI=kubectl
                            ;;
                       *)   echo unknown
                            ;;
    esac
}

oc_get_pods(){
    # shellcheck disable=SC2086
    oc get pods "${k8s_get_pod_opts[@]}"
}

k8s_get_pods(){
    # shellcheck disable=SC2086
    k get pods "${k8s_get_pod_opts[@]}"
}

get_pods(){
    #case "$(k8s_or_openshift)" in
    #        openshift)   oc_get_pods
    #                     ;;
    #              k8s)   k8s_get_pods
    #                     ;;
    #                *)   k8s_get_pods
    #                     ;;
    #esac
    #
    # k8s functions now include k8s vs oc detection, no need for above or would end up double calling k8s_or_openshift
    k8s_get_pods
}
export -f get_pods

get_pod(){
    local filter="${1:-.*}"
    get_pods |
    grep -v '^NAME[[:space:]]' |
    grep Running |
    awk "/$filter/{print \$1; exit}"
}

watchpods(){
    # watch on Mac (brew installed) doesn't have -x switch and doesn't work on even 'export -f function'
    # leave using kubectl call for now as that works on openshift too
    watch "
        echo 'Context: '
        echo
        kubectl config current-context
        echo
        echo
        echo 'Pods:'
        echo
        kubectl " "${kubectl_opts[@]}" " get pods " "${k8s_get_pod_opts[@]}" " 2>&1
        echo
    "
}

kdesc(){
    k describe "$@"
}

kdp(){
    kdesc pods "$@"
}

kdelp(){
    k delete pod "$@"
}

# Getting token works on stock Kubernetes but not OpenShift due to stricter defaults
#
# Error from server (Forbidden): secrets is forbidden: User "developer" cannot list secrets in the namespace "kube-system": no RBAC policy matched
# error: resource name may not be empty
#
## even after 'oc login' as system/admin
#
# Error from server (Forbidden): secrets is forbidden: User "system" cannot list secrets in the namespace "kube-system": no RBAC policy matched
# error: resource name may not be empty
#
k8s_get_token(){
    kubectl describe secret -n kube-system "$(kubectl get secrets -n kube-system | awk '/^default-token/ {print $1}')" |
    awk '/^token/ {print $2}'
}

# better than: kubectl config view | grep server
k8s_get_api(){
    local context
    local cluster
    context="$(context)"
    cluster="$(k config view -o jsonpath="{.contexts[?(@.name == \"$context\")].context.cluster}")"
    k config view -o jsonpath="{.clusters[?(@.name == \"$cluster\")].cluster.server}"
    # or if you have jq installed:
    # k get --raw=/api | jq -r '.serverAddressByClientCIDRs[0].serverAddress'
    echo
}

# TODO: path like above to get the current context's cluster
k8s_get_client_cert(){
    awk '/^[[:space:]]*client-cert/{print $2}' ~/.kube/config | head -n 1
}

k8s_get_client_key(){
    awk '/^[[:space:]]*client-key-data/{print $2}' ~/.kube/config | head -n 1
}

k8s_get_ca_cert(){
    awk '/^[[:space:]]*certificate-authority-data/{print $2}' ~/.kube/config | head -n 1
}

# generates files for authenticating to kube-apiserver via curl:
#
# curl --cert client_cert.pem --key client_key.pem --cacert ca_cert.pem https://k8smaster:6443/api/v1/pods
# curl --cert client_cert.pem --key client_key.pem --cacert ca_cert.pem https://k8smaster:6443/api/v1/pods/namespaces/default/pods -XPOST -H 'Content-Type: application/json' -d @pod_defintion.json
k8s_get_keys(){
    # use --decode not -d / -D which varies between Linux and Mac
    k8s_get_client_cert | base64 --decode - > client_cert.pem
    echo "generated client_cert.pem"
    k8s_get_client_key | base64 --decode - > client_key.pem
    echo "generated client_key.pem"
    k8s_get_ca_cert | base64 --decode - > ca_cert.pem
    echo "generated ca_cert.pem"
}

# run kubectl commands against multiple clusters
kclusters(){
    for context in $(kubectl config get-contexts -o=name --kubeconfig clusters.yaml); do
        kubectl "$@" --kubeconfig clusters.yaml --context="$context"
    done
}

# to kubectl apply manifests to both clusters for multi-cluster deployments
kclustersapply(){
    kclusters apply -f "$@"  # eg. manifests
}

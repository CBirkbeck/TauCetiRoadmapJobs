# Review of ShimuraVarieties (pull request #933 at d03dc81)

**Verdict:** needs changes

Incremental re-review of the 16 README lines changed since 4b3416f: the two normalisation repairs in §7.0i.1 (the polarization scaled by `4⁻¹`, injectivity of the projection for positive dimension, with the matching Check), and the replacement of the ShimuraData import by a construction of the Mumford–Tate group of an abelian variety inside §7.0i.1 (minimality through Hopf ideals, connectedness, homotheties, reductivity, finitely many defining tensors by the descending chain condition), with the scope sentence, the ReductiveGroups contract, the §7.0i.1 citation line, the Layer 7 Dependencies line and the downstream sentence adjusted. `Suggested.lean` and the manifest are byte-identical to the head the previous review read; nothing outside the folder changed. The gate passes and the dependency check is clean. The mathematics of the new construction holds on every instance tried (table below) and its supplier citations resolve on main; the only remaining defect is the pull-request description's merge-order block, carried from the two previous reports.

## R01 (P3) — The pull request description's merge-order block still omits StratifiedSpacesAndTameTopology

**Location.** The description (data): "It depends on no other author's open pull request." README lines 83, 806 and 978 import StratifiedSpacesAndTameTopology Layer 4 and §4.9(a).

**Claim.** Every other author's open pull request that this roadmap cites is listed in the "must merge first" list.

**Witness.** `roadmaps list` at this review: `#1519 StratifiedSpacesAndTameTopology (new) @mycaule 012087a`; the folder is not on main. No other citation of the README names a folder that is only in another author's open pull request.

**Repair.** Add #1519 (StratifiedSpacesAndTameTopology, mycaule) to the list of other authors' pull requests that must merge first, and drop "It depends on no other author's open pull request". The repair lane cannot edit the description (the repair report at 4b3416f said so); this is for the author or the worker. Re-raised: the description note of the repair report at 4b3416f. The reason given there (the description is outside the repair job's edits) is right about who applies it and does not settle the defect, which is still in the description at this head.

## Previous findings

- R01 — not repaired: the description still reads "It depends on no other author's open pull request" while README line 83 imports StratifiedSpacesAndTameTopology Layer 4 (R01 above).
- R02 — repaired: line 1891 now says the homothety `2·id` "scales by `4⁻¹`, its symplectic multiplier `ψ(2v,2w)=4ψ(v,w)` being `4`", with the contragredient action named and `c(2·id)=4⁻¹`; the Check at line 1901 computes `ψ(e₁/2,e₂/2)=1/4`, `ψ(2e₁,2e₂)=4`, Deligne's `ν(g)^p` with `p=−1`, and `(2·id,4)` fixing `ψ`.
- R03 — repaired: line 1891 reads "for `A` of positive dimension, so that `ψ≠0`, its projection to `GL(V_B)` is injective, since `(1,λ)` scales `ψ` by `λ`"; the Check at line 1901 records `dim A=0`, where Deligne's group is `G_m` and the projection to the trivial `GL(V_B)` has kernel `G_m`.

## Verified sound

**Gate and dependency check.** The worker's gate at d03dc81: every scanner 0, `depcheck=0`, `build=0`, OK. I re-ran the dependency check with the brief's command:

```
depcheck: 238 roadmaps, 2120 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The merge order now lists ShimuraVarieties at line 93 and ShimuraData at line 106, so ShimuraData became a later roadmap; the head drops every ShimuraData import (the contract paragraph, the §7.0i.1 citation, the Layer 7 Dependencies entry) and states the Mumford–Tate group of an abelian variety as a target of §7.0i.1. This is the notion moving down, recorded here: §7.0i.1 (line 1891) constructs `MT(V_B)` for the weight-one Hodge structure of an abelian variety, and the downstream sentence (line 2783) says ShimuraData §§1.2–1.4 construct the group of an arbitrary rational Hodge structure, which specialises to this one. The remaining suppliers of §7.0i.1 precede this roadmap: AbelianSchemesAndArithmeticModuli 41, ArithmeticGaloisRepresentations 42, NeronModelsAndSemistableAbelianVarieties 47; ReductiveGroups is on main. `git diff --stat origin/main...HEAD` outside the folder: empty. `git diff --stat 4b3416f HEAD`: README only, 7 insertions, 9 deletions.

**Lean.** `Suggested.lean` and `lake-manifest.json` are unchanged since 4b3416f. I elaborated the worker's scratch copy with `#check @` for all five declarations (`lake env lean`, exit 0): the only warnings are the two `sorry`s (lines 70 and 83), and the five elaborated types are identical to `signatures.md` and to the previous reports; no section binder is lost. The scratch copy differs from `Suggested.lean` only by the `#check` lines. Imports, form, one-tactic probes, the headline list and the not-statable docstring: as in the previous reports.

**Supplier citations of the changed passages, each resolved on main or at the cited head:**

- ReductiveGroups on main (`TauCetiRoadmap/ReductiveGroups/README.md`, head 5a6432e7): "### Layer 3: subgroups, quotients, components" at line 234 (anchor `#layer-3-subgroups-quotients-components`, as linked at lines 1903 and 2216), with "Hopf ideals ↔ closed subgroup schemes" (line 235) and "Identity component `G°` and component group" with geometric connectedness (line 242); "### Layer 5: solvable and unipotent groups; the unipotent radical" at line 443; "### Layer 6: reductive and semisimple groups" at line 466, reductive = smooth, connected, `R_u(G_{k̄})` trivial (line 467), and the characteristic-zero equivalence with linear reductivity (line 472). The contract at line 75 names exactly these three layers for §7.0i.1.
- Own reference: `h:S→GL(V_B)_ℝ` "of §P.3" (line 1891). §P.3 (line 175) fixes the dictionary `h_C(z₁,z₂)` acting on type `(p,q)` by `z₁^(−p)z₂^(−q)`, so on the weight-one `V_B=H¹` a real `r` acts by `r⁻¹`, as line 1891 says.
- ArithmeticGaloisRepresentations §1.11, §§2.1–2.2, AbelianSchemesAndArithmeticModuli §§A4.1, A6.11, NeronModelsAndSemistableAbelianVarieties §5.1 (lines 1903 and 2216): untouched by the diff, resolved at 4b3416f.
- StratifiedSpacesAndTameTopology (#1519) Layer 4 and §4.9(a) at lines 83, 806, 978: untouched by the diff; the pull-request index still lists #1519 as another author's new folder (R01).

**Source.** deligne82 (Milne's author version; page markers: p. 24 from line 999, p. 25 from line 1037): Proposition 3.6, "if `V` is polarizable then `G` is reductive", at line 1033 (p. 24), proof at lines 1034–1050 and following (pp. 24–25) through the criterion that a connected real group with a compact real form is reductive, as line 1891 says ("reaches reductivity through a compact real form instead"); its polarization identity at line 1045, `ψ(g₁v,g₁v′)=g₂^n ψ(v,v′)` for `(g₁,g₂)` in the group inside `GL(V)×G_m`, gives for weight `n=1` and `g₁=2·id` the second component `g₂=4`, which is the Check's pair `(2·id,4)`. The locators of Propositions 2.9(b), 3.1(c), 3.4 and the page-24 definition (lines 798–825, 927–932, 1012–1021) are unchanged from the previous report.

**Adversarial table.** Rows for the changed statements first, with the values computed; rows for untouched statements are carried from the previous reports, whose values I did not recompute.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §7.0i.1: `MT(V_B)` exists as the intersection of all closed `ℚ`-subgroups through which `h` factors, and is a finite intersection | non-CM elliptic curve; CM elliptic curve with `End⁰=K` | Hopf ideals `I_H` of `O(GL(V_B))` for the subgroups `H` with `h` through `H_ℝ`; `ΣI_H` is finitely generated, so equals `I_{H₁}+…+I_{H_r}`, the ideal of `H₁∩…∩H_r`; non-CM: the family is `{GL₂}` and `𝐆=GL₂`; CM: `Res_{K/ℚ}G_m` is in the family and `𝐆=Res_{K/ℚ}G_m`, with `h(S)=(K⊗ℝ)^×=ℂ^×` | holds | — |
| §7.0i.1: `𝐆` is connected | normaliser `N=T∪wT` of `T=Res_{K/ℚ}G_m` in `GL₂` for a CM curve | `N` is a closed `ℚ`-subgroup with 2 components through which `h` factors; `N⁰=T` is a closed `ℚ`-subgroup through which the connected `S` factors; so `𝐆⊂N⁰`, and `𝐆=T` | holds | — |
| §7.0i.1: `𝐆` contains the homotheties | `r∈ℝ^×`; closed `ℚ`-subgroups `μ_n`, `G_m` of the scalars | §P.3 convention `z₁^(−p)z₂^(−q)`: `h(r)=r^(−1)` on both types `(1,0)` and `(0,1)`; `𝐆∩G_m·id` is a closed `ℚ`-subgroup of `G_m` whose real points contain `{r⁻¹}=ℝ^×`, infinite; `μ_n(ℝ)⊂{±1}`; so it is `G_m` | holds | — |
| §7.0i.1: every `𝐆`-stable `W` has the `𝐆`-stable complement `W^⊥` | `A=E₁×E₂` non-isogenous without CM, product polarization, `W=H¹(E₁)`; `x∈W∩W^⊥` | `W` is `h(S)`-stable so `h(i)W⊂W`; `ψ(x,h(i)x)=0` with the form definite on `W_ℝ` gives `x=0`, so `V_B=W⊕W^⊥` (the complement rational since `ψ` is); `ψ(h(z)x,w)=c(z)ψ(x,h(z)⁻¹w)=0` for `x∈W^⊥`, `w∈W`, so `W^⊥` is `h(S)`-stable, `Stab(W^⊥)⊃𝐆`; here `W^⊥=H¹(E₂)` | holds | — |
| §7.0i.1: `R_u(𝐆)` acts trivially on the semisimple faithful `V_B`, so `𝐆` is reductive | `𝐆=GL₂` (`R_u=1`); negative control: Borel `B⊂GL₂` on `ℚ²` | `V^{R_u}` is `𝐆`-stable since `u(gv)=g(g⁻¹ug)v=gv`, nonzero in each irreducible summand, hence the summand; `R_u⊂GL(V_B)` acting trivially is trivial; control: `(ℚ²)^{U}=ℚe₁`, a `B`-stable line with no `B`-stable complement, and `R_u(B)=U≠1`, as the contrapositive predicts | holds | — |
| §7.0i.1: finitely many untwisted tensors cut out `𝐆` (DCC route) | non-CM curve; CM curve | fixers `Fix(F)` of finite families are closed subschemes of the noetherian `GL(V_B)`; a minimal one `Fix(F₀)` fixes every further tensor `t` since `Fix(F₀∪{t})⊂Fix(F₀)`; non-CM: `F₀=∅`, `Fix=GL₂=𝐆`; CM: `F₀` = the `K`-endomorphism tensors in `V_B⊗V_B^∨`, `Fix` = centraliser of `K` = `Res_{K/ℚ}G_m` | holds | — |
| §7.0i.1: `2·id` scales `ψ` by `4⁻¹`, multiplier `4`, `c(2·id)=4⁻¹` | `V_B=ℚ²`, `ψ=e₁^∨∧e₂^∨` | contragredient `((2·id)·ψ)(e₁,e₂)=ψ(e₁/2,e₂/2)=1/4`; `ψ(2e₁,2e₂)=4`; Deligne `ν(g)^p` with `ν=4`, `p=−1`: `1/4`; deligne82 line 1045 with `n=1`: `4ψ=g₂ψ`, `g₂=4` | holds | — (R02 repaired) |
| §7.0i.1: `(2·id,4)` fixes `ψ`; `(1,λ)` scales `ψ` by `λ` | `λ` on `ℚ(−1)` by `λ^{+1}` (Deligne's `λ⁻¹` on `ℚ(1)`) | `4⁻¹·4=1`; `(1,λ)·ψ=λψ=ψ` iff `λ=1` when `ψ≠0` | holds | — |
| §7.0i.1: injectivity needs `dim A>0` | `dim A=0` | tensor spaces `ℚ(m)` of type `(−m,−m)`; rational Hodge tensors only for `m=0`; Deligne's group `=G_m`; projection to `GL(0)=1` has kernel `G_m` | holds | — (R03 repaired) |
| Scope (line 13), contract (line 75), citation line (1903), Layer 7 inputs (2216), downstream (2783) | each named object against its owner | Hopf ideals ↔ closed subgroups: RG line 235; identity component: RG 242; unipotent radical: RG 443; reductivity: RG 466–467; §P.3 dictionary: line 175; ShimuraData at order 106 > 93 | resolves | — |
| §7.0i.1: both inclusions of the fixer characterisation, transport depends on `σ=τ|_Ē`, twisted étale action `ρ_ℓ(σ)χ_ℓ(σ)^p`, finiteness via proof (ii), `Γ_E^𝐆` open and `ℓ`-independent, Deligne's inclusion (carried) | as in the review at 4b3416f | as there | as there | — |
| §7.0i.1 Checks 1–4, `γ_ℓ(v)`, characteristic polynomial, inner form, `Conj_𝐆(ℚ)` non-injectivity; §3.5a / line 83 specialization to AffineMorseLefschetz A4.1 (carried) | as in the reviews at f92fe3c and 4b3416f | as there | as there | — |
| §3.5a laws, §5.9a, §§0.1–0.2, `CMType`, `reflexField_*`, Conventions, §§1.3, 1.5, 4.4, 4.9, 4.9a, 4.10, 5.1, 3.9, 8.17, 7.5, 7.0e, 8.1, 8.3, 8.6, 6.4, 8.5 (carried) | as in the review at e7d7bdc | as there | as there | — |

**Duplication and ownership of the new construction.** ReductiveGroups Layer 6 states the characteristic-zero equivalence "reductive ⇔ linearly reductive"; §7.0i.1's route proves only the direction it needs (a faithful semisimple representation forces `R_u` trivial) in four sentences, as a proof sketch naming its inputs, and the contract imports Layers 3, 5 and 6 by name; a route through Layer 6's equivalence is open to the implementer and not mandatory. ShimuraData §§1.2–1.4 (open pull request, order 106) construct the general Mumford–Tate group; it is later than this roadmap and is named in the downstream sentence, so this roadmap is the earliest owner of the abelian-variety case. AutomorphicBundles §1.1 and SatoTateGroups §9.10: as in the previous report. No roadmap on main mentions the Mumford–Tate group (grep over `TauCetiRoadmap/*/README.md` and `Completed/*/README.md` on main: no match); `roadmaps grep` for "Mumford–Tate group" over the open heads finds, besides this roadmap, only ShimuraData (order 106), AdmissiblePairsAndPadicHodgeStructures (order 239, families of Hodge structures), ComplexMultiplicationAndExplicitReciprocityPartII (order 348, consuming ShimuraData) and SatoTateGroups (not in the order, consuming ShimuraData §1.2 for `H_1(A(ℂ),ℚ)` at its line 2315), all later than this roadmap.

**Shape at the changed lines.** The construction is prose with its inputs named and the locator at the claim; the Check computes values (`1/4`, `4`, kernel `G_m`) and names the wrong models it excludes (a fixer of twisted tensors; a projection claimed injective for `dim A=0`); no process words, pull-request numbers, LaTeX or machine paths in the diff; the deleted ShimuraData contract leaves no stub, and the only remaining mention of ShimuraData is the downstream sentence.

## Not verifiable

- L. van den Dries, *Tame Topology and o-minimal Structures* (CUP 1998), cited at §3.5a for Chapter 4 §1: publisher landing page only; uncertified, as in the previous reports.
- The seeded sample's targets (3.2, 3.8, 4.1, 4.6, 4.11, 5.2, 7.0g, 7.0h, 7.3, 7.7, 8.3, 8.15, 8.16a, 8.17, 8.18) are untouched by the diff; §§7.3 and 7.7 sit in Layer 7, whose Dependencies line changed only by replacing the ShimuraData entry with ReductiveGroups Layers 3–6 for §7.0i.1. The verification of the full reviews stands for them.
- Kazhdan 1983, the Annals pagination of AGHMP and the texts listed in the earlier reports outside the seeded sample: unchanged, not re-attempted.
- Ownership against open pull requests the brief lists without files was not checked beyond the `roadmaps grep` index.

## Source issues

- none

# Review of ShimuraVarieties (pull request #933 at f92fe3c)

**Verdict:** needs changes

Incremental re-review of the 19 README lines changed since e7d7bdc: the new target §7.0i.1 (Mumford–Tate-valued ℓ-adic Galois representations and Frobenius classes), the sentence placing it in §7.0, and the Layer 7 Dependencies line. `Suggested.lean` and `metadata.toml` are byte-identical to the head the previous review read. The gate passes and the dependency check is clean; the new section has one P2 (its characterisation of the Mumford–Tate group ignores the Tate lines its own tensor spaces carry) and two P3 (a stale anchor and a missing reference; supplier contracts and the ownership record), and the two P3 notes of the previous report are unchanged.

## R01 (P2) — §7.0i.1 characterises `𝐆` as the fixer in `GL(V_B)` of every rational Hodge tensor of §7.0i, but those tensor spaces carry Tate twists on which `GL(V_B)` does not act

**Location.** `TauCetiRoadmap/ShimuraVarieties/README.md` line 1887: "Prove that `𝐆` is the subgroup of `GL(V_B)` fixing every rational Hodge tensor of §7.0i, and that finitely many such tensors already cut it out."

**Claim.** The Mumford–Tate group is the pointwise fixer, inside `GL(V_B)`, of all rational Hodge tensors of §7.0i.

**Witness.** §7.0i (line 1872) forms its tensor spaces from `H_B`, "their duals and Tate twists". The polarization `ψ ∈ V_B^∨⊗V_B^∨⊗ℚ(−1)` is such a tensor. `GL(V_B)` has no action on `ℚ(−1)`; with the only one available (trivial) the fixer of `ψ` is `Sp(ψ)`, while the homothety `2·id` lies in `𝐆(ℚ)` by the weight cocharacter named in the same sentence and sends `ψ` to `4ψ`. Deligne defines the group inside `GL(V)×G_m`, with `G_m` acting on `ℚ(1)`, and describes its projection to `GL(V)` by a multiplier: `g` with `ν(g) ∈ ℚ` such that `g t = ν(g)^p t` for every rational `t` of type `(p,p)` in an untwisted tensor space (deligne82 lines 1013–1020, p. 24; Proposition 3.4, line 1021). AutomorphicBundles §1.1's first Check records the same distinction (fixing `ψ` in `V^∨⊗V^∨` alone cuts out `Sp`, not `GSp`).

**Repair.** Replace the sentence by: "Prove that `𝐆` is the subgroup of `GL(V_B)` fixing every rational Hodge tensor of §7.0i that lies in a tensor space without Tate twist; equivalently it is the image in `GL(V_B)` of Deligne's subgroup of `GL(V_B)×G_m` fixing all of them, the second factor acting on the Tate lines, and the projection is injective because an element `(1,λ)` fixes the polarization tensor in `V_B^∨⊗V_B^∨⊗ℚ(−1)` only when `λ=1`. Prove that finitely many untwisted Hodge tensors already cut it out, from the finite generation of the Mumford–Tate ideal (ShimuraData §1.2) and Chevalley's theorem for the reductive `𝐆` (Deligne 82, Proposition 3.1(c) and Proposition 3.4, pp. 22–24)." Then say that the sentence "`ρ_ℓ(σ)` carries the `ℓ`-adic realization of `t` to that of `t^σ`" is for untwisted tensors (a twisted one picks up `χ_ℓ(σ)^p`), gloss "integral Hodge tensors" as the rational Hodge tensors whose Betti realization lies in the integral tensor lattice, and give the Deligne locators by number: Proposition 2.9(b), pp. 18–19, for the finiteness of the Galois action, Main Theorem 2.11, p. 19. Tested on the instance that refuted the original: `ψ⊗ψ^∨ ∈ V_B^{⊗2}⊗V_B^{∨⊗2}` is an untwisted Hodge tensor whose fixer is `GSp(ψ)`, containing `2·id` with multiplier `4`; conversely a `g` fixing it scales `ψ` by some `c(g)`, and `(g,c(g))` fixes every twisted Hodge tensor `t ∈ T^{a,b}(p)` because `t⊗ψ^{⊗p}` (`ψ^∨` for `p<0`) is an untwisted Hodge tensor, so the restricted fixer is exactly the projection of Deligne's group. For the CM elliptic curve the untwisted tensors in `V_B⊗V_B^∨` given by the `K`-action have fixer `Res_{K/ℚ}G_m`, matching the first Check.

## R02 (P3) — The ShimuraData link anchor is stale, and Deligne's paper is cited inline but absent from `## References`

**Location.** README lines 1898 and 2211: `…/ShimuraData/README.md#d1-mumford-tate-group`; lines 1876 and 1889 cite "Deligne, Hodge cycles on abelian varieties" by URL only.

**Claim.** The anchor resolves; every cited work is in the reference list.

**Witness.** At the ShimuraData head the heading is "### 1.2 Mumford–Tate group" (its README line 186) and no `d1` anchor exists (the `<a id>` anchors were removed from that roadmap). The README's own NeronModelsAndSemistableAbelianVarieties link drops en-dashes the GitHub way (`#51-néronoggshafarevich`). `## References` (line 2780 onward) has no Deligne entry.

**Repair.** Use `#12-mumfordtate-group` at both lines, and add to `## References`: P. Deligne (notes by J. S. Milne), *Hodge cycles on abelian varieties*, in Hodge Cycles, Motives, and Shimura Varieties, LNM 900, Springer 1982; the author version at jmilne.org whose page numbers §§7.0i and 7.0i.1 use.

## R03 (P3) — §7.0i.1 invokes "the exact supplier contracts above" for ArithmeticGaloisRepresentations and ShimuraData, which have none, and the new ownership is recorded nowhere although two open roadmaps plan the same statements

**Location.** README line 1898 ("with the exact supplier contracts above"); `## Exact supplier contracts` lines 37–136 (no paragraph for ArithmeticGaloisRepresentations, ShimuraData or NeronModelsAndSemistableAbelianVarieties); `## Scope and ownership` lines 5–36 and `## Downstream consumers` (line 2776) silent on §7.0i.1; line 1785 ("used by no later section").

**Claim.** The suppliers of §7.0i.1 have contracts, and the roadmap says what §7.0i.1 owns.

**Witness.** `grep -n 'ArithmeticGaloisRepresentations\|ShimuraData'` in the README hits only lines 1894, 1898 and 2211. SatoTateGroups §9.10 (open pull request, placed after PotentialModularityAndCompatibleSystems, merge-order line 160, so later than this roadmap at line 104) reads "prove here Deligne's inclusion `G_ℓ^{Zar,0} ⊆ MT(A)⊗ℚ_ℓ` for every abelian variety over a number field … After a finite extension a finite tensor family defining MT is fixed … the inclusion and this finite-extension argument are owned here", citing the same Theorem 2.11 and Proposition 2.9(b); AutomorphicBundles §1.1 (merge-order line 167) owns `finiteTensorStabilizer`, the finite defining tensor family of a reductive group (Deligne, Proposition 3.1(a–c)). Both are later than this roadmap, so this roadmap may own the two statements and cannot cite either; but nothing in this roadmap uses §7.0i.1, and a reader sees three owners.

**Repair.** Add under `## Exact supplier contracts` a paragraph `From TauCetiRoadmap.ArithmeticGaloisRepresentations` (§1.11: `Conj_H = H//H` with `χ_H`, its points over an algebraically closed field the semisimple classes, and the `GL_n → 𝔸^{n−1}×G_m` instance; §§2.1–2.2: decomposition and inertia groups, arithmetic Frobenius lifts, `IsUnramifiedAt`), one `From TauCetiRoadmap.ShimuraData` (§1.2 the Mumford–Tate group with its minimality and the weight cocharacter; §1.3 connectedness; §1.4 reductivity for polarizable structures) and one line for NeronModelsAndSemistableAbelianVarieties §5.1 (good reduction gives trivial inertia on `T_ℓ`, `ℓ ≠ p`). In `## Scope and ownership` state that §7.0i.1 owns the Mumford–Tate-valued `ℓ`-adic representation, Deligne's open subgroup `Γ_E^𝐆` with its `ℓ`-independence and the Frobenius classes in `Conj_𝐆`, and under `## Downstream consumers` name SatoTateGroups §9.10 and AutomorphicBundles §1.1 as consumers of that inclusion and finite tensor family. The alternative that also resolves the triple ownership, since no section here uses it, is to delete §7.0i.1 and leave the two statements with the roadmaps that already plan them.

## R04 (P3) — §3.5a still owns the product and fibre-dimension laws on `semialgebraicStructure` that AffineMorseLefschetz A4.1 states

Carried from the previous report (its R01), unchanged at this head: README line 802 ("prove them here for every o-minimal structure of that layer") and line 83. Witness and repair as there: keep the general laws, add one clause that on `semialgebraicStructure` they specialize through StratifiedSpacesAndTameTopology §4.9's `dim_semialgebraic_eq` to AffineMorseLefschetz A4.1's laws, which are not reproved. The instance `{xy=0} ⊂ ℝ²` gives the same values on both sides (previous table).

## R05 (P3) — The pull request description's merge-order block still omits StratifiedSpacesAndTameTopology

Carried from the previous report (its R02), unchanged: the description (data) says "It depends on no other author's open pull request", while README lines 83 and 974 import StratifiedSpacesAndTameTopology Layer 4, another author's open pull request that adds a new folder. Repair: add it to the "must merge first" list.

## Previous findings

- R01 — not repaired: line 802 still reads "prove them here for every o-minimal structure of that layer" with no clause on the semialgebraic specialization (R04 above).
- R02 — not repaired: the description's merge-order block lists no StratifiedSpacesAndTameTopology (R05 above).

## Verified sound

**Gate and dependency check.** The worker's gate at f92fe3c: every scanner 0, `depcheck=0`, `build=0`, OK. I re-ran the dependency check with the brief's command:

```
depcheck: 208 roadmaps, 1716 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The five suppliers of §7.0i.1 precede this roadmap (merge order line 104): AbelianSchemesAndArithmeticModuli 41, ArithmeticGaloisRepresentations 42, NeronModelsAndSemistableAbelianVarieties 47, ShimuraData 103. `git diff --stat origin/main...HEAD` outside the folder: empty. `git diff --stat e7d7bdc HEAD`: README only, 17 insertions, 2 deletions.

**Lean.** `Suggested.lean` is unchanged. I elaborated the worker's scratch copy with `#check @` for all five declarations (`lake env lean`, 12.6 s): the only warnings are the two `sorry`s (lines 70 and 83); the five elaborated types are identical to `signatures.md` and to the previous report (no section binder lost). Imports, form, one-tactic probes, headline list and the not-statable docstring: as in the previous reports.

**Supplier citations of §7.0i.1, each resolved at the cited head via `roadmaps show`:**

- ShimuraData (#1038) §1.2 "Mumford–Tate group" (README line 186): `MT(V)` the smallest `ℚ`-subgroup of `GL(V)` whose real points contain `h(S)`, `mumfordTateWeight` (the weight cocharacter factors through it; line 208), finite type and finite generation of `I_MT` (line 202); §1.3 (line 227) geometrically connected; §1.4 (line 246) reductive for polarizable `V`. These are exactly what line 1887 assumes ("connected and reductive … containing the homotheties through the weight cocharacter"; weight `1 ≠ 0`, so the image is the full homothety group). ShimuraData nowhere states the fixer-of-Hodge-tensors description, so §7.0i.1's claim (R01) is not a duplicate.
- ArithmeticGaloisRepresentations (#856) §1.11 (README line 1263): `Conj_H = H//H = Spec O(H)^H`, `χ_H`, for a connected reductive `H` over a field; `Conj_H(K)` the semisimple classes for `K` algebraically closed; `χ_H` constant on conjugacy classes over every field; `GL_n → 𝔸^{n−1}×G_m` by the characteristic polynomial (lines 1322–1330), with the Check "a unipotent matrix and the identity both map to `(2,1)`" (line 1342) that §7.0i.1's fourth Check mirrors. §2.1 (line 1462): decomposition and inertia groups, arithmetic Frobenius lifts; §2.2 (line 1637): `IsUnramifiedAt`, `ρ(I_Q) = 1`. The README's geometric Frobenius is "the inverse of an arithmetic Frobenius lift", consistent with AGR's arithmetic normalisation (its lines 14, 243).
- AbelianSchemesAndArithmeticModuli (#849) §A4.1 (line 1822): `V_ℓ A = T_ℓ A ⊗ ℚ_ℓ` with its continuous Galois action, `AbelianTate.dualPairing` (`T_ℓ(A^∨) ≅ Hom(T_ℓ A, ℤ_ℓ(1))`, which is the README's `H¹_ét(1) = V_ℓ A^∨`); §A6.11 (line 3026): the characteristic polynomial of `α ∈ End A` on `V_ℓ A` is integral and independent of `ℓ ≠ p`, with the Frobenius of `E/𝔽_q` as the example `X² − aX + q`.
- NeronModelsAndSemistableAbelianVarieties (#852) §5.1 (line 2983): good reduction over a henselian DVR iff inertia acts trivially on `T_ℓ(A)`, `ℓ ≠ char k`, with the place-wise form for a non-henselian ring.
- Own references: §7.0i (line 1870, the transport of rational Hodge tensors, the rational étale comparison, Tate lines retained) and §5.7 (line 1469, the Frobenius `π ∈ O_E` of the reduction under the CM action).

**Source.** deligne82 (Milne's author version, fetched from jmilne.org, author-page licence; not recorded in a manifest, the folder has none): Main Theorem 2.11 at line 848 (p. 19): a Hodge cycle on an abelian variety relative to one embedding is absolute Hodge. Proposition 2.9(b) at lines 805–807 (p. 18): `Gal(k̄/k₀)` acts on the absolute Hodge classes through a finite quotient; proofs (i)–(iii) at lines 816–825, (ii) being the injectivity of `C_AH → H_ℓ` plus countability, (iii) the polarization form. §3 at line 918: Proposition 3.1(c) (line 932, a reductive subgroup is the fixer of the tensors it fixes), the definition of the Mumford–Tate group inside `GL(V)×G_m` (lines 1013–1020, p. 24) and Proposition 3.4 (line 1021). The README's "§2, Theorem 2.11 and the finiteness of the Galois action … and §3, Mumford–Tate groups as the fixers of Hodge tensors" matches these; the one discrepancy is R01.

**Ownership.** By object, across main, the board packages and the open heads the brief lists (`roadmaps grep`): the absolute Hodge theorem is owned by §7.0i and consumed by AutomorphicBundles §§1.2–1.3 (its lines 324, 846, 860) and through it by SatoTateGroups; the only other roadmaps mentioning Mumford–Tate groups with Galois actions are AdmissiblePairsAndPadicHodgeStructures §2.5 (`p`-adic, a different object) and SatoTateGroups §§9.2, 9.4, 9.10 (R03). ArithmeticGaloisRepresentations cites Kisin–Zhou only for its Chebotarev density lemma (its lines 3577–3605), not for Frobenius classes in the Mumford–Tate group. No roadmap cites §7.0i.1. Ownership against open pull requests the brief lists without files was not checked beyond that index.

**Adversarial table.** Rows for the changed statements first, with the values computed; rows for untouched statements are carried from the review at e7d7bdc (marked "carried"), whose values I did not recompute.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §7.0i.1: `𝐆` = fixer in `GL(V_B)` of all rational Hodge tensors of §7.0i | `ψ ∈ V_B^∨⊗V_B^∨⊗ℚ(−1)`, `g = 2·id`; `ψ⊗ψ^∨ ∈ T^{2,2}`; CM curve, `K`-action tensors in `V_B⊗V_B^∨` | `2·id ∈ 𝐆(ℚ)` (weight cocharacter) but `2·ψ = 4ψ ≠ ψ` under the trivial action on `ℚ(−1)`; fixer of `ψ⊗ψ^∨` is `GSp(ψ) ∋ 2·id` (multiplier 4); fixer of the `K`-tensors is `Res_{K/ℚ}G_m` | false as written, true for untwisted tensors | R01 |
| §7.0i.1: `Γ_E^𝐆 = ρ_ℓ^{-1}(𝐆(ℚ_ℓ))` open, independent of `ℓ` | untwisted defining tensors `t_i`; `σ` with `t_i^σ = t_i` for all `i`; CM curve over `ℚ` | `ρ_ℓ(σ) ∈ 𝐆(ℚ_ℓ)` iff `(t_i^σ)_ℓ = (t_i)_ℓ` iff `t_i^σ = t_i` (`C_AH → H_ℓ` injective, Prop 2.9 proof (ii)); kernel of a finite-image `ℚ`-linear action, no `ℓ`; CM over `ℚ`: `Γ_ℚ^𝐆 = Γ_K`, `E^𝐆 = K` | holds, with R01's restriction to untwisted tensors | R01 (wording) |
| §7.0i.1: finiteness via the lattice of integral Hodge tensors and a positive form | `C` the rational Hodge tensors in one tensor space, `Λ = C ∩ T_B(ℤ)` | `Λ` is Galois-stable (each `t_ℓ ∈ T_ℓ(ℤ_ℓ)` is preserved) and a lattice in `C`; image in `O(q)(ℤ) ∩ GL(Λ)`, finite; `O(q)(ℚ)` alone is infinite (rational rotations) | sound; the lattice is needed, not only the form | gloss (R01) |
| §7.0i.1: `γ_ℓ(v)` well defined | two decomposition groups `D, gDg^{-1}`; two lifts differing by `i ∈ I_v` | images differ by `𝐆(ℚ_ℓ)`-conjugation and by `ρ_ℓ^𝐆(i) = 1` (unramified by NMSAV §5.1); `χ_𝐆` conjugation-invariant | holds | — |
| §7.0i.1: image of `γ_ℓ(v)` in `Conj_{GL}` is the characteristic polynomial of the Frobenius endomorphism `π_v` on `V_ℓ` | `E/𝔽_q` elliptic, `V_ℓ` and `H¹ = V_ℓ^∨` | arithmetic Frobenius on `V_ℓ` = `π_*`; on `H¹` it is `f ↦ f∘π^{-1}`; geometric Frobenius on `H¹` is `f ↦ f∘π`, the transpose of `π_*`, same characteristic polynomial `t² − a_v t + q_v` | holds (transpose argument needed, not stated; no change) | — |
| Check 1 (CM curve): `𝐆 = Res_{K/ℚ}G_m`, `γ_ℓ(v) = π`, same for every `ℓ` | `K`-module `H¹` of rank one, `π ∈ K` of §5.7 | geometric Frobenius on `H¹` is `f ↦ f∘π = π·f`, so `γ_ℓ(v) = π ∈ K^× ⊂ (K⊗ℚ_ℓ)^×`; `Conj_𝐆 = 𝐆` for a torus | holds | — |
| Check 2 (non-CM curve): `Conj_𝐆 = 𝔸¹×G_m`, `γ_ℓ(v) = (a_v, q_v)` | `n = 2`, `(tr, det)` of `t² − a_v t + q_v` | `(a_v, q_v)` with `a_v = q_v + 1 − #E(k_v)` | matches AGR §1.11's `GL_n` instance | — |
| Check 3 (Tate twist): scalar `q_v^{-1}`, `P_v ↦ q_v^{−2g} P_v(q_v t)` | `M` with `det(t − M) = P_v(t)`, `deg 2g` | `χ_ℓ(Frob_v^{geom}) = q_v^{-1}`; `det(t − q_v^{-1}M) = q_v^{−2g} det(q_v t − M) = q_v^{−2g}P_v(q_v t)`; `E^𝐆` unchanged since `q_v^{-1} ∈ G_m(ℚ_ℓ) ⊂ 𝐆(ℚ_ℓ)` | holds | — |
| Check 4 (unipotent): same image in `Conj_𝐆`, not conjugate | `𝐆 = GL_2`, `u = [[1,1],[0,1]]` | `χ(u) = (2,1) = χ(1)`; `u ≠ 1` not conjugate to `1` | holds for every `𝐆` that is not a torus (for a torus there is no nontrivial unipotent, and the Check is empty, not false) | — |
| §7.0i.1: `Conj_𝐆(ℚ) → Conj_{GL}(ℚ)` not injective | `𝐆 = Res_{K/ℚ}G_m`, `π ≠ π̄ ∈ K^×` | same characteristic polynomial `t² − (π+π̄)t + ππ̄`, distinct points of `Conj_𝐆(ℚ) = K^×` | holds | — |
| §7.0i.1: another embedding gives an inner form, same `Γ_E^𝐆`, `Conj_𝐆`, `γ_ℓ(v)` | `ι₂ = τ∘ι₁`, `τ ∈ Aut(ℂ)` | `𝐆₂` is the fixer of the `τ`-transports (§7.0i), `𝐆₁(ℚ_ℓ) ↦ 𝐆₂(ℚ_ℓ)` under `τ` on `H¹_ét`; inner by §7.5's `conjugatedDatum.group` (contracted product `S_τ ×^S G`) applied to the Hodge-type datum `(𝐆, X_h)`; `H//H` of inner forms coincide | holds; "unchanged" is modulo the identification `Γ_E ≅ τΓ_Eτ^{-1}` | — |
| §3.5a laws, §5.9a congruence, §0.1–0.2 commensurability, `CMType`, `reflexField_*`, Conventions, §§1.3, 1.5, 4.4, 4.9, 4.9a, 4.10, 5.1, 3.9, 8.17, 7.5, 7.0e, 8.1, 8.3, 8.6, 6.4, 8.5 rows (carried) | as in the review at e7d7bdc | as there | as there | — |

**Shape at the changed lines.** §7.0i.1 has a `**Target.**`, hypotheses in the sentence, a source, four Checks each with a computed value, and a "This uses" line naming its own and supplier sections; no process words, pull-request numbers, LaTeX or machine paths; the Dependencies line of Layer 7 names the four new suppliers "for §7.0i.1 only". The contracts and ownership record are R03.

## Not verifiable

- L. van den Dries, *Tame Topology and o-minimal Structures* (CUP 1998), cited at §3.5a for Chapter 4 §1: publisher landing page only; uncertified, as in the previous report.
- Kazhdan 1983, the Annals pagination of AGHMP, and the texts listed in the earlier reports outside the seeded sample: unchanged, not re-attempted. The seeded sample's targets (0.3, 0.4, 1.7, 2.2, 3.1, 4.4, 4.9, 5.3, 5.8, 5.13, 7.1, 7.2, 7.9, 7.11, 8.6) are untouched by the diff; the verification of the full review stands.
- The folder still carries no `sources.toml`; `deligne82` was read but is recorded in no manifest.

## Source issues

- **Gap** in deligne82 at Proposition 2.9(b), proof (iii), printed p. 19: the source says a Galois-stable positive definite form on the absolute Hodge classes shows the action factors through a finite quotient; it should also use a Galois-stable lattice (the classes integral in every `ℓ`-adic realization), since the rational orthogonal group of a positive form is infinite; affects nothing (proofs (i) and (ii) are complete).

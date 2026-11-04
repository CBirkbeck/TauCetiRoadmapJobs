# Review of DeformationAndDerivedPatchingAlgebra (pull request #1034 at 96614c5)

**Verdict:** accepted

Incremental re-review of the 86 changed lines since dc87c78 (44 insertions, 42 deletions in `README.md` and `Suggested.lean`; nothing outside the folder). Checked: the repair of each of the five previous findings; every changed passage (the scope and contract bullets for PurityOfBranchLocus, SchemeAndStackFoundations §§0.17 and 2.21, GrothendieckEulerForms Layer 5, the Tau Ceti group-algebra names and IntegralHeckeAndGaloisDeterminants §§2.1–2.2; §3.1's associated-prime depth bound, syzygy bound and regular-element reduction; §3.2; §3.3; §3.14; §5.5; §6.1; §9.2; §9.5; the references) against the suppliers as they are on main or at their open heads and against the pinned Tau Ceti; the gate and the dependency check rerun; elaboration of `Suggested.lean`, a `#check` of all 32 declarations and a one-tactic probe of all 18 theorems; and a computed adversarial pass over the changed statements, with the previous rows carried forward for the untouched ones. No blocking finding remains. Two notes (P3) are the author's to take or leave.

## R01 (P3) — The regular-element reduction of projective dimension has no locator that states it

**Location:** `README.md:564`: "Prove that killing an element of `m` regular on both `A` and `M` preserves projective dimension: `pd_(A/xA)(M/xM)=pd_A M` ... Source: Stacks, Algebra Lemma 10.72.6, tag 00LX, and §10.109, tags 0CXE, 0CXF, 065R, pp. 262–264."

**Claim:** the cited tags source the preservation statement.

**Witness:** Stacks §10.109 (tags 00O3–00O8, read at the tag pages) contains Schanuel's lemma, the equivalences "`pd M ≤ d` iff a finite free (0CXF) or finite projective (0CXE) resolution of length `d`", the Ext criterion (065R), and localization; no lemma on `M/xM` over `R/xR`. The proof of Proposition 10.110.1 (tag 00O7, stacks-algebra line 12478–12483) goes through Lemmas 10.106.6 and 10.104.9, not through this reduction. The inline argument of the README is correct: for `x` regular on `A` and `M`, `Tor_i^A(M,A/xA)=0` for `i>0`, so the minimal resolution reduces to an exact minimal finite free resolution of `M/xM` over `A/xA` of the same length; on `A=k[[x,y]]`, `M=A/(y)` both sides are `1`, and the DVR control (`π` not regular on `k`) gives `0≠1`.

**Repair:** keep the statement and its proof; cite the three §10.109 tags only for the resolution/projective-dimension comparison they state, and either give a locator for the preservation statement itself or say that it is proved here from the minimal resolution (one clause). While there, add "the regular-element reduction of projective dimension" to the list at `README.md:13` of what §§3.1–3.2 add beyond PurityOfBranchLocus §0.3, which currently omits it.

## R02 (P3) — One later use of maximal-depth freeness does not cite the supplier it is said to cite

**Location:** `README.md:564`: "the later uses of these two statements cite that supplier"; `README.md:1186` (§5.8): "If its source is regular of the appropriate localized `S_∞`-dimension and the finite patched module has that depth, Auslander–Buchsbaum gives freeness over the source completion".

**Claim:** every later use of Auslander–Buchsbaum or maximal-depth freeness cites PurityOfBranchLocus §0.3.

**Witness:** `README.md:1186` names neither the supplier nor the statement actually used (freeness of a maximal Cohen–Macaulay module over a regular local ring, `IsRegularLocalRing.free_of_isCohenMacaulay`); §§3.2 and 9.2 (`README.md:574,578,1754`) do cite it. On `S_∞`-completion of dimension `d` and a finite module of depth `d`, the conclusion is the supplier's `00NT`, not `090V`.

**Repair:** at `README.md:1186` write "PurityOfBranchLocus §0.3's `IsRegularLocalRing.free_of_isCohenMacaulay` gives freeness", or weaken `README.md:564` to "§§3.2 and 9.2 cite that supplier".

## Previous findings

- R01 — repaired: `auslanderBuchsbaum` is deleted from `Suggested.lean` (18 theorems remain); `README.md:13,80` add PurityOfBranchLocus §0.3 with `auslander_buchsbaum`, `IsRegularLocalRing.free_of_isCohenMacaulay`, `IsRegularLocalRing.globalDimension_le`, `isRegularLocalRing_tfae` and the minimal resolutions; §§3.1, 3.2, 9.2 consume them. All five statements exist with those hypotheses at `TauCetiRoadmap/PurityOfBranchLocus/README.md:162–232` on main (depth is SchemeAndStackFoundations §0.17's, as `README.md:80` says).
- R02 — repaired: `README.md:547–555` states the associated-prime depth bound as this roadmap's target with Stacks 10.72.9 (0BK4) and Calegari–Geraghty Lemma 6.1, a correct induction proof and three Checks; `README.md:78` lists the three §0.17 statements that section has (`depth_le_supportDim`, `depth_eq_zero_iff`, `IsCohenMacaulay.unmixed`, all at `SchemeAndStackFoundations/README.md:1145–1162`); `README.md:1242,1754` point at §3.1. No other roadmap on main or at an open head cites 0BK4 (roadmap grep), so this roadmap is the owner.
- R03 — repaired: `README.md:12,82` "§2.21 ... `DualizingComplex` and `NormalizedDualizing`" (SchemeAndStackFoundations `README.md:4390–4405`); `README.md:88` names only `HeckeImage.derived_hom_finite` (§2.1) and `HeckeImage.ghost_nilpotence` (§2.2) and describes the annihilator bound, local factors and idempotent summands in prose (IntegralHeckeAndGaloisDeterminants at its head, `README.md:2830–2932`); `README.md:15,85` cite the pinned `TauCeti.completedGroupAlgebra` (`TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145`, namespace `TauCeti`) and `TauCeti.MonoidAlgebra.augmentation` (`TauCeti/Algebra/MonoidAlgebra/Exactness.lean:115`), ProfiniteProPGroups Layer 9 and PadicMeasuresIwasawaAlgebras Layer 1's comparison (`PadicMeasuresIwasawaAlgebras/README.md:567–575`); `README.md:18,84,1845` state GrothendieckEulerForms Layer 5's finite-exact-sequence formula and Euler–Poincaré theorem (`GrothendieckEulerForms/README.md:383–397`) and derive triangle additivity in §9.5.
- R04 — repaired: the Pilloni locator is gone from `README.md:624`; the reference at `README.md:1945` drops §10, pp. 57–60; no other citation of Pilloni §10 remains.
- R05 — repaired: `Suggested.lean:220–224` has no `hp`, no `Algebra ℤ_[p] O`, `Module.Finite ℤ_[p] O` or `CharZero O`; `CharP (ResidueField O) p` ties `p` to `O`; `README.md:1105,1112,1114` state the theorem for a complete DVR with finite residue field in either characteristic and say what the source's proof uses; `README.md:1120` adds the `p=2` positive Check (its values are recomputed in the table below).

## Verified sound

**Gate and dependency check.** Rerun at 96614c5:

```text
gate DeformationAndDerivedPatchingAlgebra: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 205 roadmaps, 1400 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `git diff --stat origin/main...HEAD` outside the folder: empty. PurityOfBranchLocus is on main and cites neither this roadmap nor Part II. The folder holds `README.md`, `Suggested.lean`, `metadata.toml` only.

**Elaboration.** `lake env lean` on `Suggested.lean`: exit 0, exactly 18 `declaration uses sorry` warnings, nothing else. A scratch copy with `#check @name` for all 32 declarations (14 definitions and abbreviations, 18 theorems) elaborated; the elaborated type of `balanced_module_patching` keeps `IsAdicComplete (maximalIdeal O) O`, `Finite (ResidueField O)`, `CharP (ResidueField O) p`, `IsLocalHom (algebraMap O R)`, `IsAdicComplete (maximalIdeal R) R` and the two scalar towers; the other 31 types are unchanged from the previous review. A probe copy replacing every `sorry` by `first | rfl | (simp; done) | infer_instance | (simp_all; done) | (aesop; done)` left all 18 theorems unproved (18 errors), so none is padding by the one-tactic test. The module docstring no longer names Auslander–Buchsbaum; `residueExtDepth` is still used by `lescot_module_regular_iff`'s neighbour `cohenMacaulay_action_concentration` (`Suggested.lean:378,392`).

**Headline coverage.** Unchanged from the previous review except that Auslander–Buchsbaum is now a consumed supplier statement rather than a headline: the statable headlines (balanced and free-module patching, CM concentration, canonical duals, Lescot, finite actions, top local cohomology, Hilbert–Samuel, integral points, parafactoriality, minimal representatives) are stated; the hull bound, the patched functor and the spectral support statements are named in the docstring as not statable.

**Sources read this round.** Stacks tag pages 00LX (Lemma 10.72.6, the three depth inequalities for nonzero finite modules), 0CXE, 0CXF, 065R (Lemmas 10.109.6–10.109.8), the §10.109 contents (tag 00O2), 032A (Theorem 10.160.8, the Cohen structure theorem: a complete local ring with finitely generated maximal ideal is a quotient of `Λ[[x_1,…,x_n]]`, `Λ` a field or a Cohen ring); stacks-algebra line 12478–12483 (00O7 and its proof). The 0BK4 passage (stacks-algebra line 8100–8112) and Calegari–Geraghty Lemma 6.1 (cg2018 line 3568–3576, printed p. 385) were read in the previous round and the README's new statements match them. Of the seeded sample, §3.3 and §6.1 fall in the diff: §3.3 only loses the Pilloni locator (its remaining locators were verified at dc87c78); §6.1 only changes its Needs line, whose two inputs exist (`IsCohenMacaulay.unmixed` for the top-dimensional associated primes of an MCM module; §3.1's bound). The other thirteen sampled targets are untouched by the diff and stand as verified at dc87c78.

**Computed adversarial pass.** `k` a field, `O` a DVR with uniformizer `π`. New rows first (changed statements); the rows for untouched statements are carried from the review at dc87c78, where their values are recorded.

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| 3.1 associated-prime bound `depth M ≤ dim A/p` | `O⊕k`; `O/π²`; `k[[x,y]]/(x)` | depth `0`, `Ass={(0),(π)}`, `0≤1`, `0≤0` (not CM, `unmixed` inapplicable); depth `0`, `Ass={(π)}`, `0≤0`; depth `1`, `Ass={(x)}`, `1≤1` | Retain |
| 3.1 proof step `z=x^n z'`, `pz'=0`, `q⊇p+(x)` | `M=k[[x,y]]/(x)⊕k[[x,y]]`, `p=(x)`, `x↦y` regular | `z=(1,0)`, `n=0`, `z̄'≠0` in `M/yM`, killed by `(x,y)=q∈Ass(M/yM)`, `dim A/q=0=dim A/p−1`; induction `depth M−1=0≤0` | Retain |
| 3.1 submodule consequence `dim Supp N ≥ depth M` | `k⊂O⊕k`; `(x)⊂k[[x,y]]`; `H¹⊂K` for `[O→π O]` | `0≥0`; `2≥2`; `K=coker(O→πO)=k`, `pd K=1=m−a`, `depth K=0≥1−1`, `dim Supp H¹=0≥0` | Retain |
| 3.1 syzygy bound `depth K_j ≥ min(depth A, depth M+j)` | `O`, `M=k`; `k[ε]/ε²`, `M=k`; `k[[x,y]]`, `M=k` | `K_1=πO≅O`: `1≥min(1,1)`; all `K_j=k`: `0≥0`, pd infinite; `K_1=m`: `1≥min(2,1)`, `K_2=A`: `2≥min(2,2)` | Retain |
| 3.1 `pd_(A/xA)(M/xM)=pd_A M` | `k[[x,y]]`, `M=A/(y)`, `x`; `O`, `M=k`, `π` | `1=1`; `π` not regular on `k`: `pd_k k=0≠1=pd_O k` | Retain; R01 locator |
| 3.2 `isRegularLocalRing_tfae` use | `O`; `k[ε]/ε²` | `pd k=1=dim`, regular; `pd k=∞`, not regular | Retain |
| 3.14 F-finiteness via Cohen presentation | `k=𝔽_p(t)`, `e=1`; quotient `k[[x]]/(x²)`; non-Noetherian `𝔽₂⊕V` | `[k:k^p]=p`, `k[[x]]` free of rank `p²` over `k^p[[x^p]]` on `t^i x^j`, `0≤i,j<p`; quotient spanned by the same images; Frobenius module infinite-dimensional, not F-finite (Noetherian needed) | Retain |
| 5.5 `balanced_module_patching`, `p=2` | `O=ℤ₂`, `q=1`, `A=R=O`, `H=H_N=O`, trivial action; `O=𝔽₂[[π]]` likewise | `O[Z/2^N]` local, residue `𝔽₂`; presentation `O[Z/2^N]→(g−1)O[Z/2^N]→O→0`, ranks `(1,1)`, balanced; augmentation ideal acts by `0`, `ker φ_N=0`; conclusion rank `1` over `O`; same values in equal characteristic | Retain |
| 5.5 negative control | `H_N=O[Z/2^N]/π`, relation matrix `π` | balanced, `π`-torsion; scalar image `O[Z/2^N]` not inside the `A=O`-image, hypothesis fails | Retain |
| 9.2 derivation of `dim Supp H^m ≥ d−(m−a)` | `[O→π O]` in `0,1`; `[O[[x]]→x O[[x]]]` | `m=1`, `K=k`, `depth K=0≥0`, `dim Supp=0≥0`; `m=1`, `K=O`, `depth 1≥2−1`, `dim Supp H¹=1≥1` | Retain |
| 9.5 triangle additivity from the exact-sequence formula | `X=k[−1]`, `Y=0`, `Z=k[0]`; `X=Y=k[0]`, `Z=0` | `χ(X)=−1`, `χ(Z)=1`, `0=−1+1`; `1=1+0`; sign pattern of the long exact sequence `χ(X)−χ(Y)+χ(Z)=0` | Retain |
| Cochain convention, Tor index | as at dc87c78 | `Tor₁=k` in degree `−1`, `M[−b]` in degree `b` | Retain (dc87c78) |
| Dual and bidual signs (§7.6) | `P=[Q→2 Q]` | dual differential `+2`, bidual `−2`, evaluation `(+1,−1)` | Retain (dc87c78) |
| 1.1, 1.2, 1.4, 1.5, 1.7, 1.8 | as at dc87c78 | Rees pieces `(A,0,…)`; `t⁵` class nonzero/zero; `0−1=0−1`; colength `2`; `ℤ/4`, `ℤ/8`; `𝔽₂`, `ℤ/8`, `ℤ₂` | Retain (dc87c78) |
| 1.9 `seriesPresentation_surjective` | `O→O`; `O[[x,y]]→O[[x]]`; `O→O[[x]]` | onto; onto; `hcotangent` fails, not onto | Retain (dc87c78) |
| 1.12, 1.13 `flatCompletion_finiteComparison`, 1.14, 1.15 | as at dc87c78 | `k²`; both sides `O/π^s`, both `0`; two factors of `5`; `I^(2n−1)⊂(xⁿ,yⁿ)`, degree `2n−2` outside | Retain (dc87c78) |
| 2.1, 2.3, 2.6, 2.8 | as at dc87c78 | `J=(π)⊄m_S²`; `[X²]↦t²≠0`; `k[[X]]/X²` vs `X(2+X)`; `t²` coefficient fixed | Retain (dc87c78) |
| 3.1 zero-endpoint extension | `0→0→M→M→0`; `0→O→O→k→0` | `(∞,d,d)`; `(1,1,0)`: `1≥0`, `0≥0`, `1≥1` | Retain (dc87c78) |
| 3.2 `lescot_module_regular_iff`, Koszul | `O/π²`; `k[ε]/ε²`; lists | identity on `k`; zero map; `H₁=0,0,k` | Retain (dc87c78) |
| 3.3 `finiteProjectiveFaithful_of_equalDimensionDomains` | `A=D=O`; `D=O[[t]]` | finite faithful projective; `dim 2≠1` excluded | Retain (dc87c78) |
| 3.4, 3.6, 3.7 `localCohomology_top_nonzero`, 3.8, 3.9, 3.10 | as at dc87c78 | height `1`, two generators; `z∉p`, `x∉p²`; top degrees `0,1,1`; `Ô[1]≠O[1]`; socle `1`-dimensional; `T²+2T` | Retain (dc87c78) |
| 3.11 `hilbertSamuel_polynomial`, 3.12, 3.13 `multiplicityOne_regular`, 3.15 | as at dc87c78 | `r`, `n+1`, `(n+1)(n+2)/2`; `e=r`; `e=2` not regular, `e=1` embedded `m`, `P=1` regular; defects `3,1,0` | Retain (dc87c78) |
| 4.1, 4.2 `exists_integral_point_of_not_nilpotent`, 4.4, 4.5, 4.6 | as at dc87c78 | finite not flat; `ℤ_(5)[i]` semilocal, map local; `Ω_(ℚ_p/ℚ)` infinite; `L[ε]/ε^p≠L`; no `O`-point | Retain (dc87c78) |
| 5.1 defect and square presentation | `O^r⊕T`; non-minimal `S^d→S^d` | `r−dim(Tor₁/π)`; kernel `K'⊕S^(d−β₀)` | Retain (dc87c78) |
| 5.6 `patching_surjection_iso` and route | `r=0`; `r=1`; `R=O/π^k` | `finrank=s`; rank one, augmentation `O`; forces `R=O` | Retain (dc87c78) |
| 6.4, 6.6, 6.7, 6.8, 6.9 `localCI_parafactorial` | as at dc87c78 | `ann⊋I`; `0≥0`; `2[(x)]`, `2[(ε)]`; multiplicity `4`; `(x,z)` nontrivial in dim `3` | Retain (dc87c78) |
| 7.3 `minimal_finiteFree_representative`, 7.5 `completeFlat_minimal_retract`, 7.6, 7.8, 7.9 | as at dc87c78 | ranks `(1,1)`; `∩πⁿE=E` excluded; `ℤ₂=completion(ℤ_(2))`; `Hom_D(k,O)=0`; exponent `2` | Retain (dc87c78) |
| 8.1, 8.3, 8.4, 8.6 | as at dc87c78 | `H⁰=H¹=k` vs `0`; `4` endomorphisms; `[[x,0],[1,x]]`; `H⁰=H¹=k` after | Retain (dc87c78) |
| 9.1, 9.2 `codimension_amplitude_inequality`, `balanced_dimension_concentration`, `cohenMacaulay_action_concentration` | as at dc87c78 | `max(1,2)=2`; `0≥0`; `pd=depth=1`, `dim Supp=1`; `depth_R N=0=dim R`, `pd_S N=1` | Retain (dc87c78) |
| 9.3 `patched_dual_concentration`, `finiteActionCanonicalDuality_ext`, 9.5 length defect, 9.6, 9.7 | as at dc87c78 | `H⁰(D)=O/π`, `H⁻¹=0`; `Ext¹_O(k,O)=k`, `O=O`; `2=1·2`; empty intersections; `ℚ((X))≠0` killed by `π⁻¹` | Retain (dc87c78) |

**Pinned declarations opened this round** (Tau Ceti `a91d3aaf`): `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:103,145` (`namespace TauCeti`, `def completedGroupAlgebra`); `TauCeti/Algebra/MonoidAlgebra/Exactness.lean:103–115` (`TauCeti.MonoidAlgebra.augmentation`); `TauCeti/Algebra/MonoidAlgebra/Dual.lean:31` (`dualLinearEquiv`). The Mathlib declarations of the Lean file are unchanged from dc87c78.

**Cross-roadmap citations resolved this round** (main at fa41b37; open heads through the roadmap service): PurityOfBranchLocus §0.3 `README.md:162–232` (all five names, minimal resolutions, depth from §0.17); SchemeAndStackFoundations §0.17 `README.md:1138–1162` (`depth_le_supportDim`, `depth_eq_zero_iff`, `depth_quotSMulTop`, `IsCohenMacaulay.unmixed`, `depth_shortExact` tagged 00LX) and §2.21 `README.md:4390–4405`; EnhancedDerivedSheaves §E1.6 `README.md:689,768` (`completeNoetherianLocal_cohenPresentation`, Stacks 032A); GrothendieckEulerForms Layer 5 `README.md:383–397`; PadicMeasuresIwasawaAlgebras Layer 1 `README.md:567–575`; Completed/ProfiniteProPGroups `README.md:66,1735–1744` (`TauCeti.completedGroupAlgebra`); IntegralHeckeAndGaloisDeterminants at its head `README.md:2830–2842,2895–2932`. Ownership of the associated-prime depth bound: no other roadmap on main or at the 424 open heads cites tag 0BK4 (roadmap grep); PurityOfBranchLocus §0.3 does not state it.

## Not verifiable

- Calegari–Geraghty Lemma 6.1 at printed p. 385: the cached text of the previous round (cg2018) is not in the sources cache under that key any more; the locator stands on the previous review's reading (cg2018 line 3568–3576) and was not re-read.
- The items of the previous review's Not verifiable list (Avramov's book chapter, the Calegari–Geraghty correction, the untouched locators) are unchanged by the diff and were not re-read.
- The universal statements are not Lean proofs: elaboration, the probe and the table record instances, not proofs of the eighteen theorems.

## Source issues

- none

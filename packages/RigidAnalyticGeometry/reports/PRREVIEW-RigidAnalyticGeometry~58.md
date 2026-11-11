# Review of RigidAnalyticGeometry (pull request #1807 at 096aff5)

**Verdict:** accepted

This is an incremental re-review of `TauCetiRoadmap/RigidAnalyticGeometry/`, covering the 2 lines that changed since `8d98b44`. The one changed sentence is `README.md` line 65. The two previous findings could only be repaired in AdicSpacesPartIII, which this pull request now changes (commit `c625f81`). Both are repaired, and I found no new problem in this folder. The gate fails only on files in the pull request's own folders, which is not a finding.

## Previous findings

- R01 — repaired: AdicSpacesPartIII line 605 now reads "Formal functions for proper coherent cohomology and the stable principal filtration, Kiehl's Theorems 3.4 and 3.7". Lines 11030–11080 prove them from *proper-affinoid-cohomology-finite* and Rees-ring finiteness. Part III no longer mentions RigidAnalyticGeometry §7.5.
- R02 — repaired: README lines 64–65 read "AdicSpacesPartIII R3.6 *affinoid-completed-field-extension*, downstream, cites it." Part III lines 11119–11128 say "RigidAnalyticGeometry §1.3 owns this theorem and its proof; it is cited here under this name", with *Needs:* RigidAnalyticGeometry §1.3.

## Verified sound

**Gate, build and dependencies.**
- I ran the gate myself. Every check is 0 except `outside-folder=23`.
  - The 23 hits are the README and `Suggested.lean` of eleven folders (AdicSpacesPartIII, AlgebraicCurves, AlgebraicTopology, BordismFormalGroups, CharacteristicClasses, ClassifyingSpaces, GeneralizedCohomology, LocalPurity, PadicFunctionalAnalysis, PurityOfBranchLocus, TopologicalKTheory), plus the ComplexKahlerGeometry README.
  - The brief names all twelve folders as this pull request's own, so these hits are not findings.
- The worker's gate (`gate.md`) passes every check, with `build=0`.
- `git diff --stat origin/main...HEAD`, excluding this folder and the twelve own folders, is empty.
- `lake env lean` on `TauCetiRoadmap/RigidAnalyticGeometry/Suggested.lean` exits 0. Its only output is twelve `declaration uses sorry` warnings, at lines 94, 110, 127, 136, 154, 169, 190, 204, 229, 242, 264 and 282.
- `lake-manifest.json` and `lean-toolchain` are unchanged since `8d98b44`, so the pins are the same.
- Dependency check (verbatim): `depcheck: 236 roadmaps, 2142 edges, 0 problem(s)`.

**`Suggested.lean`.**
- The file is unchanged since `8d98b44`, so the previous reviews' results still hold:
  - the `#check @` comparison of the twelve signatures with the README;
  - the one-tactic padding probe, in which none of the twelve closes;
  - no `set_option`, no `lemma`, no definition and no sorry'd data.
- `signatures.md` reports no dropped section binder.

**R01 repair, checked against [Kiehl-E] at the locators the repair cites.**
- Part III line 11041 cites "Definition 3.1 and Theorem 3.4, p. 206". Both are on p. 206 (KiehlE lines 630–660).
- The new statement asks for `R_0=M`, `aR_k⊆R_{k+1}` and `aR_k=R_{k+1}` for large `k`. This agrees with Definition 3.1 (lines 632–636), and `R_0=ker(M→Hⁱ(X,0))=M`.
- Kiehl's "Nullsystem" (lines 640–641) only asks for vanishing for `i≥i₀`. The README states the stronger form "for every `k`", and it holds:
  - `R_{k+k₀}=aᵏR_{k₀}⊆aᵏM`, so `d=k₀` works;
  - with `e=k₀+m`, the map `Q_{k+e}→Q_k` factors through a vanishing map `Q_{j+m}→Q_j` with `j≥k₀`.
- **The route, pp. 207–209 (lines 667–744).** Each step matches Kiehl:
  - the Rees ring is a quotient of `A[T]` (line 685);
  - the torsion-free case is generated in degree 0 (lines 694–699);
  - the torsion subsheaf `E=ker aⁿ` is handled by Artin–Rees (lines 700–704);
  - `N^r→M^r(F)→M^r(F/E)` is exact (lines 711–716);
  - `R_k=im(Hⁱ(aᵏF)→M)` and `Q_k=ker(Hⁱ⁺¹(aᵏF)→Hⁱ⁺¹(F))` (lines 724–726);
  - the transition takes `a'ˢx` to `aˢx=0` (lines 736–744).
- **The induction for Theorem 3.7.** Kiehl states the theorem on p. 210 (lines 809–817) and gives only "by induction on the number of generators". The README writes the induction out, and I checked each step:
  - cofinality `𝔞²ᵏ⊆𝔟ᵏ+aᵏA⊆𝔞ᵏ`;
  - the hypothesis for `𝔟` applied to `F/aˡF`, with `Hⁱ(X,F/aˡF)` finite;
  - flatness of the `𝔟`-adic completion, which keeps both systems pro-zero;
  - `(M/aˡM)⊗Â=lim_k M/(𝔟ᵏ+aˡA)M`, whose limit over `l` is `M^∧_𝔞`.
- The Satz 3.5 locator was corrected to pp. 209–210 (line 11096). Satz 3.5 starts on p. 209 (line 747) and its proof ends on p. 210 (line 806).
- The Mathlib names in the repaired *Needs:* (lines 11075–11080) exist at the pin:
  - `reesAlgebra` (`RingTheory/ReesAlgebra.lean:40`), with its noetherian instance at `:131`;
  - `Ideal.Filtration` (`RingTheory/Filtration.lean:53`), `Stable` (`:174`), `submodule_fg_iff_stable` (`:337`) and `Ideal.exists_pow_inf_eq_pow_smul` (`:389`);
  - `AdicCompletion.flat_of_isNoetherian` (`RingTheory/AdicCompletion/AsTensorProduct.lean:378`) and `ofTensorProductEquivOfFiniteNoetherian` (`:327`).
- Part III's README and `Suggested.lean` no longer mention RigidAnalyticGeometry §7.5: `grep §7.5` finds nothing. The `Suggested.lean` docstring at line 51 now names *proper-cohomology-adic-completion*.
- So this README's row at line 74 (§7.5 → Part III R3.6 *proper-cohomology-adic-completion*) is now a true ownership statement. Its statement matches Part III's. Its locators (Theorem 3.4 on p. 206, Theorem 3.7 on p. 210, Rees-ring finiteness on pp. 206–208) match KiehlE lines 647, 809 and 678–716.

**R02 repair and the changed sentence (README lines 62–65).**
- Part III's *affinoid-completed-field-extension* (lines 11119–11128) now restates §1.3 (README lines 783–800) and cites it. The two agree:
  - both assert that `A→A_L`, `a↦a⊗1`, is faithfully flat;
  - both assert that `A_L⊗_A M→L⊗̂_K M` is a topological isomorphism for finite `M`.
- The carriers match at the pin:
  - `Huber.CompletedTensor A B C` is `Completion (B ⊗[A] C)` (`TauCeti/RingTheory/Huber/TensorProduct/Completion.lean:73`), so `Huber.CompletedTensor K A K'` is §1.3's `A⊗̂_K L`;
  - `Huber.BanachModule.CompletedTensor` is at `TauCeti/RingTheory/Huber/BanachModule/CompletedTensor.lean:201`.
- §1.3 is now the only statement of this theorem:
  - `roadmaps grep` for the target name, Conrad Lemma 1.1.5 and Theorem A.1.2, and "completed field extension" finds only citations of it;
  - those citations are Part III line 11146, AdicSpacesPartIV lines 2521 and 2894 on main and at #1187, PadicFamilies (#1019) line 70, and PadicFunctionalAnalysis, which supplies §2.4 to §1.3.
- The other sentences that mention Part III remain true after the change: lines 12, 31, 944, 1100, 1133, 1827 and 2256–2262, where "the affinoid algebras `A_L` of §1.3" are consumed by Part III.

**Citations resolved this round.**
- **SchemeAndStackFoundations §0.21.**
  - This pull request no longer changes that folder: its diff from main is empty, since #1276 merged into main. So I resolved §0.21 against main, at lines 1548–1617.
  - It defines `IsJ2` with `.of_finiteType` and `.localization`, proves *IsGRing.of_finiteType* (07PV) and `regular_map_completion` (reducedness and normality; `A→Â` regular for a local G-ring), and proves `excellent_examples`.
  - It states neither the J-2 criterion (07PC) nor the G-ring criterion (07PT). The claims at README lines 141, 352–355, 658–659, 684–688 and 730–731 therefore hold.
- **Other suppliers.** RestrictedPowerSeries, PadicFunctionalAnalysis and AdicSpaces have the same README as at `8d98b44`. Only PROGRESS and STATUS files changed.
- **Leads.** `citations.md` lists no unresolved citation or Lean name.

**Overlaps.**
- `overlaps.md` lists no dropped ids and no id that only an open revision defines.
- #1808 and #1854 still carry the older wording of this folder (#1808 README line 67 hands §1.3's theorem to Part III). The description's shared-folder block orders "`RigidAnalyticGeometry`: **this pull request** → #1808 → #1854", so they rebase onto this one.
- No other open pull request changes AdicSpacesPartIII: `roadmaps list` shows only #1807.
- Ownership against open pull requests was checked through `roadmaps grep` over all 439 open heads.

**Seeded sample.**
- None of the sampled targets falls in the changed sentence. The README flags no locator as unverified.
- The locators this round depends on are the [Kiehl-E] locators above, each read at its page.

**Adversarial table.**
- Rows marked "r57" or "r56" are carried forward from `PRREVIEW-RigidAnalyticGeometry~57` (which carried the r56 rows), for statements the diff leaves untouched.
- The other rows are new, computed with `0<|ϖ|<1`.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Line 74, Theorem 3.4 (Part III R3.6) | `A=K⟨T⟩`, `a=T`, `X=Sp A`, `F=𝒪⊕𝒪/(T)`, `i=0` | `M=A⊕K`; `R_k=TᵏA⊕0` for `k≥1`, `TR_k=R_{k+1}` for `k≥0`; `E=0⊕K`, `TᵏF∩E=0` for `k≥1`; `Q_k=0`; `M^∧_T=K⟦T⟧⊕K=lim(A/Tᵏ⊕K)` | true | none (R01 repaired) |
| Same, nonzero but pro-zero cokernel system | `X=P¹_A→Sp A`, `F` the extension `0→𝒪(−2)→F→𝒪→0` with class `T∈H¹(𝒪(−2))=A`, `i=0` | `M=ker(A→A, ×T)=0`; `H⁰(F/TᵏF)=ker(×T on A/Tᵏ)=T^{k−1}A/TᵏA≅K`, so `Q_k=K` for `k≥1`; the transition sends `Tᵏ` to `0` mod `Tᵏ`, so `e=1`; `lim=0=M^∧` | true; the "for every `k`" form holds | none |
| Same, torsion-free degree-one generation | `X=P¹_A`, `F=𝒪(−2)`, `i=1` | `M=A`; `R_k=TᵏA`; `H¹(F/TᵏF)=A/Tᵏ`, `Q_k=0`; `K⟦T⟧≅lim A/Tᵏ` | true | none |
| Part III Checks `a=0`, `a=1` | `F` arbitrary | `a=0`: `R_0=M`, `R_k=0` and `aR_0=0=R_1`; `a=1`: `F/aᵏF=0` for all `k≥0`, `R_k=M` | true | none |
| Line 74, Theorem 3.7 induction | `A=K⟨S,T⟩`, `X=Sp A`, `F=𝒪`, `i=0`, `𝔞=(S,T)`, `𝔟=(S)`, `a=T` | `𝔞⁴∋S²T²∈(S²,T²)⊆𝔞²`; for fixed `l`, `(A/Tˡ)^∧_S=(K⟨T⟩/Tˡ)⟦S⟧`; the limit over `l` is `K⟦S,T⟧=A^∧_𝔞` | true | none |
| Lines 62–65 and Part III *affinoid-completed-field-extension* | `L=K`; `A=K`; `M=0`; `A=K⟨T⟩/(T²)`, `[L:K]=∞` | `A_K=A`, the identity; `K→L` faithfully flat; both sides `0`; `A_L=L[T]/(T²)`, free over `A`; Part III's carrier `Completion(A⊗[K]K')` is §1.3's | true; one owner | none (R02 repaired) |
| §0.21 row and contract (lines 141, 352–355), re-resolved on main | SchemeAndStackFoundations lines 1548–1617 | `IsJ2`, *IsGRing.of_finiteType*, `regular_map_completion`, `excellent_examples`; no 07PC or 07PT | true | none |
| (a) J-2 criterion | r57: `R=0`; `R=K`; DVR `A` of Tag 00PB | as in r57 | true | none |
| (b) G-ring criterion and product step | r57: `R=K`; `K⟨T⟩` at `(T)`; `A` of Tag 00PB; char `p`, `L=Frac(R)(T^{1/p})` | `K((T))` a field; nilpotent `y−b` in `(Ŝ)_𝔭`; `K((U))` | true; sharp on `A` | none |
| char-0 step (Matsumura 102 at `Tₙ`) | r57: `n=0`; `n=1`, `K=ℚ_p` | heights 0 and 1; `d/dT` preserves `|k·a_k|→0` | true | none |
| §1.2 one-variable Check | r57: `K⟨T⟩` at `(T)`; `A[b]` of Tag 00PB | `K⟦T⟧` reduced; `k⟦x⟧[y]/((y−b)^p)` nonreduced | true | none |
| `isWeaklyStable_gaussFractionField` | r56: `n=0`; char `p`, `L=Frac(T₁)(S)`, `S^p=T` | `Frac(T₀)=K`; spectral norm `≥|a₀|`, `C=1` | true | none |
| `isJapanese_of_isAffinoidAlgebra` | r56: `K⟨T⟩` char `p`; `K⟨T⟩×K` | closure `K⟨S⟩` free on `1,…,S^{p−1}`; excluded by `[IsDomain A]` | true | none |
| `isGRing_of_isAffinoidAlgebra` | r56: `A=0`; `A=K`; `K⟨T⟩` at `(T)` | no primes; `K→K̂=K`; formal fibre over `(0)` is `K((T))` | true | none |
| `isOpen_regularLocus_of_finiteType` | r56: cusp in char 2, 3 and other; `B=0` | Jacobians `(x²,0)`, `(0,2y)`, `(−3x²,2y)` vanish on the curve only at the origin; `∅` | true | none |
| `exists_norm_le_mul_supSeminorm` | r56: `K⟨T⟩/(T²)`; doubled Gauss norm | `‖T‖=1`, `|T|sup=0`, excluded by reducedness; `C=2` | true | none |
| `exists_eq_iUnion_rationalDomain` | r56: `A=0`; `U=Sp A`; annulus; `g=T` with no `f` | `n=0`; `g=1`; `R(T;ϖ)`; `{T≠0}` excluded by the unit-ideal clause | true | none |
| `isSheaf_affinoidSubdomain_presheaf` | r56: Laurent cover; `A=0` | `vₙ=0` for `n<0`, glue in `K⟨T⟩`; `F(∅)=0` | true | none |
| `exactAt_cechComplex_of_cover` | r56: one-member cover; `ι=∅` | `d⁰=0`, `d¹=id`, `Hⁿ=0` for `n≥1`; `Max A=∅` | true | none |
| `isGRing_stalk`, `isUniversallyCatenary_stalk` | r56: cusp; origin of `(XY,XZ)` | `K⟦t²,t³⟧` with fibre `K((t))`; minimal primes of coheight 2 and 1 | true | none |
| `closure_range_maximalSpectrumToSpa`, `dense_range_maximalSpectrumToSpa` | r56: `A=K`; `v(ΣaₙTⁿ)=|a_k|εᵏ`; rank-two point | `L_K={|·|}`; `v∈L_A∖Spa`; proconstructible singleton without a classical point | true | none |
| §0.1, §1.2 `[K:K^p]=∞`, §1.5, §2.2, §2.3, §3.1, §4.3, Kisin, §5.3, §6.2, §6.3, §8.1, §8.2 QE, §8.3 Checks | r56/r57 values | as computed there | true | none |

**Remarks on text outside this folder, no change requested here.**
- AdicSpacesPartIII README line 11089 repeats the end of line 11088: "for `X = Spa A`, `F = O`, it is `Â ≅ lim A/𝔞ᵏ`." The R01 repair left this line as stray context. It is for AdicSpacesPartIII's own review, and it does not touch any statement of this roadmap.
- The generated `merge-order` block of the description still lists #1276, #1676, #1234 and #1652, which are on main, as predecessors. Its shared-folder list still names `ReductiveGroups` and `SchemeAndStackFoundations`, which this head no longer changes. The `RigidAnalyticGeometry` row is correct.

## Not verifiable

- [BGR] and [Prestel] are recorded as `uncertified` and are settled. This round touches none of their locators.
- [Matsumura] Theorem 102 (§1.2, untouched this round) still has no entry in the roadmap's `sources.toml`, and I did not read it. As in the previous review, its inputs match [Conrad] lines 131–134.

## Source issues

- none

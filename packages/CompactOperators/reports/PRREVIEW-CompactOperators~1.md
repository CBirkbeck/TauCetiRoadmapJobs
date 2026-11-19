# Review of CompactOperators (pull request #2546 at 5c8e02a)

**Verdict:** needs changes

**Summary.** Changes are needed: there are two findings, both about `Suggested.lean` as the roadmap's acceptance test. First, two headline statements can be stated at the pins (both elaborate) but are missing: the Riesz decomposition and the index-zero half of the Fredholm headline. Second, the file restates seven supplier definitions that the pinned Tau Ceti already implements, although the repository's rules say to prototype against implemented APIs. The README's mathematics held up: every Check and worked example I recomputed is true, and the locators I could read (Serre, Johansson–Newton, Schikhof, De Grande–De Kimpe, Kedlaya) support what is claimed. There are five small corrections and three format notes, none blocking; the human reviewers have three questions to settle (two about the licences of linked copies, one about how the acceptance test should relate to Tau Ceti's own implementation of this roadmap).

## R01 (P2) — The Riesz decomposition and the index-zero half of the Fredholm headline can be stated at the pins but are missing from `Suggested.lean`

As it stands, the acceptance test checks neither the README's third headline (summary, lines 29–34; §3.4) nor the "of index zero" in its second (lines 27–28; §3.2), so a finished roadmap could pass it without proving either. The module docstring (lines 33–37) says §3.4 cannot be stated because the determinants of the two summands live on (Pr) modules. The file already avoids that problem, though: `charPowerSeries_eq_mul_of_comm` (lines 271–276) reads the summand determinants on the whole model space, as `charPowerSeries (u * p)` and `charPowerSeries (u * (1 - p))`, and README §1.6 (lines 491–493) calls the two readings equivalent. Using the same device, the following elaborates at the pins when appended to a copy of the file, with `sorry` its only warning:

```lean
theorem exists_rieszColemanProjection {u : C₀(I, R) →L[R] C₀(I, R)} (hu : IsRowCompact u)
    {Q : R[X]} {S : PowerSeries R} (hQ0 : Q.coeff 0 = 1) (hQ : IsUnit Q.leadingCoeff)
    (hS : IsEntire S) (hS0 : PowerSeries.coeff 0 S = 1)
    (hcop : ∃ A B : PowerSeries R, IsEntire A ∧ IsEntire B ∧ A * (Q : PowerSeries R) + B * S = 1)
    (hH : charPowerSeries u = (Q : PowerSeries R) * S) :
    ∃ E : C₀(I, R) →L[R] C₀(I, R), E * E = E ∧ Commute u E ∧ IsOpLimitAeval u E ∧
      IsRowCompact E ∧
      LinearMap.range E.toLinearMap = LinearMap.ker (Polynomial.aeval u Q.reverse).toLinearMap ∧
      (∃ w : C₀(I, R) →L[R] C₀(I, R), Polynomial.aeval u Q.reverse * w = 1 - E ∧
        w * Polynomial.aeval u Q.reverse = 1 - E ∧ E * w = 0 ∧ w * E = 0) ∧
      Module.Finite R (LinearMap.range E.toLinearMap) ∧
      Module.Projective R (LinearMap.range E.toLinearMap) ∧
      (∀ p, Module.rankAtStalk (R := R) (LinearMap.range E.toLinearMap) p = Q.natDegree) ∧
      charPowerSeries (u * E) = (Q : PowerSeries R) ∧ charPowerSeries (u * (1 - E)) = S
```

The (Pr) form also elaborates. It needs a module `M` with `[IsBoundedSMul R M]`, maps `i : M →L[R] C₀(I, R)` and `r : C₀(I, R) →L[R] M` with `r.comp i = id`, and `H_u := charPowerSeries (i.comp (u.comp r))`; each summand determinant is then read as `charPowerSeries (i.comp ((u * E).comp r))`. For the index, `(1 - a • u).IsFredholm ∧ (1 - a • u).index = 0` elaborates using Mathlib's `LinearMap.index`. `isFredholm_one_sub_smul` (line 388) states only the first conjunct, although README §3.2 (lines 769–770) asks for index zero and Serre proves it in the corollary to Prop. 12 (p. 82). The smallest fix is to add the Riesz–Coleman statement in either form and the index conjunct, and to take §3.4 off the docstring's list of statements that are not given.

## R02 (P2) — `Suggested.lean` restates seven supplier definitions that the pinned Tau Ceti already implements, instead of importing them

The repository README's rule "Import existing Tau Ceti APIs" requires prototyping against an earlier roadmap's implemented targets rather than a private stand-in. Here the acceptance test is stated in terms of `TauCetiRoadmap.CompactOperators.matrixCoeff`, `IsTate`, `opNorm` and so on. A Tau Ceti theorem about the library objects therefore cannot discharge it until someone proves that each copy agrees with the library object.

Lines 56–111, 330 and 341 define `IsMultiplicative`, `PseudoUniformizer`, `IsTate`, `opNorm`, `single`, `matrixCoeff`, `IsEntire`, `evalAt` and `hasseEval`. The pinned Tau Ceti has the same definitions:

- `TauCeti.NormedRing.PseudoUniformizer` and `TauCeti.NormedRing.IsTate` (`TauCeti/Analysis/Normed/Ring/PseudoUniformizer.lean:136, 150`);
- `ContinuousLinearMap.ringOpNorm` (`TauCeti/Analysis/Normed/Operator/RingOpNorm.lean:149`, the same `sInf` formula);
- `ZeroAtInftyContinuousMap.single` (`TauCeti/Topology/ContinuousMap/ZeroAtInfty/Discrete.lean:131`);
- `ContinuousLinearMap.matrixCoeff` (`TauCeti/Topology/ContinuousMap/ZeroAtInfty/Matrix.lean:90`, also `u (single j 1) i`);
- `PowerSeries.IsEntire` (`TauCeti/RingTheory/PowerSeries/Entire/Basic.lean:76`);
- `PowerSeries.evalAt` (`TauCeti/RingTheory/PowerSeries/EvalAt.lean:96`);
- `PowerSeries.hasseDeriv` (`TauCeti/RingTheory/PowerSeries/HasseDeriv/Basic.lean:72`).

README Convention 3 (lines 85–87), the supplier contracts (lines 1191–1217) and PadicFunctionalAnalysis §0.4 on main already name these as pinned.

The smallest fix is to import the modules above (`TauCeti.Analysis.Normed.Ring.PseudoUniformizer`, `…Operator.RingOpNorm`, `TauCeti.Topology.ContinuousMap.ZeroAtInfty.Discrete`, `….Matrix`, `TauCeti.RingTheory.PowerSeries.Entire.Basic`, `….EvalAt`, `….HasseDeriv.Basic`) and delete the local copies. `opNorm_eq` goes as well, since `ContinuousLinearMap.ringOpNorm_eq_opNorm` covers it. Write `hasseEval a F h` as `(PowerSeries.hasseDeriv h F).evalAt a`, and update Convention 10 (lines 127–135) and the last sentence of §2.1 (lines 594–595). I checked that `isUnit_one_sub_smul_iff` and `charPowerSeries_isEntire` elaborate against these imports. Tau Ceti's `single` and `matrixCoeff` take a `DecidableEq` argument, which the file's `open scoped Classical` already supplies.

## C01 — Four declarations in `Suggested.lean` ask an implementer for nothing

None of these is a headline:

- `opNorm_eq` (line 87) is `rfl`.
- `IsRieszProjection.eq_zero_of_order_zero` (line 378) is already proved by `simpa` from the definition, because at `h = 0` the relevant conjunct reads `1 * E = 0`.
- `isFiniteRank_iff_range_fg` (line 131) closes with one `exact`, using `Submodule.FG.of_le` for one direction and `le_rfl` for the other.
- `IsFiniteRank.isCompletelyContinuous` (line 136) follows by taking `v = u`, since `opNorm 0 = sInf (Set.Ici 0) = 0`; the proof is four lines.

You could mark them as sanity checks in their docstrings, or move them to the README as Checks. `opNorm_eq` disappears anyway once R02 is fixed.

## C02 — Several targets whose field or Noetherian case is published have no locator at the claim

The Dependencies paragraphs cite whole sections ("Serre §§3–5"), but the claims themselves carry no locator. Each of these was checked at the locator and could be added at its claim:

- §§1.2–1.3, entirety and the coefficient bound: Serre §5, Prop. 7(a)–(b), pp. 75–76. Continuity in operator norm: Prop. 8, p. 77.
- §1.4, cyclicity: Prop. 7, Cor. 2, p. 76.
- §2.4, multiplicativity at one: Prop. 7, Cor. 1, p. 76. Entire resolvent: §6, Prop. 10, p. 78.
- §2.5 over `K`: §7, Prop. 11, p. 80.
- §3.1: the projector `p = (Cb)ʰ` is the `eʰ` in the proof of §7, Prop. 12, pp. 80–81.
- §3.4, Noetherian case: Johansson–Newton, Theorem 2.2.2, p. 10.
- The locally compact converse in §0.5: Serre §3, Prop. 5, p. 73.

The README's remark that the ring-scalar versions are proved here can stay as it is.

## C03 — §1.7 does not cite AdicSpacesPartII §R0.5(f), which already owns the field case of `Θ_φ`

On main, AdicSpacesPartII §R0.5(f) (README lines 2825–2840) states `E ⊗̂_L V ≅ c₀(I, E)` isometrically for `V` with an orthonormal basis. When `R = L` is a field and `S` is a Banach `L`-algebra, §1.7's `Θ_φ` (lines 510–520) is that statement. The scope section (lines 1147–1149) says only that "the general ring-scalar `c₀` comparison" is §1.7. One clause would settle it: cite (f) for the field case and call §1.7 its ring-scalar variant.

## C04 — The description does not say that thirteen proposed Lean names have left the README

The head no longer puts these main-branch names in code font (main README lines 453, 690–696, 719, 751–752): `colemanD`, `colemanD_eq_colemanDBounded`, `colemanDBounded_add_of_coeff_zero`, `colemanDBounded_of_natDegree_le`, `charPowerSeries_map`, `colemanDSeries`, `colemanDEntire_coe`, `colemanDEntire_mul`, `norm_coeff_colemanDBounded_le`, `tendsto_colemanMajorant`, `IsRowCompact.of_tendsto_opNorm_sum_pow`, `IsRieszColemanProjection` and `exists_rieszColemanProjection`. LocallyAnalyticDistributions (lines 207 and 235–238) still names the first five as this roadmap's interface; at the pin they exist only as Tau Ceti declarations. One sentence in the description would do: "Proposed Lean names that `Suggested.lean` does not declare are now described in prose; LocallyAnalyticDistributions' table names five of them, which exist in the pinned Tau Ceti."

## C05 — The three Checks of §2.2 repeat RestrictedPowerSeries §7.2's own Checks

Lines 625–628 repeat RestrictedPowerSeries README lines 761–764: the division of `T³` by `T² + aT + b`, `Res(1, 0) = 1` with `Res(P, 0) = Res(P, P) = 0`, and `Res(T², a + bT) = a²`. They test the supplier's objects, not this roadmap's. You could cite the supplier's Checks instead.

## N01 — The Provenance section uses process wording

Line 1109, "Their integration is coordinated with the author, declaration by declaration", describes a process. A timeless version: "They are an implementation reference only; the table claims no proofs."

## N02 — Convention 8 treats NewtonPolygons' `e` as a positive scalar

Line 117 has `e > 0`, but NewtonPolygons Convention 2 has `e : Γ →+ ℝ`, an embedding. Write `e(v(x))`, or say that for `Γ ⊆ ℝ` the embedding is multiplication by some `e > 0`.

## N03 — One Check sits under the wrong section

The Check on `aᵢⱼ = p^max(2i − j, 0)` (lines 1045–1049) tests §4.4's **Two-sided matrix estimates** but sits under §4.5.

## Questions for the author

- Which theorem in Appendix A3 of Coleman's paper is the spectral mapping theorem that the docstring of `charPowerSeries_eq_colemanDEntire` and the Layer 2–3 Dependencies cite? The article resolves only to a paywalled page for me, so the A3 and A4 locators are unchecked.

## Verified sound

| Statement | Instances tried | Values computed (both sides) | Result |
| --- | --- | --- | --- |
| §0.1 identity criterion | c₀(ℕ,R); `n = 0`; zero module | `Σ_{k<n}(1−u)ᵏu = 1−(1−u)ⁿ = 1`; `n=0` forces `M=0`; c₀(ℕ,R)↠R^{m+1} rules out `m` generators | true |
| §0.1 gauge Check | ℚ_p, `(π,a)=(p²,p)` and `(p²,p²)` | `g(p^{2m})=p^{−m}`, `α=p^{−2m}`; normalised `g(pᵏ)=p^{−2⌊k/2⌋}`, `g(p)=1`, `α(p)=p⁻¹` (`tateGauge`, `TateGauge/Basic.lean:78`) | true |
| §0.2 `IsRowCompact.isCompletelyContinuous` | `x ↦ (Σxⱼ)e₀`, Tate `R` | `‖(ux)ᵢ‖ ≤ rᵢ‖x‖`; `uπ_S(e_k)=0` so `‖u−uπ_S‖=1`, `‖u−π_S u‖→0` | true; `IsTate` unused |
| `IsRowCompact.transpose` | one row of 1s on c₀(ℕ) | transpose would send 1 to `(1,1,…)∉c₀`, so excluded; in general rows `<ε` off finite `T` and null rows give null columns | true |
| §0.3 kernels and multipliers | `h=0`; `g=1, h=x`; Amice stages | entries `coeffᵢ(g hʲ)`; `h=0` gives range `R·g`; `v_p(⌊n/pʰ⌋!/⌊n/p^{h+1}⌋!)→∞`, as in PFA §4.4 | true |
| §0.4 row-compact idempotent | no Noetherian hypothesis | `‖E(1−π_S)E‖<1` makes `Eπ_S` invertible on `range E`, a retract of `R^S` | true |
| Headline 1 / §0.5 Serre's criterion | any complete `K`; finite-rank `v` | `rᵢ(v) ≤ C maxₖ\|fₖ(i)\|→0`; Serre §3 Prop. 4 and corollary pp. 72–73 | true |
| Headline 1 / `hasCompactoidImage_iff…` | `K` not spherically complete | image lies in a countable-type `D` with a `t`-orthogonal basis; truncations converge uniformly; Schikhof §2.15 p. 566 | true |
| `isCompletelyContinuous_iff_isCompactOperator`; ℂ_p Check | ℚ_p; ℂ_p line | `aco(F)` compact when `K` is locally compact; the ℂ_p ball is not compact, so the identity is not compact | true |
| §1.1 Checks | `diag(a,0)`, `[[0,1],[0,0]]` | `reflect 2 (1−aT)=T²−aT`, `reverse = T−a`; `det[[1,−T],[0,1]]=1`; summing all minors gives `c₁=−1` against 0 | true |
| §1.2 Check | `diag(pⁱ)` | `e_n(1,p,p²,…)=p^{n(n−1)/2}/∏(1−pʲ)`, so `v_p(c_n)=n(n−1)/2` | true |
| `norm_charCoeff_mul_pow_le_of_rowNorm_le` | `n=0`; `q=0`; `n≤\|T\|` | `1≤B^{\|T\|}`; with `q=0, n>\|T\|` every `S` meets `rᵢ=0`; `∏ρrᵢ≤B^{\|S∩T\|}q^{\|S∖T\|}` | true; `IsTate` makes `iSup` real |
| §1.3 continuity bound | row-compact `u,v` | changing one row at a time, each term `≤‖u−v‖max(‖u‖,‖v‖)^{n−1}`; entries `≤` operator norm | true |
| §1.5 Check | `K×K`, `e=(1,0)` | `det = 1−eT=(1−T,1)`; leading coefficient `−e` not a unit; ranks `(1,0)` | true |
| §1.6 / `charPowerSeries_eq_mul_of_comm` | idempotent `p` commuting with `u` | `(1−Tup)(1−Tu(1−p)) = 1−Tu+T²u²p(1−p) = 1−Tu`; Serre Prop. 7 Cor. 1 | true |
| §1.7 / `c0_completedBaseChange` | `I=∅`; `L=1`; ℚ_p×𝔽_p((t)) | `‖Θ(Σs⊗x)‖≤L max‖s‖‖x‖`; inverse `Σyᵢ⊗eᵢ` with `‖eᵢ‖=1`; characteristics 0 and `p` share no ground field | true; hypotheses satisfiable |
| §2.2 Checks | as stated | `(T²+aT+b)(T−a)=T³+(b−a²)T−ab`; `det[[a,0],[b,a]]=a²`; 0×0 determinant is 1 | true (C05) |
| §2.3 char-2 Check | `1+T²` at 1 | value 0; `Δ¹=2T=0`; `Δ²=1`; ordinary second derivative `2=0` | true |
| §2.4 resolvent | line identity; `[[1,ε],[0,1]]` | `V₁=u−1=0`, so `V=1`; `V=1+(u−2)T`, `V₂=(u−1)²=0`, `(1−Tu)V=(1−T)²` | true |
| Headline 2 / `isUnit_one_sub_smul_iff` | `diag(pⁱ)`, `a=0` | invertible iff `a∉{p^{−i}}`; `0∈spectrum` though `H(0)=1`; Serre §7 Prop. 11 p. 80 | true |
| Headline 2 / §3.2 index | Serre Prop. 12 and corollary | `dim N=h`; corollary p. 82: codimension of the image equals the kernel dimension | true; index missing (R01) |
| §3.1 / `exists_rieszProjection` | `diag(λ,μ)`; `1+N`; `h=0` | `c=μ−λ`, `b=diag(μ,λ)/(λ−μ)`, `p=diag(0,1)`; `Δ²V=0` gives `E=1`; at `h=0`, `E=0` | true; `p=eʰ` as in Serre |
| §3.1 factor `(1−a⁻¹T)ʰ` | ring with `ε²=0`, `C=ε·id₂` | `QS=(T−a)ʰG` gives `Q=(1−a⁻¹T)ʰ` in `R[[T−a]]`; `ε·id₂` excluded since `H'(a)=−2εa⁻¹≠0` | true |
| §3.3 padding Checks | `D_(1,0)(1,1)`, `D_(0,0)(1,1)`; `B=c` | Lean `simp` gives `1−X` and `1`; `(1−cT)^N` has `\|(N+1)c−Nc\|_p=\|c\|`, so not Cauchy | true |
| Headline 4 / `charPowerSeries_eq_colemanDEntire` | finite `A`, polynomial `B`, `B(0)=0` | `D_{N,M}=(1−TB(0))^{N−n}∏(1−TB(αᵢ))=det(1−TB(A))` | true |
| `exists_newtonMajorant` | `F=1`; polynomial `F` | `ρ` from the Newton-polygon slopes, extended to increase; `‖a₀‖=1≤` empty product | true |
| Headline 3 / §3.4 | `diag(λ,μ)`; JN Thm 2.2.2 p. 10 | `Q*(u)=diag(0,μ−λ)`; `(1−λT)−(1−μT)=(μ−λ)T` gives coprimality; JN's conclusions match, Noetherian hypothesis dropped as own target | true; not in Lean (R01) |
| §3.5 commuting operators | `T` commuting with `u` | `T` commutes with limits of polynomials in `u`, hence preserves every projector range | true |
| §4.3 finite-slope pieces | `diag(pⁱ)`, `h<0` | slope `≤h` iff `‖a‖≤b^{eh}`; `M_{≤h}=⟨eᵢ : i≤h⟩`, and 0 for `h<0` | true |
| §4.4 Check; `norm_charCoeff_of_unit_minors` | `[[p,1],[0,p]]`; dense value group | rows `(0,1)`, invariant factors `(0,2)`, Newton `(1,1)`; any other `S` is dominated strictly; `diag(dᵢ)` with `‖dᵢ‖→c>0` diverges | true |
| §4.5 Checks | `diag(p⁻¹,1,p,…)`; `p^{max(2i−j,0)}` | `M_{≤0}=⟨e₀,e₁⟩`, `M_{=0}=⟨e₁⟩`; columns null, every row has an entry of norm 1, transpose has a non-null column | true |
| C03: `Θ_φ` against AdicSpacesPartII (f) | `R=L` a field | (f) gives `S⊗̂c₀(I,L)≅c₀(I,S)` isometrically; §1.7 with `L=1` gives the same map | overlap |

- Source locators checked against the text: 12 README locators (Serre §1 Rem. 2 p. 71, §3 Prop. 4 and corollary pp. 72–73, §7 Prop. 12 pp. 80–81; De Grande–De Kimpe §§1.1, 2.1; Schikhof §2.7 pp. 558–562, §2.13 p. 564, §2.15 p. 566; Johansson–Newton §2.1 Prop. 2.1.8 and Thm 2.2.2 p. 10; Kedlaya §3 Thm 16 p. 5), plus 7 Serre locators proposed in C02.
- Library declarations opened at the pins: 11 in Tau Ceti (the 8 files and lines in R02, `CompletedTensor.lean:201`, `TateGauge/Basic.lean:78`, `Operator/CompletelyContinuous.lean:103`), plus 34 supplier-contract names grep-confirmed; 7 in Mathlib (`Fredholm/Basic.lean:123`, `Compact/Basic.lean:69`, `Charpoly/Coeff.lean:290`, `PowerSeries/Restricted.lean:28`, `Resultant/Basic.lean:367`, `FreeLocus.lean:181`, `LinearMap.index`).
- Cross-roadmap citations resolved on main (1b7b481): PadicFunctionalAnalysis §§0.1, 0.4, 1.1, 1.2, 1.4, 2.1–2.6, 4.3, 4.4; RestrictedPowerSeries §§1.1–1.3, 2.1–2.3, 7.2; NewtonPolygons Convention 2 and §§0.6, 0.7, 2.5, 3.2, 3.3, 4.1, 4.3, 5.3; AdicSpacesPartII §R0.5; AdicSpacesPartIII §R3.6; LocallyAnalyticDistributions §§4.2–4.5, 4.12, 4.14; OperatorTheory/OperatorIdeals Part A. All present.
- Automatic checks: every check passed at this head. Dependency check output: `depcheck: 200 roadmaps, 2197 edges, 0 problem(s)`.
- Elaboration: `Suggested.lean` elaborates with 22 `sorry` warnings and nothing else. I ran `#check @name` on all 49 declarations and compared each type with its README statement; the 16 "dropped binder" leads are false, because every theorem keeps the instance arguments it needs and the definitions drop only binders their bodies do not use. No signature changed.
- Probes in scratch copies: the C01 proofs close; `IsBoundedSMul R C₀(I, R)` is not inferred, so the explicit hypothesis is needed; the R02 repair against Tau Ceti imports elaborates; both forms of the R01 Riesz–Coleman statement and the index-zero statement elaborate.
- Ownership against open pull requests: read the heads of QuaternionicModularForms, PadicFamilies and PadicFamiliesPartII, and AutomorphicGaloisRepresentations (through `roadmaps grep`). Each consumes this roadmap and none owns its objects.

Overlap check: read LocallyAnalyticDistributions, PadicFunctionalAnalysis and RestrictedPowerSeries (main), QuaternionicModularForms, AutomorphicGaloisRepresentations and PadicFamilies (open), plus AdicSpacesPartII and OperatorTheory/OperatorIdeals. Owners of the shared objects: Fredholm series, Riesz and Coleman theory belong to CompactOperators and are consumed by the others; Banach–Tate data and `c₀` matrices to PadicFunctionalAnalysis; the entire-series algebra to RestrictedPowerSeries; the field `c₀` tensor comparison to AdicSpacesPartII §R0.5(f), with the ring variant here (C03); field finite-rank approximability to OperatorIdeals Part A, with the ring-relative predicate here.

Source independence: 9 passages compared with 5 sources (Serre1962, JohanssonNewton, Schikhof, DeGrandeDeKimpe1982, Kedlaya2007); nothing is shared beyond phrasing the mathematics forces (the longest shared run is 3 words, against JN Thm 2.2.2). Largest share: Serre1962, 9 of 24 locators. Contents compared with Serre1962 §§1–7: independent. Serre §4 is unused; §§0.3, 1.7 and 3.3 and Layer 4 have no Serre counterpart; the order is forced by the *Needs:* lines of §1.2 (on §0.2), §2.4 (on §§1.2–1.4) and §3.1 (on §§2.3–2.5). Coleman1997 was not read.

Research link: Layers 1–3 are the Serre (1962) and Coleman (1997) Fredholm and Riesz theory over Banach coefficient algebras, which Coleman uses for p-adic families of modular forms and Johansson–Newton (arXiv v4, §2.2) for extended eigenvarieties; LocallyAnalyticDistributions consumes it for finite-slope decompositions. This rests on the README Summary and JohanssonNewton §2.2.

## Not verifiable

- Coleman 1997 (Invent. Math. 127), Appendix A3–A4, and the "Appendix A3" in `Suggested.lean`: the sources service resolves the DOI only to a paywalled publisher page. The README's link points to a third-party copy that I could not classify as a legal host, so I did not read it.

## Source issues

- **Misprint** in Kedlaya2007 at §3, the sentence before Theorem 16, p. 5: the notes introduce Theorem 16 as the archimedean analogue of Weyl's inequality; it should say nonarchimedean analogue, since the section is about nonarchimedean fields; affects nothing.

## For the human reviewers

- Licence: README line 1274 links Coleman 1997 (Invent. Math., paywalled) to a copy on kundudeb.github.io, a personal site of neither the author nor the publisher. The sources service resolved the DOI only to the paywall.
- Licence: the Provenance section (README lines 1107–1120) names W. Coram's PhD repository (TateFredholm, commit eefb3d9) as an implementation reference. I did not read it, check its licence, or compare `Suggested.lean` with it.
- The pinned Tau Ceti already proves most of `Suggested.lean`'s headline statements for its own definitions (for example `ContinuousLinearMap.IsRowCompact.isUnit_one_sub_smul_iff`; see `STATUS.md`). Whether the acceptance test should be restated against those declarations is for you to decide.

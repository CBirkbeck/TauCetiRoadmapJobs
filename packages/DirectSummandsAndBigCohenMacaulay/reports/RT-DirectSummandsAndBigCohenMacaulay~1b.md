<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1452#issuecomment-6406348336 -->
Red team round 1 pass b (claude) of dfaea30

Verdict: needs_changes

1. **F01** (P1) §4.3's finite-witness comparison is unestablished; the whole Layer 4 existence route rests on it

   **Location.** `packages/DirectSummandsAndBigCohenMacaulay/README.md:799–801`: "This section owns the finite-witness comparison … a bad finite double sequence of full algebra modifications of T yields a bad finite double sequence of the pointed partial modifications of §4.2"; proof route "controlling the finitely many coefficient products in a bad full-algebra witness".

   **Claim.** Bad full sequence ⟹ bad pointed-partial sequence (finite witnesses), by bounding coefficient products. §4.5, §4.8, §4.11 (hence `exists_balanced`), §4.12, §6.2 (`weakFunctoriality_regularTarget`), §6.4 (`pureSubring_cohenMacaulay`), §5.3 (`finiteCover_flatDomination`) and André's route in §5.1 all consume it through §4.3/§4.5.

   **Witness.** A full modification kills F·T[X] (HOCHSTER02 line 175); a pointed partial one kills only F·R[X]_{≤N−1} (HOCHSTER02 line 230; README §4.2). Take R = k⟦x,y⟧, parameters (x, y), a first full step for y·u = x·u₁ (F₁ = u − xX, type k = 1) and a second for x·v = 0 in T₁ (type k = 0), where x·v = H·F₁ in T[X]. A bad witness 1 = Σ m_s w_s + G₁F₁ + G₂v has T-coefficient multipliers. In the pointed-partial world a T-multiple gX^aF₁ with g ∈ T∖R is not killed; the derived relation y·(guX^a) = x·(gu₁X^a) with a fresh variable Y gives guX^a ≡ xY, so gX^aF₁ ≡ x·z with z = Y − gX^{a+1}; likewise HF₁ ≡ x·Z_H, the k = 0 step for x·(v − Z_H) = 0 gives v ≡ Z_H and, coefficient by coefficient, G₂v ≡ Z₂, a sum of such differences. Hence 1 − Σ m_s w_s ≡ xZ₁ + Z₂ with Z₂ ∉ mM: each difference Y − gX^{a+1} is zero in the full algebra (where Y = gX) but free in the pointed module, where x·z ≡ gX^aF₁ ≠ 0 and no step of §4.2 kills a difference of two existing classes, every step adjoining fresh variables and killing only scalar multiples of its own F. No construction in §§4.2–4.4 removes these correction terms, and nothing in the sources does: HOCHSTER02 lines 232–234 assert that the N-colimit of partial modifications at a fixed relation is the algebra modification, which the README's own example (line 783: T = k⟦x⟧[t]/(xt), T/Rt keeps t², T/Tt = k⟦x⟧) refutes; Theorem 4.2's "if" direction (HOCHSTER02 line 245, "quite easy to see") rests on that Note; ANDRE18B line 672 and HEITMANNMA18 line 143 cite it. The design recorded this as the supplier-less gap `pointed-modification-finite-witness` ("a precise finite-witness construction … is required"); the package turned it into an owned target without a construction. (Related: FIX-PKG~2 F04, settled only as to the plan.json record; this finding concerns the mathematics of the owned target and is actionable here.)

   **Repair.** Route Layer 4 through full algebra modifications, which never needs the comparison, and delete the comparison target:

   1. §4.3: state the criterion for full algebra modifications only (HOCHSTER02 §3, lines 180–184 and 192–201: T maps to a balanced big Cohen–Macaulay R-algebra iff no finite sequence of algebra modifications of T is bad; the double-sequence form for a local R → S), proved by the direct-limit construction already in the proof route (B′ = colimit over finite sequences, x weakly regular on B′ by construction, B′ ≠ mB′ iff no finite sequence is bad, balance by §0.5; C′ likewise from S ⊗_R B′). Delete "if and only if there is no bad double sequence of partial algebra modifications", the finite-witness paragraph (lines 799–801) and the pointed half of the Checks.
   2. §4.4: restate the key lemma for R-algebra maps. Given an R-algebra map α : T_i → D[1/π] and a relation x_{k+1}t = Σ_{j≤k} x_j t_j in T_i whose images have denominator exponent ≤ e (α(t), α(t_j) ∈ π^{−e}D), if every root π^{1/p^m} kills ((x₁,…,x_k)D :_D x_{k+1})/(x₁,…,x_k)D, then π^{1/p^m}π^e α(t) = Σ x_j w_j with w_j ∈ D, and X_j ↦ w_j/(π^{1/p^m}π^e) extends α to an R-algebra map T_i[X]/(F) → D[1/π]; an element of X-degree ≤ D whose coefficients have exponent ≤ e′ has exponent ≤ e′ + D(e + 1/p^m).
   3. §4.5 and §4.12: a bad finite (double) sequence has a finite witness 1 = Σ m_s w_s in the last algebra; the exponents of the finitely many β(w_s) are C/p^m with C determined by the witness's degrees and length; choose m with C/p^m ≤ 1/p^h for an h with π^{1/p^h} ∉ m_B D (resp. π′^{1/p^h} ∉ m_{B′}D′, denominators transported by δ(π^{1/p^m}) | π′^{1/p^m}); then π^{1/p^h} ∈ m_B D, a contradiction. Replace "M₁ → ⋯ → M_ℓ of partial modifications of degree ≤ n" accordingly.
   4. §4.2: keep the pointed partial quotient at most as a remark with its t-example, or delete it with its Checks; in `Suggested.lean` line 20–22 replace "The full/partial modification criterion … pointed modification and full algebra modification carriers" by "The algebra-modification criterion, including double sequences: the full algebra modification carrier, its finite sequences and their badness are missing."

   Tested on the refuting instance: with R = k⟦x⟧, T = k⟦x⟧[t]/(xt) the full step T → T/(t) = k⟦x⟧ is not bad, and T maps to the balanced big Cohen–Macaulay algebra k⟦x⟧; the full-algebra criterion and the degree-bounded extension are unaffected by the partial/full discrepancy.

2. **F02** (P2) §7.7's "limit-passage assertion" has no proof route; the obstruction does not base-change along the non-flat Popescu stages

   **Location.** `packages/DirectSummandsAndBigCohenMacaulay/README.md:1369`: "This section owns the accompanying limit-passage assertion: if every smooth stage A_i is a derived splinter, the unit R→RΓ(X,O_X) splits … accounting for possibly nonflat maps A_i→R".

   **Claim.** Vanishing of the obstruction at the smooth finite-type stages of a Popescu presentation of a regular ℚ-algebra R implies vanishing over R; §7.8's characteristic-zero case (`derivedDirectSummand` over complete regular local A₀ of equal characteristic 0) depends on it.

   **Witness.** The stage maps A_i → R are not flat in general (ℚ[t] → ℚ⟦x,y⟧, t ↦ 0, is a map from a smooth ℚ-algebra). For non-flat A_i → R, RΓ(X_i, O) ⊗^L_{A_i} R is the derived fibre and differs from RΓ(X, O_X), X = X_i ×_{A_i} Spec R; the retraction r_i base-changes to a retraction of R → RΓ(X_i,O) ⊗^L R, which maps *to* RΓ(X, O_X), the wrong direction for a retraction of R → RΓ(X,O_X). SchemeAndStackFoundations §§0.9, 0.15 descend f, not splittings; §7.2 and §§2.6, 2.18 are flat base change. The design recorded this as the supplier-less gap `char-zero-derived-splitting-bridges`; the package owns it with the caveat but no argument. (Related: FIX-PKG~2 F02.)

   **Repair.** Replace the Popescu limit passage by the equational reduction the roadmap already uses in §4.10: after §7.3 (A₀ complete regular local of equal characteristic 0, Z integral, generically finite), if α ≠ 0 then by Krull and the pro-isomorphism of §3.4 some α mod mⁿ ≠ 0 in the finite-length module Ext¹_{A₀}(Q, A₀/mⁿ); this nonvanishing is finitely many equations in finitely many elements of A₀ and of a finite affine Čech complex of Z, so it descends to a finitely generated ℤ-subalgebra of A₀ (SchemeAndStackFoundations §§0.9, 0.15) with Z descending as a proper surjective scheme; specialize at a closed point of characteristic p where the base stays regular local (generic flatness, §4.12) and contradict §7.6. Write §7.7's "approximation target" as this reduction, with the Hom comparison kept only for the flat base changes (localization, field extension) it already covers. If the Kovács route is kept instead, state its input as a declared gap (resolution and Grauert–Riemenschneider vanishing for the excellent regular scheme Spec A₀ itself), not as a limit passage.

3. **F03** (P3) two STACKS line locators point into the wrong chapter; the cached text is "More on flatness" only

   **Location.** `README.md:25` and `:1155` ("STACKS, Definition 10.42.1, tag 030O; STACKS line 4671"); `README.md:1270` and `:1281` ("Lemma 30.4.2 … Proposition 30.19.1 (tag 02O5) and Lemma 30.19.2 (tag 02O6); STACKS line 2350"); `sources.toml` STACKS entry listing tags 030O, 0A6A, 01XI, 02O5, 02O6 as locators of this text.

   **Witness.** STACKS line 2 names the fetched file as the flattening chapter (146 pages); STACKS line 2350 is the page-51 marker inside the purity section; STACKS line 4671 is a gluing display of Lemma 33.x. The strings 030O, 01XI, 02O5, 02O6, 0A6A occur nowhere in the cached text; 081T does (line 4296, verified).

   **Repair.** In the four places cite the tag alone: "STACKS, Definition 10.42.1, tag 030O" and "STACKS, Lemma 30.4.2, tag 01XI; Proposition 30.19.1, tag 02O5; Lemma 30.19.2, tag 02O6" (and "Stacks 0A6A" in §§0.7, 7.3 stays by tag). Either fetch the Commutative Algebra and Cohomology of Schemes chapters through the sources service under the same key STACKS (one key, additional locators and `fetched_from`), or mark those tags in the manifest locator as "cited by tag, not in the fetched flattening text". Keep "STACKS line 4296" for 081T.

4. **F04** (P3) §4.7(4)'s parameter transport along the faithfully flat residue extension is neither in the declared gap nor in a supplier

   **Location.** `README.md:876`: "a system of parameters of B is one of B′ because B → B′ is flat local with zero-dimensional closed fibre"; the same transport is used in §4.8 ("Systems of parameters from the original ring remain systems of parameters throughout") and §§6.1–6.2.

   **Witness.** gap:parameter-systems (README line 120, plan.json) lists three transports: completion, equal-dimensional prime quotient, finite injective local map. The flat local map B → B′ with m_B B′ = m_{B′} is none of these; the needed input is dim B′ = dim B for a flat local map with zero-dimensional fibre (Stacks 00ON), which SchemeAndStackFoundations §0.17 (depth formulas only) and Mathlib at the pin (no flat-local dimension formula) do not supply. The m_{B′}-primary part is immediate ((x)B′ ⊇ m_Bⁿ B′ = m_{B′}ⁿ).

   **Repair.** Add a fourth clause to the gap's `needs` in `design/plan.json` and README line 120: "For a flat local map B → B′ of Noetherian local rings with m_B B′ = m_{B′}, a parameter system of B maps to one of B′." Add "DeformationAndDerivedPatchingAlgebraPartII §K0.3 (gap:parameter-systems)" to §4.7's *Needs:* line.

## Verified sound

- Declarations read: 19 of 19 (9 definitions, 10 theorems), each compared with the stored elaborated signature and its README section; no lost binder; universes and instance arguments agree with the README's conventions (base-universe test for `Splinter`, `PureAlgebra`; `Type (max u v)` for the dominating algebra). `TauCeti.IsRegularLocalRing.isDomain` is an instance (priority 100) and is what makes `FractionRing R` a field in `absoluteIntegralClosure_split`, so the single Tau Ceti import is used. No `lemma`, `set_option`, `#eval`, `True` placeholder or sorry'd data; 10 `sorry`s, all theorems.
- Targets read: 52 sections (0.1–0.10, 1.1–1.3, 2.1–2.3, 3.1–3.7, 4.1–4.12, 5.1–5.5, 6.1–6.4, 7.1–7.8), every Needs line and every dependency list.
- Headlines: the ten stated theorems are the README's end theorems (§§4.9, 4.11, 5.1, 5.3, 5.4, 5.5, 6.2, 6.4, 7.6, 7.8); the three unstatable ones are named in the docstring. §§1.3, 2.3, 3.7, 4.10, 7.7 are special cases of stated headlines (removed in FIX~2 F05/F07, not re-raised); §§0.5, 0.6, 1.2 were removed as inputs (F08), not re-raised. No padding: no declaration follows in one tactic, restates a definition or mirrors a Check.
- Checks tested: 61 computed (see table); every Lean definition has ≥ 3 discriminating Checks (SplitAlgebra 8, Splinter 6, ParameterSystem 3, BalancedBigCM 5, PureAlgebra 3, SeparableResidueMap 4, structureComplex 3, derivedUnit 3, DerivedSplinter 5). The Fermat-cubic normal non-splinter (§5.1), Chase's non-coherent product (§5.2), the ℤ₂⟦X,Y⟧/(2X,2Y) minimal-prime computation (§§4.7–4.8) and the p=2 divisibility direction (§4.12) all recompute correctly.
- Locators verified against the cached texts: 72 line locators (ANDRE18B 30, BHATT18 11, BHATT12 11, HOCHSTER02 5, HEITMANNMA18 2, BMPSTWW 4, HUNEKELYUBEZNIK 2, KOVACS00 2, DATTAMURAYAMA 1, HOCHSTERLC 1, HOCHSTER73 1, CHASE60 1, STACKS 3); 70 support the claim, 2 do not (R03). Page offsets agree with the FIX~3 mechanical check. HOCHSTER73 Theorem 2 (lines 235–275) supports the Frobenius application of §1.1/§1.3; the general endomorphism criterion is ANDRE18B A.3.1 (lines 898–921), correctly cited as primary.
- Sibling citations checked: 64. PerfectoidSpacesPartII is a design-stage board package (merge order line 72; `packages/PerfectoidSpacesPartII/design`): all 15 cited node ids exist (RA.0 almost-pro-zero-tower/-derived-limit/-linear-functor; RA.1 annular-tower, quantitative-riemann-extension-derived/-general; RA.3 perfectoid-riemann-extension; RA.4 perfectoid-abhyankar-lemma; RA.5 pure-map, almost-pure-map, krull-detection-lemma, flat-integral-model, kummer-almost-faithful-flatness, kummer-purity, ramified-kummer-almost-flatness) and their statements match the uses (pure-map includes filtered colimits and the finitely-presented splitting criterion; ramified-kummer-almost-flatness is over A = W(k)⟦T⟧, so gap:ramified-multielement-kummer asks for something not provided). PerfectoidSpaces (main): P0.1–P0.17, P0.25, P1.1, P1.24–P1.25, P2, P3 and all 10 hyphenated labels exist. DeformationAndDerivedPatchingAlgebra (#1034 head): §§1.9, 1.10, 1.13, 1.14, 1.15, 3.1, 3.2, 3.4, 3.7, 3.9, 4.1, 7.3 exist with the cited content (residue extension with equal maximal ideals; Bhatt Lemma 5.3 pro-isomorphism; finite-algebra completion products; Auslander–Buchsbaum; Gorenstein as finite self-injective dimension; residual-fibre finiteness). Part II (#872): K0.1 (Čech comparison for arbitrary modules, filtered colimits) and K0.3 (secant lists, dimension formula, parameter completion). PerfectoidQuotients (#1042): §§0.7, 1.3, 1.4 as cited. DerivedDeRhamCohomology (#868) §1.10 is exactly Bhatt Proposition 5.1 with the stated hypotheses. DerivedModuleAlgebra §§0.K.1, 1.T.1, 1.1.1, 1.E.0, 1.M.2; EnhancedDerivedSheaves §E1.4, §E1.6 (`isRegularRing_projectiveDimension_le`, Kunz, Cohen presentations), §E1.8 (`liftingObstruction_map`); SchemeAndStackFoundations §§0.9, 0.11, 0.15, 0.17, 2.6, 2.7, 2.18, 2.19, 2.21, 4.12 (Noetherian integral domination, so the qcqs gap is not already provided), 4.13; StableReduction Layer 2 (proper-cohomology theory); ResolutionOfSingularitiesCharacteristicZero (#1199) §5.5 (no Grauert–Riemenschneider there, so that gap is not already provided). All exist on main or at the named heads.
- Mathlib and Tau Ceti at the pins: every declaration named in the supplier contracts exists with the stated hypotheses (`IsRegularRing` extends `IsNoetherianRing`; `IsRegularLocalRing` extends `IsLocalRing, IsNoetherianRing`; `Module.FaithfullyFlat` = flat with `m • ⊤ ≠ ⊤` for maximal m; `Algebra.IsTranscendentalSeparable` = separably generated finitely generated intermediate fields; `HasInjectiveDimensionLE`; `Scheme.Modules.pushforward` additive; `rightDerivedFunctorPlus`/`Unit` for an additive functor out of a category with enough injectives; `unitToPushforwardObjUnit`; `Ideal.iInf_pow_eq_bot_of_isLocalRing`; `trace_algebraMap`; `ResidueField.map` with `IsLocalHom`; `Ideal.ofList`; `Module.Flat.pi` finite; `FaithfullyFlat.pi_of_exists_submodule_ne_top`; `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`).
- Ownership: `roadmaps grep` over main and all 367 open pull requests finds no other owner of splinters, (balanced) big Cohen–Macaulay modules or algebras, pure algebras, parameter-system lists, the direct summand theorem or derived splinters; "absolute integral closure" occurs only in SchemeAndStackFoundations §0.11 (cited as supplier) and ClassicalAdicEtaleCohomology (a use). Mathlib and Tau Ceti have none of these objects. No `Suggested.lean` elsewhere declares a name in `TauCetiRoadmap.DirectSummandsAndBigCohenMacaulay`.
- Declared gaps: `ramified-multielement-kummer`, `common-cohen-extension`, `parameter-systems`, `perfectoid-base-modification-domination`, `grauert-riemenschneider` are precise, minimal (checked against RA.5, DDPA §1.10, DDPA-II §K0.3, SSF §4.12, ResSing §5.5) and carry the same slug in plan.json and the README. The four supplier-less gaps in plan.json (`equal-char-zero-existence-proof`, `char-zero-derived-splitting-bridges`, `arbitrary-module-completion-proof`, `pointed-modification-finite-witness`) are absent from the README's contracts and settled as FIX~2 F01–F04 (intake retires the records); their mathematics is addressed in R01 and R02 only where the owned replacement target is unestablished.
- Dependency direction, exact output: `depcheck: 56 roadmaps, 647 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line). The citation resolver's single lead (PerfectoidSpacesPartII §RA.5) resolves to the board package above.
- Policy: `git diff --stat origin/main...HEAD` touches only the package folder (README, Suggested.lean, design/plan.json, metadata.toml, sources.toml, reports); no pull-request numbers or process narrative in README or docstrings; every target has a locator; no computational algorithm.

### Lean declarations: context and instances

| Declaration | Context | Instances tried, values | Result |
|---|---|---|---|
| `SplitAlgebra R S` | CommRing R S, Algebra | ℤ→ℚ: Hom_ℤ(ℚ,ℤ)=0, no ρ; ℤ→ℤ[i]: ρ=coefficient of 1; R=0,S=0: ρ=0 has ρ 1=1 since 1=0 | matches §0.1 |
| `Splinter R` | CommRing R | k[ε]/ε²: not reduced, excluded; K[x,y]/(xy): x=(x+y)(1,0)∈(x+y)S, x∉(x+y)R, fails; field: holds | matches §0.2 |
| `ParameterSystem R xs` | local Noetherian | field, []: dim 0=0, radical ⊥=m; k⟦X⟧,[X²]: radical (X); [X,X] in k⟦X,Y⟧: radical (X)≠m | matches §0.3 |
| `BalancedBigCM R M` | local Noetherian, Module | M=0: m•⊤=⊤ fails; ℚ over ℤ_(p): pℚ=ℚ fails; k⟦X⟧/(X): X kills 1, fails | matches §0.4 |
| `PureAlgebra R S` | CommRing, Algebra, M:Type u | ℤ→ℚ with M=ℤ/2: ℤ/2⊗ℚ=0, 1↦0; R→R×R: retract | matches §1.2 view |
| `absoluteIntegralClosure_charP` | A→R surj, injdim_A A≤n, CharP R p | R=𝔽₂: xs=[], R⁺=closure≠0; HL Thm 2.1/Cor 2.3 hypotheses = Gorenstein image, char p | true as typed |
| `exists_balanced` | local Noetherian | R=𝔽₂[ε]/ε²: C=𝔽₂, mC=0≠C; R regular: C=R | true (§4.11) |
| `directSummand` | IsRegularRing, Module.Finite, injective | R=0 ⟹ S=0, ρ=0 works; S:Type v arbitrary | true (§5.1) |
| `finiteCover_flatDomination` | same | R field: T=residue field of S; R=0: T=0 faithfully flat (no maximal ideals) | true (§5.3) |
| `absoluteIntegralClosure_split` | IsRegularLocalRing, IsAdicComplete m | field K: K⁺=K̄, basis projection; isDomain instance from Tau Ceti | true (§5.4) |
| `monomial_noncontainment` | ParameterSystem, m<n | d=0: 1∉⊥ (R≠0); k⟦X,Y⟧,n=2,m=1: XY∉(X²,Y²); m<n reduces to t=n−1 monomial theorem | true (§5.5) |
| `SeparableResidueMap` | local, IsLocalHom | id on 𝔽₂; 𝔽₂→𝔽₂(t) separable (transcendental); 𝔽₂(t)→𝔽₂(t^{1/2}) fails | matches §6.2 |
| `weakFunctoriality_regularTarget` | complete, domain B, regular B′, char (0,p), injective, separable | id: C=C′; ℤ₂⟦T⟧→ℤ₂⟦T,V⟧/(TV−2): target regular, 2∈m², covered | true (§6.2) |
| `pureSubring_cohenMacaulay` | local Noetherian B, regular B′, local hom, pure, separable | dim 0: xs=[], IsRegular ⟺ B≠0; C₂ on ℤ₃⟦X⟧: invariants ℤ₃⟦X²⟧ CM | true (§6.4) |
| `structureComplex` | Scheme | Spec 𝔽₂: degree 0 term 𝔽₂, others 0; ∅: zero complex | matches §7.1 |
| `derivedUnit` | f : X ⟶ Y | id: H⁰ identity; Spec(A×A)→Spec A: a↦(a,a) | matches §7.1 |
| `DerivedSplinter` | CommRing | ℤ→ℤ/2 (finite surjective): no left inverse, 2↦0; field: splits | matches §7.1; forces reduced |
| `splinter_iff_derivedSplinter_charP` | Noetherian, CharP p | k[x,y]/(xy): both fail; 𝔽_p⟦x,y⟧: both hold; reducedness forced by Spec R_red→Spec R | true (§7.6) |
| `derivedDirectSummand` | IsRegularRing | blow-up of k⟦X,Y⟧: unit iso; d=0 blow-up empty, not surjective, excluded | true (§7.8) |

### Adversarial pass on README targets (one row per section)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.1 split algebras | ℝ→ℂ; K[x,y]/(xy)→K[x]×K[y]; ℤ→ℚ; zero K-algebra | ρ(i²)=−1≠ρ(i)²=0; (x+y)(1,0)=(x,0), constant of r would be 1 and 0; Hom(ℚ,ℤ)=0; 1=0 | holds | none |
| §0.2 splinters | ℤ; k[ε]/ε²; K[t²,t³]; ℚ-domains | 1 primitive in S/torsion; self-injective but not reduced; K[t]/A torsion ≠0; normal ⟺ splinter | holds | none |
| §0.3 big CM | ℚ over ℤ_(p); K⟦X,Y⟧/(XY,Y²); M=0; d=0 | pℚ=ℚ; (0:X)=kY; m·0=0; empty list | holds | none |
| §0.4 balanced | R/x₁R over regular R; k⟦X⟧/(X) | depth d−1<d; X·1=0 | holds | none |
| §0.5 completion | k[X]_(X); M=0 | k⟦X⟧/X=k, X injective; 0 | holds (Bartijn–Strooker) | none |
| §0.6 faithful flatness | DVR, C=Frac A; Tor induction | C/ϖC=0 not ff; ht P = h, P∈Ass(A/(x)), Tor segment vanishes | holds | none |
| §0.7 obstruction | id; 2:ℤ→ℤ; K[t²,t³]⊂K[t]; free of rank>0 | cone 0; class 1∈ℤ/2; B/A=Kt, Ext¹≠0; B/A projective | holds | none |
| §0.8 reductions | S=A×A/I; height-one P∋p | projection choice; Q⊆P, Q≠0 ⟹ Q=P ∌ p contradiction | holds | none |
| §0.9 trace | ℤ[(1+√5)/2]; K(√a); a=1 | Tr=1, half=1/2∉ℤ; Tr(1,√a)=(2,0); degree 1 | holds | none |
| §0.10 dim≤2 | DVR; k[ε]/ε² over k; dim 3 | torsion-free finite free; basis 1,ε; Heitmann case | holds | none |
| §1.1 endomorphism criterion | r=0 Frobenius; V⟦x⟧ with x↦x^q; 𝔽₂⟦X⟧ | ∩σʲ(m)R=rR; rank 2; division step needs r regular (added hypothesis) | holds with added hypothesis | source gap noted |
| §1.2 complete pure ⟹ split | field; Datta–Murayama Henselian DVR | Hom(E⊗S,E)=Hom(S,R), restriction=ev₁; Hom_V(V^{1/p},V)=0 | holds | none |
| §1.3 char p | 𝔽_p⟦x⟧⊂𝔽_p⟦x^{1/p}⟧, p=2,3 | projection onto integer exponents, 1↦1 | holds | none |
| §2.1 mod Iᵐ | A=ℤ,I=ℤ; Hom(ℤ/2,ℤ/2ⁿ) | 0→0 splits but ℤ→ℤ/2 does not (I⊄Jac); transition zero | holds | none |
| §2.2 mod pᵐ | ℤ₂, g=1, m=1,2 | pg≡0 mod p, ≡2≠0 mod 4; m=1 from m=2 | holds | none |
| §2.3 W(k)⟦T⟧ | n=0: W(k); Kummer B | splitting by purity | holds | none |
| §3.1 Cohen presentation | ℤ_p[√p]⟦x₂⟧; f₀=p²+X² | f=X₁²; u=1−p, f=X²/(1−p), no constant term, p∤f | holds | none |
| §3.2 perfectoid cover | A₀=ℤ_p; p=2 roots | O_K; v(2^{1/2ⁿ})=2^{−n}→0, ideal not f.g. | holds | none |
| §3.3 almost ff | A₀=ℤ₂, M=A₀/m | 2^{1/2}≠0 in A/2A; I=A₀ by Krull since p≠0 | holds | none |
| §3.4 detection | ℤ₂, g=1, m=2,3 | p²g=4: 0 mod 4, ≠0 mod 8 | holds | none |
| §3.5 annuli | g=1; 𝔽₄ | U=pⁿ constant tower; Tr(1)=0,Tr(ω)=1, z↦Tr(ωz) | holds | none |
| §3.6 limit | constant tower; Q₀=0 | lim V=V, lim¹=0; Hom=0 | holds | none |
| §3.7 Bhatt | y²=x+p, p odd and p=2 | disc 4(x+p), g=x+p≢0 mod p; basis 1,y | holds | none |
| §4.1 almost CM | O_K over ℤ_p; 𝔽_p⟦X,Y⟧/(XY,Y²) with π=1; D=0; dim 0 | J=m_D⊄pD; (0:X)=(Y) not killed; roots in m·0; colon condition empty | holds | none |
| §4.2 partial modifications | k=0; k⟦x,y⟧ with y·0=x·0, N=1; K⟦X,Y⟧/(XY,Y²); k⟦x⟧[t]/(xt) | M/Ru₁; R⊕(R/x)X; R/RY kills Y; T/Rt keeps t², T/Tt=R | definition consistent; N-colimit ≠ full modification | see R01 |
| §4.3 modification criterion | CM R, T=R; k⟦x⟧[t]/(xt) two steps; R/(X) | 1 stays 1 mod m; second pointed step kills t²; T/R·1=0 bad | "if" direction via finite-witness comparison fails at a second step with k₂<k₁ (correction terms x_j·(Y−…)) | R01 |
| §4.4 key lemma | c unit; N=1,D=2; N=0,D=1; α(e)=0 vs 1 on R² | ND+D+N=5, 1; x≠0 vs 0 | holds for pointed modules | restate for algebra maps (R01) |
| §4.5 almost CM ⟹ balanced | ℤ₂, D=O_K, π=2 | 2^{1/2ʰ}∉2D | holds via full-algebra route | R01 |
| §4.6 criteria | ℤ₂, x₁=4, g=1 | 2∈(π)∩A, 2∉4A | holds | none |
| §4.7 reductions | ℤ_p⟦x,y⟧/(xy); ℤ₂⟦X,Y⟧/(2X,2Y) with (2+X,Y) | B/(x)=ℤ_p⟦y⟧; B/(2+X,Y)=ℤ₂/4, images (X,Y) and (2,0) | holds; transport in (4) unowned | R04 |
| §4.8 André existence | ℤ₂⟦X,Y⟧/(2X,2Y); /(2X) | minimal primes (2),(X,Y), dims 2,1; ℤ₂⟦Y⟧ dim 2 | holds | depends on R01 |
| §4.9 Hochster–Huneke | 𝔽₂, empty list; 𝔽_p⟦x,y⟧ | R⁺/mR⁺=R⁺≠0; R⁺ ff | holds (HL 2.1, 2.3) | none |
| §4.10 char 0 | ℚ[ε]/ε²; ℤ[1/6][X] at p=2,3 | C=ℚ, mC=0; empty fibre | holds (HH reduction) | none |
| §4.11 all local rings | 𝔽₂[ε]/ε² | C=𝔽₂ | holds | none |
| §4.12 squares | id; π=2,π′=4 roots | quotient 2^{1/2ⁿ}; reverse quotient 2^{−1/2ⁿ} ∉ D | direction fixed | R01 route |
| §5.1 direct summand | R=0; Fermat cubic 𝔽₂[a,b,c]/(a³+b³+c³) → squares | S=0, 0=1; z⁴=x³z+y³z∈(x²,y²)S, c²∉(a,b)A | holds; normal non-splinter correct | none |
| §5.2 products | empty product; ∏ℤ; k⊕V, V²=0 | 0 not ff; multiplication injective; (x₁,x₂,…)∈Ann(x₀) ∖ VM | holds | none |
| §5.3 domination | field; ℤ₂, S=R×R/2 | residue field; 2T=0 on second factor | holds | depends on R01 via §4.11 |
| §5.4 R⁺ splits | complete DVR; field; char p | finite subalgebras free; K̄ basis; ff by §4.9 | holds | none |
| §5.5 monomial | d=0; K⟦x,y⟧/(xy), x+y; k⟦X,Y⟧, n=2 | 1∉0; (x+y) nonzerodivisor; XY∉(X²,Y²), (XY)²∈ | holds (iff needs d≥1) | none |
| §6.1 purity and completion | k[X]_(X)→k[X,Y]_(X,Y) | Y=0 extends to completions | holds (A.2.2 argument rechecked) | none |
| §6.2 weak functoriality | ℤ_p⟦T⟧→ℤ_p⟦T,V⟧/(TV−p), p=2; residue examples | regular, 2∈m²; 𝔽₂→𝔽₂(t) separable; 𝔽₂(t)→𝔽₂(t^{1/2}) not | holds | R01 route |
| §6.3 descent | B=B′=C=C′ regular; k⟦X,Y⟧ colons | regular ⟹ CM; (0:X)=0, (X):Y=(X) | holds | none |
| §6.4 pure subrings CM | C₂ on ℤ₃⟦X⟧; S₃ on ℤ₅⟦X₁,X₂,X₃⟧; trivial group | a+bX↦a; X₁↦(X₁+X₂+X₃)/3; identity | holds | none |
| §7.1 derived splinters | field; elliptic cone; Spec 𝔽₂; ∅; k[ε]/ε²; A×A; ℤ→ℤ/2 | H¹(E,O_E)≠0 obstructs; degree-0 term; zero complex; ε≠0; first projection; 2↦0 | holds; sheaf/affine comparison via D_qc(Spec A)≃D(A) | none |
| §7.2 perfectness | finite B; elliptic curve; 𝔸¹ | pd finite; H⁰=H¹=k; H⁰=k[T] infinite | holds | none |
| §7.3 reductions | finite case; A×A | §0.8; closure of a generic point | holds | none |
| §7.4 almost split | Y finite; Y=Spec(A/p) | §3.5; p=0 on Y, p≠0 in A ⟹ no almost retraction | holds with surjectivity (source gap) | none |
| §7.5 killing cohomology | [p] on E, p=2,3; Spec R | [p]*=p=0 on H¹; identity acts by 1 | holds (Bhatt 2012 0.4) | none |
| §7.6 splinter ⟺ derived | 𝔽_p⟦x,y⟧; node; char 2 field | both hold / both fail | holds | none |
| §7.7 char 0 derived | field; elliptic curve; identity; Q=k[−1] | Ext²(k,k)=0; ω^•=ω[d] | limit passage unproved | R02 |
| §7.8 derived direct summand | finite case; blow-ups d=1,2; d=0 | RΓ=A₀; Proj ∅, k→0 not surjective | holds | none |
| Conventions: obstruction direction | 0→ℤ→²ℤ→ℤ/2→0; id | class 1∈Ext¹=ℤ/2; 0 | fixed | none |

## Not verifiable

- HH95 (uncertified): §1.2(d) and §2.3, cited for §0.6 and §6.3 through ANDRE18B lines 741–744 and 819; not read.
- STACKS tags 030O, 01XI, 02O5, 02O6, 0A6A: not in the cached chapter (R03); 081T verified.
- PerfectoidSpacesPartII was read from the board package's design README (commit 01c4a2d of the jobs repository), a design-stage text; its RA sections may still be renumbered or restated before its package stage.
- §3.5–3.6: the almost-pro-zero bookkeeping (constants c(k) = p^k m, finite-amplitude losses) was checked only against the RA.0–RA.1 contract statements, not recomputed.
- §4.10's finite-equation specialization and §7.7's Kovács-route details (duality trace, descent to ℂ) were not re-derived; §7.7's limit passage is R02.
- §7.5: Bhatt 2012's Propositions 3.1–3.2 and Corollary 3.5 were located (lines 294, 314, 366) but their proofs were not re-derived.
- Elaboration: no Lean was run (read-only pass); signatures are the worker's stored elaboration, compared by hand.

## Source issues

- **Error** in HOCHSTER02 at §4.1 Note, author preprint p. 8 (line 232): the source says the colimit over the degree bound of partial modifications at a fixed relation is the algebra modification; it should be the quotient by scalar-polynomial multiples only, which differs (T = k⟦x⟧[t]/(xt), relation x·t = 0: T/kt versus T/(t)); affects the proof (Theorem 4.2, "if" direction).
- **Misprint** in HOCHSTER02 at §4.1 definition, p. 8 (line 229): the source writes the modifying element as a module element minus scalar multiples of bare indeterminates; it should carry a distinguished element of the module as coefficient of each indeterminate; affects a stated result (the definition).
- **Gap** in HOCHSTER02 at Theorem 4.2, p. 9 (line 245): the source says it is easy to see that a double sequence of algebra modifications is a direct limit of partial ones; it should give a construction, since the Note it relies on is false; affects the proof.
- **Gap** in HEITMANNMA18 at Theorem 1.6, p. 4 (line 143): the source says that non-badness of partial double sequences is precisely what makes the full-modification limits nonzero modulo the maximal ideals; it should justify the passage from full to partial witnesses, inherited from Hochster; affects the proof.
- **Misprint** in ANDRE18B at §4.1, p. 85 (line 663): the source multiplies the modifying element by degree-bounded polynomials with coefficients in the module M; it should be scalar polynomials with a distinguished coefficient, as the product with M-coefficients is undefined for a module; affects the proof (Proposition 4.1.2).
- **Gap** in ANDRE18B at Proposition A.3.1, p. 91 (line 912): the source divides a nonzero functional by a power of r using only r-adic separation; it should assume r = 0 or r a nonzerodivisor, as the quotient functional is otherwise undefined; affects the proof.
- **Misprint** in ANDRE18B at Lemme A.2.1(4) proof, p. 90 (line 888): the source writes the dual as Hom over S of S into R; it should be Hom over R; affects nothing.
- **Misprint** in ANDRE18B at §0.1 statement (4), p. 72 (line 45): the source asserts the monomial equivalence for every Noetherian local ring; it should exclude dimension 0, where the empty product 1 never lies in the zero ideal; affects nothing.
- **Gap** in BHATT18 at Proposition 6.2, p. 11 (line 616): the source assumes only that the generic fibre is finite étale; it should also assume the generic fibre is surjective (or f dominant), since Y = Spec(A/p) has empty finite étale generic fibre and A → A/p is not almost split; affects a stated result.
- **Misprint** in BHATT18 at Theorem 5.4, p. 10 (line 563): the source's statement names a map A₀ → B₀ without introducing B₀; it should say "a finite extension A₀ → B₀"; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "dfaea305fad51b64e4a696996afe6af418efe620", "job": "RT-DirectSummandsAndBigCohenMacaulay~1b", "model": "fable", "worker": "chris-k"} -->

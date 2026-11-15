# PORT-RefinedTraceMethodsPartII

- **Branch:** `roadmap/refined-trace-methods-part-ii`, from `a40f789` (main).
- **Head commit:** `e827f774` — `RefinedTraceMethodsPartII: roadmap (README, Suggested.lean, metadata)`.
- **Folder:** `TauCetiRoadmap/RefinedTraceMethodsPartII/` with `README.md`, `Suggested.lean`, `metadata.toml` (`topic = "math.KT"`, as on main for StableHomotopyKTheory and AlgebraicKTheory). Nothing outside the folder changed.

## Build

`lake build TauCetiRoadmap.RefinedTraceMethodsPartII.Suggested`:

```text
Build completed successfully (18239 jobs).
```

3 warnings, all `declaration uses 'sorry'` (lines 63, 71, 79 of `TauCetiRoadmap/RefinedTraceMethodsPartII/Suggested.lean`). The first build also gave the warning "imports `Mathlib` … consider adding `module`"; the file now starts with `module` (as `TauCetiRoadmap/SieveMethodsAndPrimePatterns/Suggested.lean` on main does), and the rebuild has `sorry` as its only warning.

## Gate

```text
gate RefinedTraceMethodsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

## Dependency check

```text
depcheck: 244 roadmaps, 2247 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. RefinedTraceMethodsPartII is line 345 of the merge order, after all of its suppliers.

## Draft pull request body

This roadmap turns the trace machinery of RefinedTraceMethods into closed formulas for the algebraic K-theory of the standard singular and finite rings, where Part I stops at the general theory (THH and TC, the cyclotomic trace, Dundas–Goodwillie–McCarthy, truncating excision, continuity) and computes no such groups. It builds the Nikolaus–Scholze calculus of pointed-monoid algebras (the cyclotomic splitting `THH(k(Π)) ≃ THH(k) ⊗ Σ^∞B^cy(Π)` with its unstable Frobenius and the circle-equivariant cell types of the cyclic bar constructions of the coordinate axes, the cusps and the truncated polynomial monoids), a circle-cell Tate calculus over perfect and perfectoid coefficients ending in a staircase lemma for the TC equalizer, and the passage from K to TC through birelative terms of normalization squares. On that base it proves Hesselholt's formula for `K_q(k[x,y]/(xy),(x,y))` over regular noetherian 𝔽_p-algebras, Speirs' formulas for the coordinate axes in affine d-space over perfect fields (including a corrected p = 2 odd-degree formula) and over ind-smooth ℚ-algebras, the Hesselholt–Nikolaus theorem for the planar cusps `y^a = x^b` over perfect 𝔽_p-algebras, Riggenbach's theorem `K_{2r−1}(R[x]/x^e,(x);ℤ_p) ≅ W_{re}(R)/V_eW_r(R)` over every perfectoid ring, and the Antieau–Krause–Nikolaus theorems for every finite chain ring `O_K/ϖ^n` (syntomic description of the p-adic K-groups, Angeltveit's order quotient, the even vanishing theorem and the nilpotence bound for v₁), together with the prismatic and syntomic cohomology relative to δ-rings and of filtered rings that these need. The elementary indexing arithmetic (cusp truncation sets and Sylvester's count, cyclic words without repetition, p-typical index functions, finite-chain-ring exponents) is Layer 1, and its three counting theorems are the statable headlines of `Suggested.lean`; the K-theoretic headlines are named there with the carriers the pins lack.

## Dependencies that are still pull requests

RefinedTraceMethods, KTheoryFiniteLocalFields, QWittVectors, CrystallineCohomology, DerivedDeRhamCohomology, GeneralAlgebraicKTheory, SchemeKTheoryOperations, AInfCohomology, PrismaticCohomology, PrismaticCohomologyPartII, PrismaticCohomologyPartIII. All are earlier in the merge order. Suppliers on main: BordismFormalGroups, StableHomotopyKTheory, EnhancedDerivedSheaves. GeneralAlgebraicKTheoryPartII and StableHomotopyKTheoryPartII are named only in "What is left out" as owners of excluded material; they are not suppliers (no `*Needs:*` line, contract row or Dependencies line names them), and depcheck reports no edge problem.

No cited id is defined only by an open revision. Two open revisions of EnhancedDerivedSheaves and two multi-roadmap revisions that touch BordismFormalGroups exist; the overlap check reports that none drops an id this README cites (§§E5:abstract.1, E5:abstract.2, E5:presentability.2; §F6.5), and the ids resolve on main.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already had the required form: three definitions with real bodies (`cuspCount`, `cuspTruncationSet`, `cuspCoprimeSet`) and the three statable headlines (`ncard_cuspTruncationSet`, `ncard_cuspCoprimeSet`, `card_noCyclicRepetition`), no padding, no sorry'd data, a single `import Mathlib`. Changes to the file:

- `module` added as the first line (removes the module-system warning).
- Module docstring: the AKN bullet reflowed so that no docstring line begins with the word "theorem" (the worker's signature extractor read the line "theorem and the nilpotence bound…" as a declaration named `and`); "the even vanishing theorem" now reads "the vanishing of the even K-groups above the threshold".
- Module docstring, Speirs bullet: the missing carriers were "relative algebraic K-groups, big or p-typical Witt-vector valued K-groups and cyclic homology". p-typical Witt vectors exist at the pin (`WittVector`, `TruncatedWittVector`), and the formulas need relative K-groups and (for the characteristic-zero HC formula of §5.4) cyclic homology only; the bullet now says so and names the HC formula as one of the non-statable headlines.

No headline statable at the pins is missing. Checked against every README target: the remaining statable items (§1.1 `#(S/a) = (r+1)b`, §1.3 `Σ h = #T`, §1.4 Möbius inversion, §1.5 ε-count, §3.5 staircase lemma, §4.2 conductor) are bookkeeping or algebra on free variables, not headlines; every K-, TC-, HC-, Witt- or prismatic-valued headline lacks its carrier at the pins (searched by object: no higher or relative K-groups, THH, TC, cyclic homology, big Witt vectors, de Rham–Witt complexes, δ-rings, prisms or syntomic complexes in Mathlib `1b1ccf4` or Tau Ceti `2fd255d`; `TauCeti/RingTheory/Syntomic` is syntomic ring maps and `TauCeti/RingTheory/WittVector` is p-typical `A_inf` material).

**Signature check.** I put `#check @name` for all six declarations into one scratch copy of the file and elaborated it once with the project's Lean. Elaborated types: `cuspCount, cuspTruncationSet, cuspCoprimeSet : ℕ → ℕ → ℕ → …`; `ncard_cuspTruncationSet : ∀ {a b : ℕ}, 2 ≤ a → 2 ≤ b → a.Coprime b → ∀ r, 2 * (cuspTruncationSet a b r).ncard + 2 = (a + 1) * (b + 1) + 2 * r * a * b`; `ncard_cuspCoprimeSet` likewise with `2 * ncard = (2 * r + 1) * (a - 1) * (b - 1)`; `card_noCyclicRepetition : ∀ (d : ℕ) {m : ℕ}, 1 ≤ m → ↑#{w | ∀ i, w i ≠ w (finRotate m i)} = (↑d - 1) ^ m + (-1) ^ m * (↑d - 1)`. These equal the README statements of §§1.1 and 1.4; the file has no `variable` block, so no binder can be dropped. Nothing changed. In the same scratch file `decide` confirmed `cuspCount 2 3 11 = 2`, `cuspCount 2 3 12 = 1`, `cuspCount 2 3 6 = 0`, `cuspCount 2 3 17 = 3` and the word counts 18 (d = 3, m = 4), 6 (d = 3, m = 3), 0 (d = 5, m = 1).

## Supplier replacements and duplication removals

None needed.

- Library: `frobeniusNumber_pair` (`Mathlib/NumberTheory/FrobeniusNumber.lean:59`, coprime m, n > 1, `FrobeniusNumber (m*n − m − n) {m, n}`), `ArithmeticFunction.moebius` (`Moebius.lean:54`), `moebius_mul_coe_zeta` (`:177`), `finRotate` (`Mathlib/Logic/Equiv/Fin/Rotate.lean:27`), `WittVector` (`Defs.lean:52`), `TruncatedWittVector` (`Truncated.lean:62`), `WittVector.verschiebung`/`frobenius`/`teichmuller`, `MonoidWithZero`, `MonoidAlgebra` (`Defs.lean:76`, a structure at this pin), `KaehlerDifferential` (`Kaehler/Basic.lean:148`), `TauCeti.NodeAlgebra` with `coord`, `coord_zero_mul_coord_one`, `lift` (`TauCeti/RingTheory/Node/Basic.lean`), `TauCeti.Perfectoid.IsIntegralPerfectoid` (`TauCeti/RingTheory/Perfectoid/Integral.lean:76`) all exist at the pins as cited. No pinned declaration proves a target here: Mathlib's cycle-graph colouring file gives bicolourings and chromatic numbers only, and there is no numerical-semigroup count, contracted monoid algebra or truncation-set API.
- Suppliers: every cited section resolves at the supplier's current head (open) or on main: RefinedTraceMethods §§1.2, 1.3, 1.4, 1.9, 2.1, 2.3–2.6, 2.8–2.10, 2.13, 2.16, 4.12, 4.17–4.19; KTheoryFiniteLocalFields §§1.1–1.6, 2.1, 4.0, 4.4, 5.1, 5.16, 5.17; QWittVectors §§1.1–1.5, 1.4a (with `BigWitt.TruncationSet` in its §1.1 and `Suggested.lean`); CrystallineCohomology CR.2, CR.4; DerivedDeRhamCohomology §§1.14–1.17, Layers 2 and 5; GeneralAlgebraicKTheory §§8.1, 10.5; SchemeKTheoryOperations §5.2; AInfCohomology AI.0, §AI.7.2; PrismaticCohomology §§0.55, 0.56, 0.73–0.76, 0.93, 1.2–1.4, 2.1, 2.13; PrismaticCohomologyPartII §§3.6, 3.9, 3.10, 3.19, 3.20, 3.24, 4.4–4.10, 4.17–4.19, 4.22, 4.23, 4.25, 4.29, 4.31; PrismaticCohomologyPartIII §§6.8, 6.9, 6.16, 6.24, 6.31, 7.0 (which states `gr^n TC(R;ℤ_p) ≃ ℤ_p(n)(R)[2n]` as cited); StableHomotopyKTheory §§7.9, 7.11, 7.14, 7.15, 7.17; EnhancedDerivedSheaves §§E5:abstract.1, E5:abstract.2, E5:presentability.2; BordismFormalGroups §F6.5. `roadmaps resolve` on the ported README: no cross-roadmap citation and no Lean name found nowhere.
- Restatement check: the §1.2 restriction-kernel theorem is not in QWittVectors (its §§1.3–1.4 have restriction, F, V, τ and the coordinate expansion, which §1.2 cites as inputs); the Conventions' Witt-sign witness coincides with a Check of QWittVectors §1.3 and stays as this roadmap's pinned convention witness.
- Declared supplier gaps, unchanged and still open at the suppliers' heads: `gap:bigwitt-ptypical-decomposition` (QWittVectors; its §1.5 gives only the `Div(p^a)` comparison) and `gap:perfect-homotopy-invariance` (SchemeKTheoryOperations; its §5.2 covers regular noetherian schemes only). The README keeps them in the main-branch form "What X must provide (gap:…)", as BelyiMaps and IndexTheory do on main.

## Duplication sweep and ownership

Searched by object with `roadmaps grep` over main and all open roadmap heads (473–474 pull requests, which includes the 238 checkouts of the brief's list): cusp equations `y^a − x^b` and planar cuspidal curves; cyclic repetition and cyclic words; pointed monoids; birelative K-theory; coordinate axes; staircase; Angeltveit; even vanishing; finite chain rings and K-groups of `ℤ/p^n`, `ℤ/4`; truncated polynomial algebras `R[x]/x^e`; big Witt vectors `W_S(k)`; δ-pairs and prismatic cohomology relative to δ-rings; filtered prisms; F-smooth rings; Nygaard dimension; Hahn–Levy–Senger; Bouis; the name RefinedTraceMethodsPartII. Findings:

- Pointed-monoid THH in the genuine model and truncated polynomials over regular noetherian 𝔽_p-algebras: KTheoryFiniteLocalFields §§5.16–5.17, already cited (the perfect-field case is a Check of §7.2 here).
- Big Witt vectors: QWittVectors (cited); GeneralAlgebraicKTheoryPartII consumes them for NK, a different object.
- "Birelative" in RefinedTraceMethods §4.17–4.18, GeneralAlgebraicKTheory and K2SymbolsBrauer is general excision theory, imported here by section; no roadmap computes the birelative terms of the axes or cusps.
- "Even vanishing" in ArithmeticKTheory is GeneralAlgebraicKTheory §13.8c for number rings, not finite chain rings. "Angeltveit" in AInfCohomology is Angeltveit–Rognes (Hopf algebra structure on THH).
- "δ-pair" in PrismaticCohomology §0.73, PrismaticCohomologyPartII and PrismaticCohomologyPartIV is a δ-ring with an ideal, a different object from §8.1's pair (δ-ring A, A-algebra R); "filtered prism" hits in PrismaticCohomologyPartIII are the filtered Frobenius pairings of syntomic cup products, not filtered prisms in the sense of §8.5.
- Cuspidal-curve hits (AlgebraicKTheory, EtaleCohomologyFoundations, DiamondsAndVStacks, NeronModels…, AdicSpacesPartV, RiemannianGeometry) are examples (Picard group of a cusp, universal homeomorphisms), not K-theory calculations.

Nothing this roadmap owns is owned elsewhere; nothing was removed. No `Suggested.lean` declaration shares a fully qualified name with a declaration of another roadmap (the namespace `TauCetiRoadmap.RefinedTraceMethodsPartII` occurs nowhere else).

## Fixes made as an upstream reviewer

1. **Summary (Part II introduction).** A Part II must say where the base roadmap stops; the package did not. Added: RefinedTraceMethods stops at the general theory (THH and TC of ring spectra, the cyclotomic trace, Dundas–Goodwillie–McCarthy, truncating excision, continuity) and the low-degree symbol calculations of its §4.19, and computes no K-group of a singular curve, of a truncated polynomial algebra in all degrees or of a finite chain ring. Checked against RefinedTraceMethods' headings and its §4.19 low-degree tests (relative K_1 of `k[t]/t^n`, K_2 of dual numbers).
2. **Scope, "What is left out".** The package excluded the rational cusp calculation because "no supplier provides … the cyclic homology of cusp algebras over ℚ-algebras". That reason is inaccurate: §2.4 here gives `HC(k(Π)/ℚ) = (HH(k/ℚ) ⊗ B^cy(Π))_{hT}` and §2.6 the mixed complex of the cusp cofibre, and hesselholt-cusp-polytopes line 198 says the characteristic-zero answer follows from Geller–Reid–Weibel's cyclic homology and Cortiñas' KABI theorem. The exclusion is kept (it is a scope decision) without the false reason, located at line 198 and stated for fields of characteristic zero, as the source does. The F-smooth exclusion keeps its (correct) reason; no roadmap mentions Nygaard dimension or F-smooth rings in this sense.
3. **§2.3 second Check.** "A splitting with the unreduced B^cy would add a copy of THH(𝔽_p) … and double the dimension in even degrees", stated for weight 1, mixed weights: the basepoint has no weight. Now: the unreduced construction treats Π_2 as an unpointed monoid and computes THH of `MonoidAlgebra 𝔽_p Π_2 ≅ 𝔽_p × 𝔽_p[x]/x²` (§2.1), with an extra summand THH(𝔽_p) carrying 𝔽_p in every even degree.
4. **Downstream consumers.** "No existing roadmap cites these calculations" and "It would use" were state-of-the-world and conditional wording; restated timelessly.
5. **Supplier contract headings** made uniform (`From TauCetiRoadmap.<X>`), one heading per roadmap (BordismFormalGroups, PrismaticCohomology, PrismaticCohomologyPartII, PrismaticCohomologyPartIII, StableHomotopyKTheory, EnhancedDerivedSheaves); contents unchanged.
6. **Lean docstring** (above): missing carriers for Speirs' formulas corrected.

## Adversarial mathematics pass

Values recomputed this round (Python scripts in the scratch directory for Layer 1 and §5.3; hand computation elsewhere).

| Statement | Instances tried | Values computed (both sides) | Result | Change |
| --- | --- | --- | --- | --- |
| `ncard_cuspTruncationSet` (§1.1) | all coprime 2 ≤ a, b ≤ 7, r = 0…3; (2,4); a = 1 | 2#S + 2 = (a+1)(b+1) + 2rab in every case; S(2,3,0) = {1,2,3,4,6} (12 = 12), S(2,3,1) = {1,…,10,12} (24 = 24), S(2,5,0) = {1,2,3,4,5,6,8,10} (18 = 18); for (2,4), ℓ(2,4,odd) = 0 so S is infinite (ncard 0): coprimality needed; a = 1, b = 2, r = 0: S = {1,2}, 6 = 6 | true; `2 ≤ a, b` not needed for the count (holds for a, b ≥ 1), P3 note only — kept, sources and cusp interpretation have a, b ≥ 2 | none |
| `ncard_cuspCoprimeSet` (§1.1) | same range | 2#T = (2r+1)(a−1)(b−1) everywhere; T(2,3,0) = {1}, T(2,3,1) = {1,5,7}, T(2,3,2) = {1,5,7,11,13}, T(2,5,0) = {1,3} | true | none |
| `card_noCyclicRepetition` (§1.4) | d = 0…4, m = 1…6; m = 0 | count = (d−1)^m + (−1)^m(d−1) in all 30 cases (e.g. 6, 6, 18, 66 for d = 3, m = 2, 3, 4, 6; 0 for d ∈ {0,1} or m = 1); m = 0: count 1 against d | true; `1 ≤ m` needed | none |
| `cuspCount` periodicity and Lemma 1.4(1)–(2) | coprime 2 ≤ a, b ≤ 9, r ≤ 3, every m in [rab+1,(r+1)ab] | ℓ ∈ {r, r+1} always, ℓ = r when a | m or b | m; ℓ(m+ab) = ℓ(m)+1 for m ≥ 1; m = 0: ℓ(0) = ℓ(6) = 0 for (2,3) | true; m ≥ 1 needed | none |
| §1.1 divisor monotonicity, S/a, S/ab, conductor | same range | ℓ(s) ≤ ℓ(m) for s | m; #(S/a) = (r+1)b, #(S/ab) = r+1; every n ≥ (a−1)(b−1) representable, (a−1)(b−1)−1 not | true | none |
| §1.2 restriction kernel | S = {1,2}, n = 2, 𝔽_2; n = 1; S = {1,…,4}, n = 2 | ℤ/4 / {0,2} = 𝔽_2 = W_{1}; T = ∅, 0 = 0; T = {1,3}, 4 elements over 𝔽_2 against 8 for {1,2,3} | true | none |
| §1.3 `h = s_T(m′)`, `Σ s_S(d) = #S` | coprime a, b ≤ 8, p ∈ {2,3,5,7}, p ∤ b, r ≤ 2; S = {1..m}, m ≤ 29 | h = s_T at every m′ ∈ J_p; Σ h = ½(2r+1)(a−1)(b−1); S = {1..4}, p = 2: 3 + 1 = 4 | true | none |
| §1.4 cyc, c, t_ev, t_od | d = 2, 3, s ≤ 6 | cyc_3 = 0,3,2,3,6,9; cyc_2 = 0,1,0,0,0,0; A = Σ s·cyc; c_1 = 0,1,0,1,0,1; c_2(2) = 3, c_2(3) = 2; (p,r,m′) = (2,1,3): t_od = 1, t_ev = 0 | true | none |
| §1.5 ε-count and B | n ≤ 6, i ≤ 5; p ∈ {2,3,5}, e ≤ 5, n ≤ 9 | Σε = i(n−1) always; j − n/e ∈ [0,1); B ≤ p²(p^j−1)/(p−1)²; n ≤ e gives p²n/((p−1)e); B(2,1,2) = 12, B(2,3,3) = 4 | true | none |
| Conventions: Witt sign, Verschiebung, Tate grading, circle cells, syntomic degrees | `W_{{1,2}}(ℤ)`; 𝔽_2, e = 2; Hℤ trivial C_p; m = 1; ℤ/4 | τ(1)+τ(1) = (2,−1), γ_2 = 1 + 2t + 3t² (componentwise (2,0) gives 1+2t+4t²); ℤ/4 / 2ℤ/4 = ℤ/2 = #(1 + x𝔽_2[x]/x²); π_{2r} = Ĥ^{−2r}(C_p;ℤ) = ℤ/p, odd 0; (Hℤ ⊗ T_+)^{hT} = ΣHℤ; H¹(ℤ_2(1)(ℤ/4)) = (ℤ/4)^× = ℤ/2 | true | none |
| §2.1 pointed-monoid algebra | Π_0, Π_e, Π_d, ⟨t^a,t^b⟩ | ranks 1 against 2; e against e+1; [0] idempotent and central, so k[Π] ≅ k × k(Π); y^a − x^b ↦ t^{ab} − t^{ab} | true | none |
| §2.2 weights, Π_2 | ⟨t⟩_+; Π_2 weights 1, 2 | weight m ≥ 1 piece (T/C_m)_+; Π_2: (T/C_1)_+ and cofib((T/C_1)_+ → (T/C_2)_+), from d = ⌊(s−1)/e⌋ = 0 | true | none |
| §2.3 splitting and convergence control | 𝕊[t]; 𝔽_p, Π_2; ℚ[β^{±1}], m = 2j+1 | π_0 Σ^∞_+T = ℤ; dims 1 in each degree; piece S^{λ_j} ∧ (T/C_m)_+, (2j−1)-connected, π_0X_m ⊇ ℚβ^{−j} so ⊕ ≠ ∏ | true | Check reworded (fix 3) |
| §2.4 linear splitting | ℚ[t] weight m | HH ℚ in degrees 0, 1; B(t^m) = m t^{m−1}dt, so HC weight m is ℚ in degree 0 only | true | none |
| §2.5 cell types | s even; s, i odd; s odd, i even; x_1x_2x_3; x_1² | homology in m−1, m; cone of ×2 gives R/2 and R[2]; degrees 2, 3; (T/C_2)_+ not contractible | true | none |
| §2.6 cusp mixed complex | (2,3), m = 1, 6 | m = 1: ℤ ⊗ T_+; m = 6: H_1 complex ℤ → ℤ² → ℤ, 1 ↦ (3,2), (x,y) ↦ 2x − 3y exact, H_0 isos: total cofibre 0 | true | none |
| §3.1–3.2 | Z = C_{p+}, S⁰, S⁰ ∨ EC_{p+}; m = 1, p | 0 = 0; identity of ℤ/p; ℤ/p → (ℤ/p)², not onto; π_1 = ℤ; ℤ/p in odd degrees | true | none |
| §3.4 coefficient tower | R = 𝔽_p, n = 0, 1, 2 | π_0 of `ℤ_p[u,v]/(uv−p, p^n v)` = ℤ/p^{n+1}, π_{−2} = ℤ/p^n, Tate π_0 = ℤ/p^n; n = 0 gives 𝔽_p[u] | true | none |
| §3.5 staircase lemma | s = 0, s ≥ 1, zero maps | kernel ≅ A_{s−1} (forward through c_v^{−1}φ, backward through φ^{−1}c), A_0 for s = 0; δ onto; zero maps: kernel ∏ℤ/p | true | none |
| Layer 3 Examples | k perfect, (k[t],(t)) | TC_1 = 0: H^{−1}(ℤ_p(0)) = 0, (k^×)^∧_p = 0, ℤ_p(i≥2) = 0; TC_{−1} ∋ [t] ↦ t ∉ {f^p − f} | true | none |
| §4.1–4.3 | ℤ → ℤ/p; axes over a field; cusp (2,3); 𝔽_p[ε] | not a Milnor square, birelative = K(ℤ,pℤ); K_0(A_d) = ker(ℤ^d ⊕ ℤ → ℤ^d) = ℤ, K_0(A_d,I_d) = 0; conductor t²k[t], A/c = k, B/c = k[t]/t²; 1 + εt ∈ NK_1 | true | none |
| §5.1–5.2 | q ≤ 2; 𝔽_3, q = 1…6; p = 2, q = 4 | q = 2: TR^1_{2−λ_1} = π_0THH(k) = k; 0, 𝔽_3, 0, 𝔽_3², 0, ℤ/9 ⊕ 𝔽_3 (s(3,1) = 2, s(3,2) = 1); Ω²_k ⊕ W_2(k), exponent 4 | true | none |
| §5.3 headline formulas | d = 2, 3; q = 1…6; p = 2, 3, 5 | d = 3 lengths: q = 2: 3, q = 3: 2, q = 4: 9 (W_2³ ⊕ k³ at p = 2, k^9 at p = 3, 5), q = 5: 8, q = 6: 21, independent of p; d = 2 lengths equal §5.2's Σ s(r,d′) for r ≤ 5, odd groups 0; every product finite | true; consistent across primes and with §5.2 | none |
| §5.4 | d = 2, 3, k algebraic over ℚ; ℚ(t) | d = 2 ranks 1,0,1,0,1 (q = 2…6) = ⊕Ω^{q−2m}; d = 3 ranks 3, 2, 6, 6, 12; q = 2: 3 = d(d−1)/2 = §5.3; q = 3: 2 = §5.3; ℚ(t), q = 3: Ω¹ ≠ 0 | true (q ≥ 4 differs from char p, as the d = 2 Check says) | none |
| §6.1–6.2 headline | (2,3,0/1/2), (2,5,0) over 𝔽_2, 𝔽_3, 𝔽_5 | 𝔽_2; ℤ/25 ⊕ 𝔽_5 and 𝔽_3³ (length 3); 𝔽_2^5 and ℤ/25 ⊕ 𝔽_5³ (length 5); W_2(𝔽_3) = ℤ/9 (length 2) | true | none |
| §7.1–7.2 headline | e = 1; (𝔽_2,2,1), (𝔽_3,2,2), (𝔽_p,p,1), (O_C,2,1); 𝔽_2[z]/z³, r = 1, 2, 3 | 0; ℤ/2; W_{{1,3}}(𝔽_3) = ℤ/9; 𝔽_p^{p−1} = (1 + x𝔽_p[x]/x^p)^×, exponent p; O_C = 1 + xO_C; ℤ/4, ℤ/8 ⊕ ℤ/2, ℤ/16 ⊕ (ℤ/2)², the 2-parts of akn24's table | true | none |
| §8.1 | 𝔽_p; (ℤ_p, ℤ/p²); ∏(ℤ_p, ℤ/p^n) | δ(0) = δ(p) = 1 − p^{p−1} = 1 in 𝔽_p, contradiction; δ(p^m u) = p^{m−1}u − p^{mp−1}u^p ∈ pℤ_p (m ≥ 2), not pre-prismatic; unbounded torsion | true | none |
| §8.2 | 𝔽_2, i = 1, j = 3; (ℤ_2⟦z⟧, z ↦ 2), i = 1 | 2a ↦ 2a − a = a iso, fibre 0; mod 2 map f ↦ fz + f² has kernel {0, z} = k and image {b_0 = b_1, b_2 = 0}, H¹ = k² | true | none |
| §§8.3–8.6 | A = R = ℤ_p; ℤ_p → W(𝔽_q); ℤ/4 against 𝔽_2[z]/z²; ℤ_p⟨z⟩ | gr_0 = ℤ_p ⊕ ℤ_p[−1]; relatively perfect; K_3: ℤ/8 against W_{{1,3}}(𝔽_2) = 𝔽_2², H¹ of order 2 for both; 1 + pz a unit, 1 + z not | true | none |
| §§9.1–9.3 headline | 𝔽_q; ℤ/4; ℤ/8; 𝔽_2[z]/z³ | K_{2i−1}(𝔽_q;ℤ_p) = 0; 8/2 = 4 = 2^{2·1}; 32/2 = 16 = 2^{2·2}, 128/2 = 64 = 2^{3·2}; 64/1 = 2^{3·2}; ratio q^{in} would give 2^9 | true | none |
| §9.4 bases | p = 2, n = 3, weights 2, 3 | z_0² only (k < p would give rank 0); f_0 only, w = 0 (dropping k < n adds d_N z_0³) | true | none |
| §9.5 headline | ℤ/4; n ≤ e; exponents | B = 12, i ≥ 13, order (2^i − 1)2^i, 56 at i = 3; B → 0 as e → ∞; step-1 exponents 6 and 3; B·(p−1)e/p equals exponent (a) for p ≤ 3, e ≤ 3, n ≤ 7 | true | none |
| §9.6 headline | ℤ/4; n = 1; e = 2, n = 3 | [2]_2 = 3 with equality (e | n); v₁ acts by 0; bound p + 1, inequality only | true | none |

Context: `Suggested.lean` has no `variable` or `include` block; each theorem carries `2 ≤ a`, `2 ≤ b`, `Nat.Coprime a b` (so `a − 1`, `b − 1` are not truncated) or `1 ≤ m` in its own signature. Generality: README and Lean agree (coprime a, b ≥ 2, every r; every d, m ≥ 1, an identity in ℤ).

## Unresolved

- The two declared supplier gaps (`gap:bigwitt-ptypical-decomposition` against QWittVectors, `gap:perfect-homotopy-invariance` against SchemeKTheoryOperations) remain open at the suppliers' heads, as in the accepted review.
- For the human reviewers (carried from the accepted review): whether the characteristic-zero cusp calculation, whose cyclic-homology input §§2.4 and 2.6 provide, should be a target of a later Part; and the licence status of `larsen-mixed` and `bach-hypersurfaces`, cited by locator only.
- Ownership against open pull requests was checked through `roadmaps grep` over all open heads and the brief's checkouts; no conflict found.
- No suspicious instruction was found in any text read (package, reports, supplier READMEs, sources).


Pull request: #2410 (roadmap/refined-trace-methods-part-ii at e827f77)

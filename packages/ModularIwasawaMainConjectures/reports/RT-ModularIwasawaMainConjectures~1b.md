<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/165#issuecomment-6338319496 -->
Red team round 1 pass b (claude) of 0a73908

Verdict: needs_changes

1. **F01** (P2) Suggested.lean does not elaborate at the pinned Mathlib: the two 𝔽₇-representation statements fail instance synthesis

   **Location:** `packages/ModularIwasawaMainConjectures/Suggested.lean:106`: “theorem fwAuxiliary_independentCharacters : FWAuxiliaryCondition (F := ZMod 7)” and `Suggested.lean:129`: “example : IsRamifiedAt (F := ZMod 7)”.

   **Claim:** The file is submitted as elaborating with only `sorry` warnings (the package's review notes record a clean check at a different Mathlib head). At the roadmap repository's pins (Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a, Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039) the probe copy fails with three errors: `failed to synthesize Module (ZMod 7) (ZMod 7 × ZMod 7)` at 106:44, `failed to synthesize Module (ZMod 7) (ZMod 7)` at 129:10, and a cascading `No goals to be solved` at 132:2. Both statements are ill-typed at the pin, so the Layer 1 target `fwAuxiliary_independentCharacters` (README.md:666) and the positive `IsRamifiedAt` test (README.md:699, 707) have no elaborating form. Diagnostics in probe copies: the same predicates applied to a `ZMod 3`-valued representation (global `Fact` instance) fail identically, a bare statement about the `ZMod 7` representation without the predicate elaborates, the ℚ-valued versions elaborate, and the `ZMod 7` versions elaborate only when the `Field`, `AddCommGroup` and `Module` instances are passed by name through `@IsRamifiedAt`. The remaining declarations of the file, including the F₇ examples for `DistinctCharacters` and `LocalExclusion` (lines 157, 171), elaborate.

   **Witness:** probe copy of the submitted file, `lake env lean`, exit 1 with the three errors above; the repaired copy below, exit 0, six `declaration uses 'sorry'` warnings only (lines 106, 200, 210, 228, 280, 298 of the repaired copy).

   **Exact repair text:** Replace lines 103–113 of Suggested.lean by

   ```lean
   /-- Positive boundary case (README §1.1): on `ℚ²`, let `D = ℚˣ × ℚˣ` act by the two
   tautological characters and let `I` be the kernel of the first projection. Then the
   `I`-invariants are a line and the `D`-invariants vanish. -/
   theorem fwAuxiliary_independentCharacters : FWAuxiliaryCondition (F := ℚ)
       (Representation.prod
         ((Representation.ofDistribMulAction ℚ ℚˣ ℚ).comp (MonoidHom.fst ℚˣ ℚˣ))
         ((Representation.ofDistribMulAction ℚ ℚˣ ℚ).comp (MonoidHom.snd ℚˣ ℚˣ)))
       ⊤ (MonoidHom.fst ℚˣ ℚˣ).ker := by
     sorry
   ```

   and lines 127–134 by

   ```lean
   /-- Positive test: the scalar action of `ℚˣ` on `ℚ` is ramified on the whole group;
   `-1` acts by `-1 ≠ 1`. -/
   example : IsRamifiedAt (F := ℚ) (Representation.ofDistribMulAction ℚ ℚˣ ℚ) ⊤ := by
     refine ⟨-1, Subgroup.mem_top _, fun h => ?_⟩
     have h1 := LinearMap.congr_fun h 1
     simp only [Representation.ofDistribMulAction_apply_apply, LinearMap.id_apply] at h1
     norm_num at h1
   ```

   In README.md:666 write “on ℚ², with D=ℚˣ×ℚˣ acting by the two tautological characters and I=ker(fst), the I-invariants are a line and the D-invariants vanish”; in README.md:699 write “scalar multiplication of ℚˣ on ℚ is ramified on the full group”; in README.md:700 write “let D=ℚˣ×ℚˣ act diagonally on ℚ² and let I=ker(fst)”; in README.md:707 write “The scalar ramification witness is −1∈ℚˣ, acting on ℚ by −1≠1.” (The F₇ character tests of lines 701–702 and the Lean examples at lines 157 and 171 stay as they are.) If the 𝔽₇ carrier is to be kept instead, state both declarations with explicit instances, `@IsRamifiedAt (ZMod 7) (ZMod 7)ˣ (ZMod 7) (ZMod.instField 7) _ (ZMod.commRing 7).toAddCommGroup Semiring.toModule ρ ⊤`, which elaborates in a probe copy.

2. **F02** (P3) Layer 0 Dependencies cite a section identifier that does not exist in ArithmeticGaloisRepresentations

   **Location:** `packages/ModularIwasawaMainConjectures/README.md:638`: “ArithmeticGaloisRepresentations R01, and the signed regulator contract stated above.”

   **Claim:** The supplier has no identifier `R01`: at its current head (76d989b) its sections are `## Layer 1` … `## Layer 7` (continuous representations and integral models; decomposition groups, inertia and Weil–Deligne representations; Artin and Swan conductors; residual images and oddness; recognition by Frobenius polynomials; Tate modules of elliptic curves and abelian varieties; dimension-general API). The residual representations and local types this roadmap consumes (README.md:12) live in its Layers 2, 4 and 6.

   **Witness:** `grep -n 'R01'` on the supplier README at head 76d989b returns nothing; its layer headings are at that file's lines 650, 1395, 2476, 2815, 3138, 3629, 4055.

   **Exact repair text:** “ArithmeticGaloisRepresentations Layers 2, 4 and 6 (decomposition and inertia groups with Weil–Deligne representations, residual images, and Tate modules of elliptic curves), and the signed regulator contract stated above.”

## Verified sound

Read in full: all 1,870 lines of README.md (51 numbered sections, 7 layers, 23 bold targets), all 354 lines of Suggested.lean (29 declarations: 6 definitions, 11 theorems, 11 proved examples, 1 local instance), metadata.toml and review.json. Every Lean declaration name occurs in the README. Policy: title lower-case per upstream convention; single `import Mathlib`; no `set_option`; no `lemma` declaration; no sorried data; no LaTeX delimiters; no process words, issue or pull-request numbers in README or docstrings; at most two proved examples per kept definition.

Elaboration: the submitted file fails as in F01; with the F01 repair it elaborates with exactly six `declaration uses 'sorry'` warnings. One-tactic probes of the six sorried theorems (`hasRankOneCoinvariants_of_unipotent`, `not_hasRankOneCoinvariants_upper_uniformizer`, `hasRankOneImage_fullAutomorphismGroup`, `sl2Zp_closedSubgroup_eq_top`, `associated_of_eq_away_of_mu_eq`, the ℚ form of `fwAuxiliary_independentCharacters`) with `simp_all`, `aesop` and `exact?` close none of them; none is a one-tactic consequence of the pinned Mathlib. The five sorried theorems were checked mathematically on the boundary cases of §1.1 (unit versus uniformiser upper entry; identity; zero ring excluded by `Nontrivial`; the p = 3 binary tetrahedral counterexample; ϖ versus 1 for the μ-hypothesis) and found true as stated.

Locators: about 105 locators were checked against the `=== page N ===` markers of 21 cached legal copies (Skinner–Urban author copy, Skinner 2014, Kato with the Numdam cover offset, Fouquet–Wan v3, Lei–Loeffler–Zerbes v3, Rodrigues Jacinto–Williams v2, Rubin's draft with its printed numbers, Stein–Wuthrich offprint, Mazur–Stein–Tate, Burungale–Castella–Skinner v2, Emerton–Pollack–Weston v1, Waldschmidt with the Numdam cover offset, Ribet's report, Castella–Grossi–Skinner, Keller–Yin, Burungale–Skinner–Tian–Wan, Castella's erratum, Hida's addendum, Nakamura, Colmez, the LMFDB 14a1 record). Every page number checked agrees (Kato Theorem 12.5 begins on p.221 and the README's “pp.221–222” covers it). Statement checks: Skinner–Urban §1.1 (unramified line, determinant twist, Selmer group, lattice dependence, Theorem 1 hypotheses), Skinner §2.3 Euler factor P_ℓ at Ψ⁻¹ε⁻¹(frob_ℓ) matching the README's ℓ⁻¹γ_ℓ⁻¹ convention, Ribet's (3.3), (4.7) and (8.1), BCS Remark 1.1.3(iii), LMFDB 14a1 reduction types (nonsplit at 2, split at 7).

Checks recomputed (about 30): Frobenius discriminants −4 ≡ 3 mod 7 and −8 ≡ 2 mod 5, 5 mod 13 (nonsquares); eta-product multiplicativity a₄ = a₂² − 8, a₆ = a₂a₃, a₂₅ = a₅²; the mod-13 congruences a_ℓ ≡ 1 + ℓ³ at ℓ = 2, 3, 7, 11 and 13 | 5⁴ − 1; a₂² − 32 ≡ 5 mod 7; μ(5)·5⁻¹ ≡ 4 mod 7; ω³ ≠ 1 for p = 7; the Euler-factor witness 21/22 versus 9/11; 2·4 ≡ 1 mod 7; the unit root of X² + 2X + 7 ≡ −2 mod 7; L(E,1)/Ω⁺ = 1/5 and the MTT rank-zero value (1 − α⁻¹)²/5 for 11a1 at 7; the torsion bound (11 − 1)·5 = 50; #Ẽ(𝔽₅) = 5 and the valuations 2 versus 1 for 11a1 at p = 5; Γ₁(Mp^r) torsion-free for level ≥ 4; |SL₂(𝔽₃)| = 24; κ(Γ) = 1 + 4ℤ₂ and the nonintegral idempotents at p = 2; the three inverse-determinant divisor examples of §0.6 and the Det versus Det⁻¹ sign; the interpolation factors (1 − α⁻¹)² and 1 − α⁻¹; (LocExc_p) ⟺ ᾱ² ≠ 1 for p ≥ 5 and its failure at p = 3; the coinvariants O, O/(ϖ) ⊕ O and O² of the three §1.1 matrices and det(g − 1) = −ϖ for the residually unipotent g; the 14a1 Tamagawa product 6 forcing nonsplit at 2 and split at 7.

Suppliers: PadicMeasuresIwasawaAlgebras on main has Layer 1, Layer 4 §§4.3–4.6 (`charIdeal`, `charDivisor`, `charIdeal_mul_of_exact`, μ/λ, the Iwasawa coordinate) and Layer 5 §§5.1–5.2 (determinant lines, topological Nakayama) as cited; DiophantineApproximationAndTranscendence §5.6 states Nesterenko's complex theorem as cited; EllipticCurves Layer 4 (Tate curve E_q for given q) and Layer 2 (Weil pairing) as cited; NeronModelsAndSemistableAbelianVarieties at head 9d58065 has the component group of §2.2 and Layers 1–2; AlgebraicModularFormsAndSerreWeights at head 256555e has R15.4 (the local Serre-weight recipe); AutomorphicGaloisRepresentations at head 2648a49 has §6.4 (classical conductors and bad Euler factors) and no `R19.4`/`R19.5` (within pass a's F19). Pinned declarations confirmed: Mathlib `ContRepresentation`, `CuspForm.rank_eq_zero_of_weight_lt_twelve`, `Representation.invariants`; Tau Ceti `tateCurve`, `tateCurveAt`, `completedGroupAlgebra.powerSeriesCoordinate`, `powerSeriesCoordinate_X`, `powerSeriesCoordinate_one_add_X`, `monoidAlgebraProdEquiv`, `WeierstrassCurve.Affine.selmerGroup₂`. Merge order: `grep -nx ModularIwasawaMainConjectures merge-order/ORDER.txt` is empty (an imported package, not a defect). Dependency check:

```text
NOT IN ORDER: ModularIwasawaMainConjectures (insert it after its last supplier)
depcheck: 8 roadmaps, 59 edges, 1 problem(s)
```

No UPWARD or CYCLE line.

Not re-raised (pass a, same round): F01 reciprocal supply with AutomorphicCongruences; F02 missing sources.toml (confirmed absent at this head); F03 rational zeta element in the divisor formula; F04/F05 Σ-independence hypotheses and the Tate-dual error; F06 inadmissible Σ in §4.1; F07 split-multiplicative logarithm factor; F08–F11 Frobenius normalisation, b₂ shift, C² scaling and the identity point in §3.7; F12 missing transcendence headline on `TauCeti.tateCurveAt`; F13 four suppliers with no eligible owner (KatoEulerSystems, PadicHodgeRegulators, AutomorphicCongruences, GrossZagierAndArithmeticHeights, confirmed absent from main and from the merge order); F14–F18; F19 invented supplier identifiers (its repair also covers `AutomorphicGaloisRepresentations R19.4` at README.md:721 and 729, whose owner is the supplier's §6.4); F20 coordinate/logarithm owners; F21 internal forward dependencies; F22–F28.

## Not verifiable

- Schneider, p-adic height pairings II (§2 p.341, Theorem 2′ p.342, §7 Theorems 6–7 p.371): no copy under the README's URL is in the sources cache, so its locators and the sign convention of §3.8 were not checked here.
- Colmez, exposé 919: Remarque 0.10, Conjecture 0.12, Remarque 0.13 and note 14 were located on pp.255–256; the headings of Théorèmes 0.8, 0.11, 0.15, 0.20 and Définition 0.9 were not found by heading search in the extraction (accent splitting), so their page numbers were not confirmed.
- Serre IV.3.4 Lemma 3, Silverman ATAEC Theorem V.5.3, Barré-Sirieix–Diaz–Gramain–Philibert (cited through Waldschmidt), Greenberg–Stevens Theorem 7.1 (OCR copy) and the Hida annals paper: not read; cited by locator only.
- No sources.toml exists at this head (pass a F02), so no sha256-to-text mapping was available; cached texts were identified by the URL recorded in each extraction's header.
- The arithmetic theorems imported from the four unowned suppliers (reverse divisibilities, universal zeta morphism, Coleman maps, Manin constants) cannot be checked against any supplier text.

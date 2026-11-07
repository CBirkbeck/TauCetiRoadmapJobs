# Review of GL2AutomorphicRepresentationsAndTransfer (pull request #931 at 552e037)
**Verdict:** needs changes

**Previous findings (round 5 at 8d94672), checked passage by passage.** All seven are repaired.

- **R01 (R17.3.9 restated two QuaternionicModularForms results): repaired.**
  - `README.md:1749–1751` now cites the supplier: "by QuaternionicModularForms §1.3 in one variable at `n=k`, `v=−k`, the left action … on `L_{k,−k}` is `Sym^k(standard)⊗det^{−k+k}=Sym^k(standard)`, which is τ".
  - `:1769–1770` reads "QuaternionicModularForms §3.1's inversion formulas `[Uη_ℓ⁻¹U]=S_ℓ⁻¹T_ℓ` and `[Uϖ_ℓ⁻¹U]=S_ℓ⁻¹` at a good ℓ".
  - The scope paragraph `:77–83` and the contract `:344–361` assign both results to that roadmap. `:83` keeps only "the comparison of §3.1's action with Pan's `T_ℓ, S_ℓ`".
  - At QuaternionicModularForms' head (b22ec37), §1.3 (its README:528–532) proves the `Sym^n(std)⊗det^{−n−v}` identification and §3.1 (its README:1039–1041) proves both inversion formulas.
  - The new Check `:1790–1793` (supplied `S_ℓ` acts by `ℓ^{−k}`, Pan's by `ℓ^k`; 1/9 against 9 at k=2, ℓ=3) is correct (table).
- **R02 (id map for R17.3.8a–d): repaired.** `grep 'R17\.3\.8[a-d]'` on the README returns 0 hits.
- **R03 (six undeclared backticked names): repaired.**
  - `:1465` "the predicate *D is ramified exactly at S*"; `:562` "written h_v"; `:601` "the central-character L² space `L²(Z(𝔸)GL₂(F)\GL₂(𝔸), ω)`"; `:1009` "the set of tamely dihedral classes of order ℓ".
  - The alias sentence is at `:1474–1475`. QuaternionArithmetic (open head, README:225–227) cites `RamifiedExactlyAt D S`, `ramifiedExactlyAt_iff_nonsplit` and `quaternionAlgEquivOfLocalSplitting`, and all three are covered by the aliases at `:1474` and `:1479`.
  - `roadmaps grep` finds no other roadmap citing `heckeGen`, `CentralCharacterL2` or `tamelyDihedral`.
- **R04 (four stale supplier locators): repaired.**
  - `:28` and `:208–210` read "AL.R.1 (Archimedean Whittaker comparisons), AL.R.2 (Archimedean `GLₙ` parameters) and AL.R.3 (Restricted tensor realizations)". These match AutomorphicLFunctionsAndLocalFactors' head, lines 244, 254 and 264.
  - `:1335` reads "R15.5A.2 (§6.2, classical eigenforms of weight at least two)", which matches AlgebraicModularFormsAndSerreWeights' line 18 alias and its §6.2 title (line 1419).
  - `:191–194` adds the Tau Ceti bullet for `Set.unit_fg` and `Set.unit_fg_of_units`, and `:656` and `:666` use it (pins checked below).
- **R05 (Lean layer comments and order): repaired.**
  - `Suggested.lean:60, 91, 135, 184, 239` carry the five `/-! ## Layer … -/` comments, with titles identical to the README headings.
  - `odd_solvable_artin_weight_one` (R17.5.9, `:201`) now precedes `solvable_finite_image_integral_lift` (R17.5.12, `:222`) and the R17.6 targets.
- **R06 (Needs lines and formula): repaired.**
  - `:827` reads "*Needs:* SmoothRepresentationsOfLocalGroups SR.0 …, SR.3a.1 … and SR.3.2", without the doubled name or R16.2/henniart-unicity.
  - `:2025` reads `ε(s,χ_{0,v}χ_v,ψ_v)³`.
  - `:1728` and `:1736` each list R16.4/cohomological-rationality once.
- **R07 (uncited references): repaired.** Comparing the keys cited before `## References` with those defined leaves only `[pan26]`, the published record behind `[pan26-global]`.

## R01 (P3) — `Suggested.lean` imports a Tau Ceti module that no statement uses, and the README does not name the Frobenius predicate the statements do use

**Location:** `Suggested.lean:5`, `public import TauCeti.NumberTheory.NumberField.Frobenius`. The two newform statements (`:216`, `:274`) use `IsArithFrobAt ℤ σ Q`. `README.md:112–150` (From Mathlib) and `:152–194` (From Tau Ceti) name neither the predicate nor this module.

**Claim:** The import is needed by the statements.

**Witness:**
- `IsArithFrobAt` is Mathlib's, at `Mathlib/RingTheory/Frobenius.lean:184`. The Tau Ceti module only proves facts about it, for example `NumberField.exists_isArithFrobAt_int_of_liesOver` at `TauCeti/NumberTheory/NumberField/Frobenius.lean:76`.
- A scratch copy without line 5 elaborates with exactly 10 `declaration uses sorry` warnings and no error.

**Repair:**
- Delete `Suggested.lean:5`.
- In "From Mathlib", after `:150`, add: "`IsArithFrobAt` (`Mathlib.RingTheory.Frobenius`), `Algebra.IsUnramifiedAt`, `Ideal.LiesOver` and `UpperHalfPlane.qExpansion` express the arithmetic-Frobenius traces and q-coefficients in `odd_solvable_artin_weight_one` and `characteristicTwo_solvable_weight_one`."
- Optionally, in "From Tau Ceti", add: "`NumberField.exists_isArithFrobAt_int_of_liesOver` (`TauCeti.NumberTheory.NumberField.Frobenius`) gives an arithmetic Frobenius at every prime over p, so those hypotheses are satisfiable."

**Tested:** The copy without the import elaborates as stated above.

## R02 (P3) — Two declaration names are attributed to PadicLocalLanglandsForGL2Qp §6.9, which declares neither

**Location:**
- `README.md:313–315`: "§6.9 supplies `DivisionAlgebraTypes.jacquetLanglands`, the `m=1` restriction of `DrinfeldComparison.localJacquetLanglands`".
- `:1391`: "consume PadicLocalLanglandsForGL2Qp §6.9's `DivisionAlgebraTypes.jacquetLanglands` at d=2".

**Claim:** These are the supplier's declarations.

**Witness:**
- At PadicLocalLanglandsForGL2Qp's head, §6.9 (its README:2314) describes the `m=1` restriction in prose only: "the shared division-algebra Jacquet–Langlands transfer from `D×` to `GL_d(F)` as an abbreviation of the inverse of the displayed `JL`".
- `DrinfeldComparison.localJacquetLanglands` does not occur in that roadmap. `DivisionAlgebraTypes.jacquetLanglands` occurs there only at line 2436, in its consumer table, as consumers' notation.
- Both names are LocalGaloisDeformationRings' notation (its README:71). `roadmaps grep` over main and 472 heads finds `localJacquetLanglands` only there and here.

**Repair:**
- At `:313–315`, replace the two names with: "§6.9 supplies the division-algebra Jacquet–Langlands transfer from D× to GL_d(F), defined there as the inverse of its general local correspondence restricted to m=1, for central division algebras of degree d over nonarchimedean local fields …". Keep the rest of the sentence.
- At `:1391`, replace "§6.9's `DivisionAlgebraTypes.jacquetLanglands` at d=2" with "§6.9's division-algebra transfer from D× to GL_d(F) at d=2".

**Tested:** The direction is unchanged. Both the supplier and R17.1.1 use transfer from D× to GL₂(F), whose inverse is §6.9's JL; the supplier's Check gives Steinberg ↔ trivial with signs −1 = (−1)·1.

## Verified sound

**Scope and gate.**
- I read both files in full at 552e037: README 3046 lines, `Suggested.lean` 283 lines. `metadata.toml` is `topic = "math.NT"`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The worker's gate passes every check (set_option, sorry-data, latex, imports, readme-ids-missing, statement-hygiene, depcheck, stray-files, build and the rest all 0). The imports check does not test usage, hence R01.
- Process-word grep: 0 hits. There is no `lemma`, `set_option`, `#eval`, `#print` or `True` placeholder.

**Dependency check (run this round):**

```text
depcheck: 243 roadmaps, 2477 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The merge order places SmoothRepresentationsOfLocalGroups 26, PadicLocalLanglandsForGL2Qp 33, QuaternionicModularForms 70, AutomorphicLFunctionsAndLocalFactors 86, AutomorphicSpectralTheory 88 and AlgebraicModularFormsAndSerreWeights 93 before this roadmap (94).

**Elaboration and signatures.**
- `lake env lean Suggested.lean` gives exactly 10 `declaration uses sorry` warnings.
- I ran one scratch file with `#check @name` for all 10 declarations. Every elaborated type keeps its binders, for example:
  - `[IsNonarchimedeanLocalField F]` and all ten hypotheses of `supercuspidalProjective`;
  - `[Group.FG ↥E]` and `0 < n` in `chevalley_power_congruence`;
  - `[Finite Γ]`, `[CharP k p]` and `[IsAlgClosed k]` in the Fong–Swan statement;
  - `[IsGalois ℚ E]`, `Algebra.IsUnramifiedAt ℤ Q` and `IsArithFrobAt ℤ σ Q` in both newform statements.
- Each type matches its README statement in generality. Nothing changed.

**One-tactic probe.** I replaced each `sorry` with `first | rfl | simp | infer_instance | trivial | decide` in a scratch copy. All 10 fail: 5 with unsolved goals, and 5 where `decide` rejects free variables after the other tactics fail. No declaration is padding.

**Headline inventory.**
- Stated in `Suggested.lean`: Chevalley congruence, full-local prescription, supercuspidal projectivity, quaternion realization and the local–global isomorphism, finite projective lifting, odd solvable Artin weight one over ℚ, Fong–Swan, the char-2 dihedral classification and char-2 solvable weight one.
- Not statable at the pins, and named in the docstring (`:28–51`):
  - the finite-place correspondence and conductor/factor comparisons (WD/admissible classification);
  - the global and Hilbert dictionaries, JL, base change and induction (cuspidal adelic classes, Whittaker models);
  - R17.6's exact-level and Katz results (modular-curve cohomology, Katz forms, Artin conductors).
- No stand-in was found.

**Pinned declarations opened this round.**
- Mathlib:
  - `IsArithFrobAt` (`Mathlib/RingTheory/Frobenius.lean:184`);
  - `Set.unit` (`Mathlib/RingTheory/DedekindDomain/SInteger.lean:108`), with no finiteness result anywhere in Mathlib, as `:139–140` says;
  - `instance : Monoid.FG (𝓞 K)ˣ` (`Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean:453`).
- Tau Ceti:
  - `Set.unit_fg [Finite S] (hu : Group.FG (∅.unit K))` (`TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean:149`);
  - `instance Set.unit_fg_of_units [Finite S] [Monoid.FG Rˣ]` (`:221`), both in namespace `Set`, as the README states;
  - `NumberField.exists_isArithFrobAt_int_of_liesOver` (`TauCeti/NumberTheory/NumberField/Frobenius.lean:76`).

**Cross-roadmap citations resolved this round, at the heads.**
- QuaternionicModularForms (b22ec37):
  - §1.3 (500–567) has the `L_{n,v}` basis, the identification and the scalar action `u^{n+2v}`;
  - §2.1 (607–615) covers every number field and every quaternion algebra, with the evaluation equivalence;
  - §2.3 (739–750) gives the dimension `#Cl(U)·∏(n_σ+1)`;
  - §3.1 (1027–1071) has the inversion formulas and `(S_vφ)(g)=φ(gϖ_v⁻¹)`, which matches `:1774–1775`;
  - its Downstream consumers (1424) names R17.3.9.
- AutomorphicLFunctionsAndLocalFactors: AL.R.1–AL.R.5 (244–292).
- AlgebraicModularFormsAndSerreWeights: R15.5A.1–R15.5A.3 = §§6.1, 6.2, 6.4 (lines 18, 1384–1479).
- SmoothRepresentationsOfLocalGroups (#1688): SR.0 (576), SR.2.3 *whittaker-functionals* (2187, 2251), SR.3a.1 (2319), SR.3.2 (2691), SR.5.2 *classical-llc-normalization* (4744; arithmetic-Frobenius reciprocity at 4755).
- PadicLocalLanglandsForGL2Qp: §4.4 (1473) and §6.9 (2312), apart from R02's names.
- AutomorphicSpectralTheory: `real_representation_foundations`, `smooth_frechet_globalization` and `restricted_tensor_factorization` (816, 833, 850).
- AdelicAlgebraicGroups: *restricted-haar-product* (685).
- ArithmeticLocallySymmetricSpaces: `LocallySymmetric.AutomorphicForm`.
- AutomorphicFormsOnReductiveGroups: `archimedeanUnitaryDual` and `inverseActionHeckeEquiv`.
- ArithmeticGaloisRepresentations: `tateLocalConstant`.
- On main: EtaleCohomologyFoundations `exists_stable_lattice_iff`, GlobalQuadraticForms `exists_hilbertSymbol_eq_neg_one_iff_pair`, ClassFieldTheory `eq_zero_of_localInv_eq_zero`.
- AutomorphicGaloisRepresentationsPartII: `semisimpleParameter` (a downstream consumer, as stated).
- The citation resolver's R15.2 and R15.3 leads are false positives: the AMFSW aliases are at its line 18.
- Consumers' citations all resolve: ShimuraVarieties (R16.1.7 `chevalley_power_congruence`, R17.5.0), EndoscopicTransfer (R17.5.0), SmallRamification (R17.3.1, R17.3.10, R17.4.10, R17.5, R17.6.4, R17.6.17–19), WeightsInEtaleCohomology (R17.3.1, R17.3.3, R17.3.5–R17.3.8), AdelicAlgebraicGroups (R16.1.3), QuaternionArithmetic (the R17.1.5 aliases).

**Ownership and overlaps.**
- `overlaps.md` lists no open pull request that changes this roadmap, no dropped id and no id defined only by an open revision.
- Ownership has not changed since the previous round. The quaternionic form spaces and Hecke operators are now consumed from QuaternionicModularForms, not owned here.
- No `Suggested.lean` name collides with a declaration in a roadmap I could read.

**Supplier gaps.**
- `design/plan.json` is not readable, so the brief's register is empty.
- The two contracts at `:245–268` (`gap:weil-local-constants`, `gap:artin-functional-equation`) name ArithmeticGaloisRepresentations and are precise and minimal.

**Seeded sample.** The sources service hit network timeouts, so every text was read from the operator's local sources cache. Line numbers refer to those extractions.

| Target | Text and locator | Outcome |
|---|---|---|
| Fixed-space comparison (R16.2.7) | cg20 lines 182–191 (§1.3, pp.805–806); casselman73 (OCR) lines 261–263 (Corollary to the Proof, p.306) | dim π^Iw = 2·dim π^Sph, and in characteristic 0 the spherical vector spans π^Iw under U_p. Level c·p^i has dimension i+1, so i=1 gives 2. Supported as stated. The cg20 "not trivial" slip is under Source issues; the README's Check at `:790` guards it. |
| Ramification realization (R17.1.5) | cdn23 lines 1610–1615 (§4.1.2, (4.6), p.38), 1623–1633 (N, w₁, U); prr23 not readable | D₀ is definite and split at every finite place; D exchanges the invariants at {𝔭,∞₀}. The R17.3.11 hypotheses on w₁ match lines 1624–1626. The realization inputs are on main. |
| Stronger variant (R17.2.5) | proved in the README from the definitions | Correct (table). |
| Quaternion proof (R17.2.6) | jl70-ubc lines 16816–16824 ((16.1.7), printed p.275, line 16773), 16840–16841 (only (i)–(iii) survive), 16893–16905 (Lemmas 16.1.1–16.1.2, trace and volume identity), 15824 (Theorem 16.1), 15928 (Lemma 16.1.2) | As stated. |
| Pan adapter (R17.3.9) | pan26-global lines 2968 (§5.4.1, main involution), 3072–3082 (W(−n₁,−n₂); Definition 5.4.11(1): `f(dh^ph_p)=h_p⁻¹f(d)`, `(h_p·f)(d)=h_p·f(dh_p)`), 3083–3086 ((2)–(3)), 3231–3246 (`T_l`, `S_l` = action of diag(l,l), `T_S`), 3271–3288 (k≥1 spectrum in σ_{k+2,1} with π_p special or supercuspidal; k=0 is σ_{2,1}∪σ₀) | As stated, including the new `S_ℓ` paragraph. |
| Whittaker-type bridge (R17.4.13b) | gj78 lines 2051–2071 ((9.1.1)–(9.1.3), pp.531–532), 2151–2158 (Theorem 9.3, p.534), 2161–2166 ((9.4), S = non-quasi-unramified places), 2209–2224 ((9.5.1)–(9.5.5); T=S or {w}, p.536) | As stated. GJ says "unitary generic" at v∈S; the README's "tempered generic" is stronger and true (table). |
| Cubic monomial input (R17.4.17) | jpss79 (OCR) lines 1519–1531 (Theorem 14.2, pp.253–254), 1587–1595 (p.255) | As stated. |
| All-place comparison (R17.4.17) | henniart02 lines 122–131 (§1.5 Théorème, p.590); deligne73 lines 901 (Théorème 4.1), 1287 ((5.6.2)), 1335–1341 (5.11), 1972–1977 ((8.12.1), printed p.572) | As stated. Deligne's `a(V)=sw+dim V−dim (ker N)^I` equals R16.0.1's `a(r)+dim V^I−dim (ker N)^I`. |
| Oddness API (R17.5.13) | bcgp21 lines 12593–12624 (Proposition 10.1.3 and its solvable case, pp.473–474) | The source lifts by Tate's theorem and Langlands–Tunnell. The README's Fong–Swan route proves the same existence, and the determinant lemma is the README's own (table). |
| Domain test, Order test (R17.5.15) | tunnell78 (OCR) lines 193–225 (Theorem 1.3 and proof, pp.182–183) | F_v≅K, ρ_v≅σ, type preserved. For S₄ over ℚ₂: F=ℚ, det ρ(c)=−1, and the proof twists σ to a Galois representation first. Both tests are computed in the table. |
| Construction and local finiteness (R17.5.16) | patrikis lines 1374–1386 (Lemma 2.3.1 and its CM consequence, printed p.28 at line 1417); carayol86 lines 1558–1575 (§11.2, (a)–(c), p.450) | As stated. Carayol calls the existence standard; the README supplies the argument. |
| Parabolic comparison (R17.6.4, R17.6.3a–b) | varshavsky05 lines 629–652 (Definition 2.1.1 and Theorem 2.1.3, p.17; u : c₂!c₁*F→F); ddt lines 3164–3185 (Theorem 3.1(d)–(e), pp.85–86), 3021–3028 (Theorem 2.47(b), p.81); carayol86 lines 86, 121 (Théorèmes (A)–(B)) | Stabilize and contract match R17.6.3b word for word. The branch values are in the table. |

**Adversarial pass.** The values marked (script) were computed this round by a Python script. The rest are hand computations recorded here.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `chevalley_power_congruence` | E=⟨2⟩⊂ℚ×, n=2, T={2}; n=3; E={±1}; n=1 | 2^j mod 3 = 1,2,1,2,1,2, so m=(3) gives exactly the even powers and avoids T; 2^j mod 7 = 1,2,4,1,2,4, so m=(7) gives exactly the cubes (script); −1≢1 mod 3; n=1 is trivially true | True |
| `finite_hecke_full_local_prescription` | ℚ, S={2}, χ₂=(−1)^{v₂}; S=∅ | Ψ = the character of ℚ(√5)/ℚ: 5≡5 mod 8, so 2 is inert and Ψ₂(2)=−1; Ψ₂ is trivial on ℤ₂×; trivial at ∞ (real quadratic); S=∅ gives Ψ=1 | True |
| `supercuspidalProjective` | 𝔽_q((t)); ℝ; π=trivial; π⊗ρ with ρ(g)=(1 v(det g);0 1) | The field instance holds for 𝔽_q((t)) and fails for ℝ. The trivial character's coefficient support is all of G/Z, which is not compact, so `hπcusp` fails. ϖI acts by ω(ϖ)(1 2;0 1), which is not scalar, so `hσcent` excludes that module | True |
| `existsQuaternionRamification_iff` | ℚ: (∅,∅); ({2},{∞}); ({2},∅); a complex place in Si | (1,1)≅M₂, Even 0; (−1,−1) is ramified at {2,∞}, Even 2; {2} is odd, so both sides are false; at a complex place every algebra splits, so both sides are false | True |
| `nonempty_quaternionAlgEquiv_of_localSplitting` | (−1,−1) against (−1,−3) | (−1,−3)₂ = (−1)^{(−1−1)/2·(−3−1)/2} = +1 against (−1,−1)₂ = −1, so `hf` fails, matching non-isomorphism | Consistent |
| `finite_projective_lift` | r trivial; r(c) a non-scalar involution | trivial lift; eigenvalues ±1 and det −1, against scalar ±I with det +1 | True |
| `odd_solvable_artin_weight_one` | Std(S₃) of ℚ(∛2,ζ₃); p=5, 7, 31 | roots of x³−2: [3], [], [4,7,20] (script). Hence tr ρ = 0, −1, 2 and det = −1, 1, 1, against (−3/p) = −1, 1, 1. These are the a_p of the level-108 weight-one form (31=2²+27·1²) | True |
| `solvable_finite_image_integral_lift` | S₃, p=2, n=2; n=0; C₃, p=3, trivial | the reflection lattice over ℤ reduces to GL₂(𝔽₂); the zero module is not `IsSimpleOrder`, so n=0 is excluded; the trivial character lifts | True |
| `solvable_characteristicTwo_projective_dihedral` | GL₂(𝔽₂); upper triangular group of SL₂(𝔽₄)≅A₄; D₅⊂SL₂(𝔽₄) | S₃≅D₃, n=3; A₄ fixes a line, so it is reducible and excluded; 5∣4+1, D₅ irreducible with n=5 odd | True |
| `characteristicTwo_solvable_weight_one` | same field mod 2; p=5, 7, 31 coprime to 216 | a_p = 0, −1, 2 reduce to 0, 1, 0 = traces of transposition, 3-cycle and identity in GL₂(𝔽₂); χ(5)=−1 ≡ 1 = det | True |
| R16.2.7 Fixed-space comparison | basis (v,π(s)v); g∈K₀(pⁿ); (5 6;−1 0); 𝔽₂ | I diag(ϖ,1) I = ⊔ (1 a;0 1)diag(ϖ,1)I with q cosets; s⁻¹Is⊂K; matrix [[λ,qc],[−1,0]] has char poly X²−λX+qc; char poly X²−5X+6; K₀(p)=K₁(p) over 𝔽₂ | Retain |
| R17.2.5 Stronger variant | ρ(f) on Ind; x=k⁻¹a, y=k; ζ_χ | with g=nak, (ρ(f)φ)(x) is a dk da-integral of `∫_N f(x⁻¹nak)dn`·φ(ak), which is 0; x=k⁻¹a, y=k gives `∫_N f(k⁻¹ank)dn`; ⟨K,w⟩∋w·(0 1;1 0)=diag(1,ϖ), so ⟨K,w⟩=GL₂(F) and the two lines differ, so ρ(ζ_χ)≠0 | Retain |
| Quaternion proof | (16.1.7) at two places; Steinberg factors | (iv)–(viii) vanish (jl70-ubc 16823); norm-character traces (−1)^{|S|}=+1 for even |S| | Retain |
| R17.3.9 Pan adapter (R01 repair) | supplied `S_ℓ` = f(gϖ_ℓ⁻¹); Pan `S_l` = f(gϖ_l); k=2, ℓ=3 | f(gϖ_ℓ⁻¹)=f(g·z), z=ℓ away from ℓ, which is in U and acts by τ(ℓ)⁻¹=ℓ^{−k}; Pan's gives ℓ^{k}; 0.1111 and 9 (script); scalar u on L_{k,−k}: u^{n+2v}=u^{−k}=τ(u)⁻¹ | Retain |
| R17.3.9 Hurwitz Check | 2T/±1=A₄ on dim 2ℓ+1 | (χ(1)+3χ(π)+8χ(2π/3))/12 = 1, 0, 0, 1 (script); dim S_k(Γ₀(2)) at k=4, 6, 8 = 0, 0, 1 | Retain |
| R17.4.13b bridge | v∈S; π_v=I(ν^{1/4},ν^{−1/4}) | GL₂ complementary series needs χ₁χ₂⁻¹=ν^{2t} with equal unitary parts, so it is a twist of an unramified representation and v∉S; so σ_v is tempered at S, and so is its adjoint; ξ_v=I(ν^{1/2},1,ν^{−1/2}) has the extra factor L(s−1/2,χ) | Retain |
| R17.4.17 cubic input | θ=μ∘N; norm-phase identities | Frobenius reciprocity gives μ⊞μσ₀; N(C+a,b,c)−3(C+a)=−2C+CQ+N on [−3,3]³ for C=±1 (script: True); N(0,1,0)=2, N(0,0,1)=4, N(1,1,1)=1, Q(1,1,1)=−3, Q(0,1,0)=0, Q(1,0,0)=3 | Retain |
| R17.4.17 all-place | Deligne (8.12.1) against R16.0.1 | sw+dim V−dim(ker N)^I = a(r)+dim V^I−dim(ker N)^I with a(r)=sw+dim V−dim V^I | Retain |
| R17.5.13 Oddness API | diag(1,−1) at 3; −I; identity at 2 | det −1 and −1≠1 mod 3; det(−I)=+1; at 2, residual det 1=−1 while integral det is +1, so the hypothesis 2≠0 is needed | Retain |
| R17.5.15 tests | (−1)^{v₂} at 2, on units, at −1; i^a on ℤ/4 | −1, 1, 1; i, −1, −i, with χ(1)²=χ(2)=−1, so χ²≠1; (2/5)=−1, (−1/5)=1 | Retain |
| R17.5.16 CM | L=ℚ(i), a=1+i | (a)=𝔓, a/σa=i (torsion), and the phase e^{iπ/4} has square i | Retain |
| R17.5.17 mod-3 section | the two generators over ℤ[√−2] | group order 48; reductions (1 1;0 1) and (0 1;1 0); dets 1 and −1 (script) | Retain |
| Parabolic comparison | (a,d)=(2,3), (1,p^m), (3,2); ℙ¹×ℙ¹, c₁=(t²,s) | 3·2≥2·3 gives n=2; p^m≥2 gives n=1; (3,2) dualizes; (t²)⊂(t)² gives n=1; fixed components t=0, 1, ∞ each have excess bundle T_ℙ¹ of degree 2, and 6 = 1+3+2 | Retain |
| R16.2.12 Iwahori centre | q=4, roots (2,3); roots (1,1) | U₁ roots 4, 6; z₁ = 10, 10, and 5.5, 7 without q (script); repeated roots give 2+4/2=4 | Retain |
| R16.3.6 gamma | Γℂ(1), Γℝ(1)Γℝ(2), Γℂ(2) | 0.318310, 0.318310, 0.050661 = 1/(2π²) (script) | Retain |
| R17.6.1 Δ | p=2, k=12 | unitary raw −24·2⁻⁵ = −0.75 = √2·(−24·2^{−11/2}) (script); central 2¹⁰ against 1 | Retain |
| R17.4.1 Satake power | q=5, (t,s)=(5,6/5) | t²−2qs = 13, s² = 1.44 = 36/25, q²s² = 36 (script) | Retain |
| R17.5.7 exclusion | A=diag(e^{iπ/6},e^{−iπ/6}), B=−A | traces ±1.732051, squares 1/1, cubes 0/0; projective order 6 (script) | Retain |
| R16.3.9 vexing | θ₀ of order 8 on 𝔽₂₅× | centre 4·4=16, non-central −20−(−4), total 0; (16−20+4)/24 = 0 | Retain |
| R01 (import) | copy without line 5 | 10 sorry warnings, 0 errors | Finding |
| R02 (names) | `roadmaps grep localJacquetLanglands` | hits only in LocalGaloisDeformationRings:71 and here; PadicLocalLanglandsForGL2Qp 0 | Finding |

## Not verifiable

- **prr23**, Theorem 1.33, pp.42–43: a Cambridge book with no legal copy. The realization inputs were checked through GlobalQuadraticForms §4.4 and ClassFieldTheory Layer 10 on main.
- **jl70** (IAS retypeset) and **jl70-global** (IAS author scan) paginations: only the UBC retypeset (jl70-ubc) is in the cache, so the README's IAS pages were not checked. The content was checked.
- **bh06**, **webb16**, **artin-tate**, **tate-global** and **clozel90** are books and were not read. Texts outside the sample were not read this round. The sources service timed out on the network, so no new text was fetched.

## Source issues

- **Error** in cg20 at §1.3, printed p.805: the source says a smooth irreducible unramified representation that is not trivial has a two-dimensional Iwahori-fixed space; it should say infinite-dimensional, since a nontrivial unramified character of det has a one-dimensional one; affects nothing (an introductory remark).

<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/135#issuecomment-6329162539 -->
Red team round 1 pass a (codex) of c2a3102

Verdict: needs_changes

1. **F01** (P3) Four Checks are admitted instead of proved

   **Location:** `packages/EllipticCurveModularityWild3Adic/Suggested.lean:184`, `:287`, `:386`, `:449` (each is an `example` containing `sorry`).

   **Claim:** These declarations provide the README's executable Checks.

   **Witness:** The four unfinished proofs end at lines 186, 289, 388 and 452. They test conjugate roots, a discriminant valuation, a square root in the residue field, and coefficient Frobenius respectively.

   **Exact repair text:** “Prove all four examples. If a boundary result needs substantial theory, replace that example with a named theorem target in the corresponding README section; keep no admitted examples.”

2. **F02** (P3) The stated library pins do not match the review pins

   **Location:** `packages/EllipticCurveModularityWild3Adic/README.md:51`, `:60–61`: “In the current library (newer than the pin)”.

   **Claim:** The supplier inventory distinguishes pinned declarations from unavailable newer declarations.

   **Witness:** `lake-manifest.json:8` pins Tau Ceti to `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; line 18 pins Mathlib to `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. `TauCeti/NumberTheory/ClassFieldTheory/MuNRep.lean:270` already defines `kummerEquiv` at this pin.

   **Exact repair text:** “Mathlib is pinned at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti is pinned at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The Kummer, local-duality, reciprocity, Weil-pairing, Tate-module and Eisenstein declarations below are available at the Tau Ceti pin.” Re-audit every availability claim against those pins.

3. **F03** (P3) The source manifest is missing

   **Location:** `packages/EllipticCurveModularityWild3Adic/README.md:1361–1372` (References), and `:585` (Berthelot–Breen–Messing 4.2.14).

   **Claim:** The package cites nine bibliography entries and an additional explicitly located work in the classification proof.

   **Witness:** The package head contains only README, Suggested, metadata and review files; it has no `sources.toml`. The ten works therefore have no recorded access status or version correspondence.

   **Exact repair text:** “Add `sources.toml` with schema `tauceti-roadmap-sources/v1`, one entry for every cited work, exact target locators and the sources-service provenance. Include Berthelot–Breen–Messing, cited in §2.1.”

4. **F04** (P1) Finite torsion splitting fields cannot contain the maximal unramified extension

   **Location:** `packages/EllipticCurveModularityWild3Adic/README.md:458`, `:468`, `:487`: “the splitting field … contains `ℚ₃^{nr}(E[2])`”.

   **Claim:** The splitting field of a mod-5 representation contains an extension of the infinite field `ℚ₃^{nr}`.

   **Witness:** Its Galois group embeds in the finite group `GL₂(𝔽₅)` (order 480); `ℚ₃^{nr}/ℚ₃` has infinite degree. Manoharmayum line 857 uses the unramified compositum; lines 992–1003 likewise classify extensions after unramified base change.

   **Exact repair text:** “Put `K = ℚ₃(E[5])` and `K^{nr} = K ℚ₃^{nr}`. In §1.11, `K^{nr} = ℚ₃^{nr}(E[2])`. In §1.12 and its last Check, the indicated cubic extension of `ℚ₃^{nr}` is contained in `K^{nr}`.” Replace all three finite-field inclusions accordingly.

5. **F05** (P1) The Serre-weight iff gives two different integer weights to the same representation

   **Location:** `packages/EllipticCurveModularityWild3Adic/README.md:137`: “iff the Serre weight … is `n + 2`”.

   **Claim:** Admittance by `σ_{n,0}` is equivalent to equality with a single integer Serre weight.

   **Witness:** At `ℓ = 3`, take the nonsplit peu Kummer extension for the unit class `[4]`. The definition admits it for both `n = 0` and `n = 2`, forcing its integer weight to equal both 2 and 4.

   **Exact repair text:** “Delete `sigma_n0_admits_iff_serreWeight`. Distinguish the set of allowed Serre weights from the minimal integer weight. Add `peu_admits_two_weights`: a nonsplit peu extension of `1` by `ω` is admitted by both `σ_{0,0}` and `σ_{ℓ−1,0}`. Any comparison with an external Serre-weight API must use that API's set-valued convention.” Add the `ℓ = 3` overlap as a README Check and a proved arithmetic-predicate example. The erroneous single-weight assertion is also present at BCDT line 609; that source sentence does not resolve the contradiction with its definition.

6. **F06** (P2) Breuil classification omits commutativity

   **Location:** `packages/EllipticCurveModularityWild3Adic/README.md:577`, `:634`: “finite flat `R`-group schemes killed by `ℓ`”.

   **Claim:** All such group schemes belong to an additive category classified by Breuil modules; the model category in §2.4 is likewise additive.

   **Witness:** The constant group scheme `UT₃(𝔽₃)` over `ℤ₃` is finite étale, noncommutative, and every element has cube one. Breuil line 42 and BCDT line 313 explicitly restrict their group schemes to commutative ones.

   **Exact repair text:** Add to Conventions: “Every finite flat group scheme in this roadmap is commutative. In §§2.1–2.3 the group schemes are killed by the indicated odd prime; §2.4 allows commutative groups of prime-power order.” Add the constant `UT₃(𝔽₃)` as a negative-control Check for §2.1.

7. **F07** (P1) The rationality argument has no owner for matrix Hilbert 90

   **Location:** `packages/EllipticCurveModularityWild3Adic/README.md:527`: “the cocycle comes from `H¹(G_K, SL₂(K̄)) = 0`”.

   **Claim:** The listed prerequisites suffice for the Galois-equivariant lift and its vanishing obstruction.

   **Witness:** `TauCeti/FieldTheory/GaloisCohomology/Hilbert90.lean:245` proves vanishing for scalar units, not `GLₙ` or `SLₙ`. The §1.15 Needs line names modular-curve suppliers and the matrix carrier, with no matrix-Hilbert-90 or binary-icosahedral lifting target.

   **Exact repair text:** Before §1.15 add `matrixHilbert90`: “For any field `K`, separable closure `Kˢ` with discrete topology and `n ≥ 1`, every continuous cocycle `G_K → GLₙ(Kˢ)` for the natural Galois action is a coboundary; likewise for `SLₙ`.” Add `binaryIcosahedralLift`: “Over a characteristic-zero algebraic closure, the faithful projective action of `PSL₂(𝔽₅)` on the level-five projective line lifts uniquely to `SL₂(𝔽₅) → SL₂(K̄)`, compatibly with the cyclotomic Galois action.” Cite RepresentationTheory/InductionRestriction Layer 7 for the general central-extension machinery and Shepherd-Barron–Taylor Lemma 1.1 for this application. Make §1.15 depend on these explicit targets, or declare precise gaps with an earlier supplier.

8. **F08** (P2) An unramified mod-three character does not kill exactly the units

   **Location:** `packages/EllipticCurveModularityWild3Adic/README.md:265`: “an unramified character kills exactly the units”.

   **Claim:** The kernel of a nonzero unramified character `ℚ₃ˣ → 𝔽₃` is `ℤ₃ˣ`.

   **Witness:** `χ(27) = 3χ(3) = 0`, but `27` is not a unit. The intended annihilator statement is correct after passing to cube classes.

   **Exact repair text:** “A nonzero unramified `𝔽₃`-valued character has kernel `3^{3ℤ}ℤ₃ˣ`; its kernel on `ℚ₃ˣ/(ℚ₃ˣ)³` is exactly the unit line.”

9. **F09** (P2) The cross-prime comparison is narrowed to the chosen route

   **Location:** `packages/EllipticCurveModularityWild3Adic/README.md:491`: “Let `E/ℚ₃` have potentially good reduction”.

   **Claim:** §1.13 owns only the elliptic-curve, `ℚ₃` specialization of the cross-prime Weil–Deligne comparison.

   **Witness:** CDT lines 2125–2130, Proposition B.4.2, treats any potentially good abelian variety over a finite extension of `ℚ_p`, with a number-field action. The package supplies no target or exact supplier contract for that general statement.

   **Exact repair text:** Precede the specialization by `potentiallyGood_crossPrimeWD`: “Let `F/ℚ_p` be finite, `A/F` an abelian variety with potentially good reduction, and `L → End_F⁰(A)` a number-field action. The `p`-adic Weil–Deligne realization and every prime-to-`p` Tate realization descend from one semisimple `(L ⊗ℚ ℚ̄)[W_F]`-module, finite free over `L ⊗ℚ ℚ̄`; each `p`-adic factor is Barsotti–Tate over every finite extension killing inertia in its Weil–Deligne representation.” Cite CDT Proposition B.4.2, assign this general target here or to an exact earlier supplier, and derive §1.13 as its elliptic specialization.

10. **F10** (P2) The explicit cube-class basis has no easy headline signature

   **Location:** `packages/EllipticCurveModularityWild3Adic/README.md:257`, `Suggested.lean:122–134`.

   **Claim:** §1.1 adds the explicit basis `[3], [4]`; Suggested records only cardinalities and nonmembership of `[3]` in the unit line.

   **Witness:** Those three signatures contain no occurrence of `4`. They do not assert that `[4]` is nonzero or that `[3], [4]` generate, although this can be stated with the existing `Q3` carrier.

   **Exact repair text:** Add the name `cubeClass_coordinates` to §1.1 and the signature:

   ```lean
   /-- Every nonzero 3-adic number has unique cube-class coordinates in the basis [3], [4]. -/
   theorem cubeClass_coordinates (y : Q3) (hy : y ≠ 0) :
       ∃! ab : Fin 3 × Fin 3, ∃ x : Q3,
         y = (3 : Q3) ^ ab.1.val * (4 : Q3) ^ ab.2.val * x ^ 3 := by
     sorry
   ```

11. **F11** (P2) The degree-twelve descent operators are put on the wrong scalar module

   **Location:** `packages/EllipticCurveModularityWild3Adic/README.md:898`, `:916`, `:994–1002`: “with basis `e₁, e′_ω` over `S₃₆`”.

   **Claim:** The Breuil module over `F′` is free on the displayed basis over `S₃₆ = 𝔽₃[u]/(u³⁶)`, while `γ̂₄` has eigenvalues `±j` and `γ̂₂` cubes `𝔽₉` coefficients.

   **Witness:** `j² = −1` has no solution in `𝔽₃`; `j e₁` is outside the stated rank-one `S₃₆` module. BCDT lines 3276–3277 and 3672–3674 distinguish `M` over `𝔽₃` from `M′ = M ⊗𝔽₃ 𝔽₉`.

   **Exact repair text:** “Write `S = 𝔽₃[u]/(u³⁶)` and `S′ = 𝔽₉[u]/(u³⁶)`. For a model over `𝒪_{F′}`, its Breuil module is `M′` over `S′`; unramified descent along `γ₂` gives `M` over `S` and `M′ ≅ 𝔽₉ ⊗𝔽₃ M`. The displayed normal forms and adapted bases are for `M`; all descent operators act on `M′`, with `γ̂₂` cubing coefficients.” In §4.2 replace the asserted `S₃₆`-basis of `M_π(𝒢)` by the basis of its descended module `M`. In §5.1 state explicitly that the primed extension is obtained by this scalar extension.

12. **F12** (P3) The comparison-map Checks also pass three zero maps

   **Location:** `packages/EllipticCurveModularityWild3Adic/README.md:719–721`; `packages/EllipticCurveModularityWild3Adic/Suggested.lean:339`.

   **Claim:** The three Checks validate the entry maps and their sign normalization.

   **Witness:** Replace `thetaLowerLeft`, `thetaOneDiagonal`, and `thetaOmegaDiagonal` by zero linear maps. The split, upper-right, and negative-diagonal-relation Checks all still pass; the only Lean example tests their common zero locus.

   **Exact repair text:** Add the Checks “On `E₂₁`, `(Θ₀,Θ₁,Θ_ω) = (1,0,0)`” and “On `diag(1,−1)`, `(Θ₀,Θ₁,Θ_ω) = (0,−1,1)`”, with proved examples for the kept entry maps. Consolidate with the current example to keep at most two proved examples per definition.

13. **F13** (P3) Several statable Checks have no Lean mirror

   **Location:** `packages/EllipticCurveModularityWild3Adic/README.md:299`, `:392`, `:648`, `:1017`, `:1120–1122`.

   **Claim:** The README's arithmetic and coefficient-ring Checks are mirrored in Suggested.

   **Witness:** Suggested has no example for the full identity `cPi (X²−1) = 1−X⁶`, the `i=2` specialization, the `𝔽₉` semilinear coefficient test, nonvanishing `u³⁰` in `S₃₆`, or `T = 0` at `N=1` together with `T ≠ 0` at `N=2`.

   **Exact repair text:** Add proved examples for these Checks on the existing polynomial, `GaloisField`, and `AdjoinRoot` carriers. Use the kept definitions (`cPi`, `uVar`, `ArtinCoeff`, `tVar`, `artinFrobenius`) and bundle related assertions so each definition has at most two examples. For the semilinear test, introduce a real-bodied coefficient operator or keep the full Dieudonné assertion as a named README theorem until its carrier exists.

14. **F14** (P3) The filtration example only repeats a span generator

   **Location:** `packages/EllipticCurveModularityWild3Adic/Suggested.lean:421–423`.

   **Claim:** Generator membership validates the exceptional filtration and distinguishes its unit cross term.

   **Witness:** The proof is `Submodule.subset_span`; it also passes if the filtration is incorrectly replaced by the whole module. It neither checks the unit coefficient nor excludes the diagonal-family replacement.

   **Exact repair text:** Replace the example by a proved two-sided test at `(c,c′)=(1,0)`: “`![1,uVar 36 ^ 6]` belongs to `sixSixFiltration 1 0`, but `![0,1]` does not.” Add a second test separating this filtration from the span with cross term `u²`. State both tests in §5.1.

15. **F15** (P3) Suggested violates the compact-file form in several independently checkable places

   **Location:** `packages/EllipticCurveModularityWild3Adic/Suggested.lean:2–4`, `:85–94`, `:195`, `:200`, `:259–263`, `:444`, `:516–559`.

   **Claim:** This file follows the required signature-and-Checks format.

   **Witness:** Three Tau Ceti imports are unused; `SerreWeightAdmitsTriangular` has three examples; multiple declarations have no docstring; the final 44 lines are a catalogue of omitted names. No declaration uses a Tau Ceti carrier.

   **Exact repair text:** “Keep `import Mathlib` and remove the three unused Tau Ceti imports. Consolidate the triangular-admittance examples to at most two. Give each declaration its own mathematical docstring. Delete the terminal catalogue. Split the combined W3.3–W3.5 comment into the required layer comments in README order.”

16. **F16** (P3) Five Lean names are not registered in the README

   **Location:** `packages/EllipticCurveModularityWild3Adic/Suggested.lean:40`, `:138`, `:310`, `:429`, `:435`.

   **Claim:** All names in Suggested correspond to README entries.

   **Witness:** Exact searches of the README find no `Q3bar`, `nonGalois_cubic_kummer_control`, `M2`, `tVar`, or `uArtin`. The non-Galois theorem's mathematics appears only as an unnamed Check.

   **Exact repair text:** Register `Q3bar` in Conventions, `nonGalois_cubic_kummer_control` in §1.1, `M2` in §2.8, and `tVar` and `uArtin` in §5.9, identifying their existing definitions or statement without adding new theory.

17. **F17** (P3) The admittance separation Check is not a separating example

   **Location:** `packages/EllipticCurveModularityWild3Adic/README.md:148`: “Simply admits is strictly stronger than admits”.

   **Claim:** The following très-ramifié example demonstrates strictness.

   **Witness:** In that example only `σ_{2,1}` admits the representation and its multiplicity is one; thus `τ₁` simply admits it as well. It is not an object admitted but not simply admitted.

   **Exact repair text:** “Take a peu ramifié extension of `ω` by `1` at `ℓ = 3`. Both `σ_{0,1}` and `σ_{2,1}` admit it and occur in the reduction of `σ_{τ₁}`, so `τ₁` admits it but does not simply admit it.” This is the separating case already used in §0.6.

18. **F18** (P3) The extension roadmap is not identified as Part II

   **Location:** `packages/EllipticCurveModularityWild3Adic/README.md:1`, `:15`.

   **Claim:** This is a standalone roadmap giving a second proof of the end theorem owned by EllipticCurveModularity.

   **Witness:** Line 15 explicitly identifies the existing owner and its end theorem; the title and introduction never identify this extension as Part II, as required by the planning contract.

   **Exact repair text:** Change the title to “Roadmap: elliptic curve modularity, Part II — wild 3-adic types and descent”. Begin Scope with “EllipticCurveModularity supplies the modularity interfaces and its Serre-based existence proof. This Part II adds the general wild descent machinery and its BCDT applications; the existing theorem and interfaces retain their owner.”

## Verified sound

Read all **1,372 README lines** and **561 Suggested lines**, both repository rule files, and the package diff at `c2a3102`. The diff changes four files, all within `packages/EllipticCurveModularityWild3Adic/`. No package source was edited; no git write, Lean command, build, post or sub-agent was used.

| Audit item | Count and scope |
|---|---|
| Lean declarations read | **90**: 29 definitions, 7 abbreviations, 24 named theorems, 26 examples and 4 local instances |
| Named theorem proof status | 19 admitted; 5 have proof bodies. No admitted data declarations |
| Examples read | 26: 22 have proof bodies; 4 are admitted (R01). These are textual and mathematical checks, not an elaboration claim |
| README targets read | **82 bold target blocks in 76 numbered sections**; subsidiary named assertions and proof inputs were included in the block audit |
| README Checks examined | **221 bullets**; boundary tests and exceptions are recorded in the statement table below. Every definition block has at least three bullets; R12–R14 and R17 concern their discrimination or mirrors |
| Source locators verified | **36 distinct locator groups**, itemized below; repeated references count once. Eight works were read through legal copies; two access limitations are recorded below |
| Supplier citations checked | **8 available main-roadmap owners** checked by object and section; **12 other cited owners** could not be checked at their heads |
| Supplied sibling heads searched | **7**; the package directly cites none of those seven. No duplicate wild-descent target was located there |
| Mechanical dependency result | No UPWARD or CYCLE line; missing placement reported separately below |

The concrete finite checks give `#GL₂(𝔽₃) = 48`, a commutator subgroup of order 24 with determinant one, and nine matrices in the image of the adjoint-kernel embedding, exactly its stated kernel intersection. The six local curve discriminants are respectively `64, −25920, −5184, −3456, −17280, −50544`; the last has 3-adic valuation 5. The reduction `Y² = X³ − X − 1` has no affine `𝔽₃`-point, hence Frobenius trace 3. The exceptional curves have `(Δ,c₄) = (−800,145)` and `(−17576,−143)`, yielding `j = −121945/32` and `1331/8`.

The shifted negative-quadratic uniformizer, the order-two square of `γ₄`, the same-sign deep wild correction in the exceptional inverse operator, and the coefficient-linear Artin Frobenius pass the stated tests. The annihilator argument in §5.10 is valid with its bounded primary-exponent and torsion-kernel hypotheses; the supplied `(ℤ/9)²` example demonstrates why the latter cannot be dropped. No forced modularity headline, `set_option`, `lemma`, admitted data body, or conclusion-as-hypothesis target was found. The missing easy cube-basis headline is R10.

### Dependency output and inspected owners

The authorized dependency check returned exit status 1 and exactly:

```text
NOT IN ORDER: EllipticCurveModularityWild3Adic (insert it after its last supplier)
depcheck: 8 roadmaps, 60 edges, 1 problem(s)
```

The placement line is recorded, not raised as a dependency-direction defect. The check's eight-roadmap graph does not certify the twelve unavailable supplier contracts. No ownership move from a later supplier is required by a verified UPWARD or CYCLE result. The proof inputs needing explicit ownership are R07 and the general comparison in R09.

| Inspected owner | Repository locator and checked contract |
|---|---|
| ClassFieldTheory | `TauCetiRoadmap/ClassFieldTheory/README.md:460` (arithmetic Frobenius), `:920` (Kummer and duality), `:1312` (local Artin), `:1433` (local existence), `:1683` and `:1724` (global reciprocity and existence) |
| LocalGaloisGroups | `TauCetiRoadmap/LocalGaloisGroups/README.md:299`, local coefficient dimensions with their roots-of-unity qualifications |
| LocalFieldsRamification | `TauCetiRoadmap/LocalFieldsRamification/README.md:561` and `:705`, unramified extensions and Eisenstein generators |
| EllipticCurves | `TauCetiRoadmap/EllipticCurves/README.md:647` and `:793`, torsion/Tate modules and reduction |
| ModularCurves | `TauCetiRoadmap/ModularCurves/README.md:1357`, fine twisted curves over `ℚ`; arbitrary-field coverage remains a limitation below |
| ModularForms | `TauCetiRoadmap/ModularForms/README.md:305`, `:532` and `:971`, character Eisenstein series, primitive associates and twists |
| Chebotarev | `TauCetiRoadmap/Chebotarev/README.md:410` and `:609`, Dirichlet and natural density |
| RepresentationTheory | `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md:607` and `:721`, Clifford theory and general projective/central-extension theory, not the missing specialized lift in R07 |

The seven supplied head searches covered `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/`, `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/`, `TauCetiRoadmap/CohomologyComparisonsPartII/`, `TauCetiRoadmap/ColemanIntegrationPartII/`, `TauCetiRoadmap/QWittVectors/`, `TauCetiRoadmap/ErdosProgressionPowers/` and `TauCetiRoadmap/ArithmeticDynamics/`. These were object searches of the supplied copies, not claims to have reviewed those packages in full.

### Source-locator ledger

BCDT and Manoharmayum were read in publisher open copies. CDT, SBT, DDT and Elkies were read in author copies; the cited theorem/equation numbering was compared with those copies. Breuil was read as `math/0009252v1`, whose listed classification numbers match; Cremona was read in the author's data repository. Source text remains in the sources cache; the table gives locators only.

| Locator group | Readable source anchor | Result of locator check |
|---|---|---|
| BCDT §1.2, Lemma 1.2.1 | BCDT line 459; BCDT line 536 | Compact types and multiplicity hypotheses |
| BCDT §1.3 | BCDT line 596; BCDT line 609 | Admittance definitions; contradictory integer-weight gloss is R05 |
| BCDT Lemma 2.1.1, Theorem 2.1.2 | BCDT line 934; BCDT line 943 | Cubic simple admittance and weak acceptability |
| BCDT Lemma 2.1.3, Theorem 2.1.4 | BCDT line 949; BCDT line 959 | Quadratic types |
| BCDT Lemma 2.1.5, Theorem 2.1.6 | BCDT line 963; BCDT line 969 | Extended types, including the whole-Galois-group hypothesis |
| BCDT §4.1, Lemmas 4.1.1–4.1.5 | BCDT line 1271; BCDT line 1361 | Finite-flat models, morphisms and filtrations |
| BCDT §4.2, Lemmas 4.2.1–4.2.4 and Corollary 4.2.5 | BCDT line 1397; BCDT line 1541 | Descent categories and generic fibres |
| BCDT §4.5, Theorem 4.5.1 | BCDT line 1651; BCDT line 1677 | Quadratic Frobenius condition and tangent bound |
| BCDT §4.6, Theorems 4.6.1–4.6.3, Corollary 4.6.4 | BCDT line 1688; BCDT line 1726; BCDT line 1741 | Operator ideals, tangent bounds and characteristic-three quotients |
| BCDT §4.7, Lemma 4.7.1 and Corollary 4.7.2 | BCDT line 1880; BCDT line 1911; BCDT line 1926 | Entry maps, cup product and kernel criterion |
| BCDT Theorems 4.7.3–4.7.5 | BCDT line 1936; BCDT line 1939; BCDT line 1941 | Three comparison-map vanishing statements |
| BCDT Lemmas 5.1.1–5.1.2, Theorem 5.1.3 | BCDT line 1985; BCDT line 2024; BCDT line 2057 | Breuil modules and classification; commutativity omission is R06 |
| BCDT Lemmas 5.2.1–5.2.4 | BCDT line 2095; BCDT line 2146; BCDT line 2165; BCDT line 2188 | Rank-one models and extension gauge |
| BCDT Corollary 5.4.2, Lemma 5.4.8, Lemma 5.5.1 | BCDT line 2297; BCDT line 2454; BCDT line 2467 | Uniformizer-change and wild correction data |
| BCDT Corollary 5.5.7, Theorem 5.6.1, Corollary 5.6.2, Lemma 5.7.1 | BCDT line 2555; BCDT line 2615; BCDT line 2664; BCDT line 2678 | Descent and compatibility laws |
| BCDT Lemmas 7.2.1–7.2.3 and Corollary 7.2.4 | BCDT line 2967; BCDT line 3026; BCDT line 3038; BCDT line 3069 | Cubic forward extensions and residual models |
| BCDT Lemmas 7.2.5–7.2.6, Lemma 7.3.1, Corollary 7.3.2 | BCDT line 3076; BCDT line 3111; BCDT line 3149; BCDT line 3170 | Self-extensions and rank-three splitting |
| BCDT Lemmas 8.1.1–8.1.2 | BCDT line 3280; BCDT line 3312 | Degree-twelve rank-one descent and bases; scalar distinction is R11 |
| BCDT Proposition 8.2.1 | BCDT line 3339 | Quadratic residual model and nonzero Frobenius |
| BCDT Lemmas 8.3.1, 8.3.3 and Corollary 8.3.2 | BCDT line 3543; BCDT line 3584; BCDT line 3589 | Push-pull and diagonal vanishing |
| BCDT Lemmas 9.1.1–9.1.2 | BCDT line 3638; BCDT line 3649 | Extended rank-one descent and adapted bases |
| BCDT Proposition 9.2.1 | BCDT line 3669; BCDT line 3716; BCDT line 3727 | Four extension families, exceptional cross term and peu conditions |
| BCDT Lemmas 9.3.1–9.3.4 | BCDT line 4024; BCDT line 4071; BCDT line 4089; BCDT line 4134 | Reverse and diagonal extensions |
| BCDT §§9.4–9.6 | BCDT line 4197; BCDT line 4236; BCDT line 4330 | Coefficient filtration, Artin deformations and vanishing |
| CDT Theorem 7.2.1 | CDT line 1608 | Tame conductor branch |
| CDT Theorem 7.2.2, Lemma 7.2.3, Theorem 7.2.4 | CDT line 1631; CDT line 1658; CDT line 1765 | Switching and exceptional cases; the package corrects the printed exceptional j-value |
| CDT Lemma B.4.1, Proposition B.4.2 | CDT line 2090; CDT line 2125 | Cross-prime comparison, generality and Barsotti–Tate conclusion |
| Manoharmayum Lemma 5.3.1, Theorem 5.3.2 | Manoharmayum line 775; Manoharmayum line 857; Manoharmayum line 883 | Cubic torsion fields and norm groups; R04 distinguishes finite and unramified-composited fields |
| Manoharmayum Lemma 5.4.1 and §5.4 proof | Manoharmayum line 892; Manoharmayum line 897; Manoharmayum line 992 | Degree-twelve cases, Frobenius lift and groups |
| Shepherd-Barron–Taylor Lemma 1.1, Theorem 1.2 | SBT line 102; SBT line 118; SBT line 123 | Rationality and degree-24 cover; the SL5 misprint is corrected in the package |
| Darmon–Diamond–Taylor Remark 3.6, Theorem 3.9 | DDT line 3265; DDT line 3292 | Weight-one to weight-two modularity step |
| Darmon–Diamond–Taylor Definition 3.12, Theorem 3.14(a) | DDT line 3302; DDT line 3316 | Residual modularity and mod-three lift |
| Elkies equations (150)–(153) | Elkies line 2477; Elkies line 2485; Elkies line 2489; Elkies line 2499 | Level-75 curve, function and double cover |
| Cremona rows 50 b 1 and 338 e 1 | Cremona line 131; Cremona line 1384 | The two Weierstrass coefficient lists |
| Breuil §2.1.1, Proposition 2.1.2.2 | Breuil line 42; Breuil line 197; Breuil line 351 | Commutativity, categories and monodromy |
| Breuil Theorems 3.3.7 and 4.2.1.6 | Breuil line 1621; Breuil line 2199 | Classification inputs behind §2.1 |

### Statement-by-statement adversarial table

Locations in the first table are in `packages/EllipticCurveModularityWild3Adic/README.md`. “No counterexample” records the stated tests, not a completed formal proof. Prime 2, equal characteristic, inseparable extensions, zero coefficient rings and non-DVR bases are excluded when the target explicitly assumes an odd prime, characteristic zero, fields or a mixed-characteristic DVR. Zero objects and empty filtrations were tested where allowed.

| Target block | Instances tried | Result / change | Source anchor |
|---|---|---|---|
| 0.1 Definition, `compactType` :101 | trivial type; conductor 1 and 2; finite-dimensional pi excluded | no counterexample | BCDT line 459, line 536 |
| 0.1 Theorem, `compactType` :108 | trivial type; conductor 1 and 2; finite-dimensional pi excluded | no counterexample | BCDT line 459, line 536 |
| 0.2 Definition, `Admits` :125 | p=3; n=0,2; peu versus tres; a=1,-1 | R05, R17 | BCDT line 596 |
| 0.3 Definition, `cubicTypes` :152 | order-three matrix versus identity; scalar induction dimension 2 versus 4 | no counterexample | BCDT §2.1, pp.860–861 |
| 0.4 Definition, `ramifiedQuadraticTypes` :171 | both ramified quadratic fields; order-six unit versus trivial | no counterexample | BCDT §2.1, p.861 |
| 0.5 Definition, `extendedTypes` :188 | i=0,1,2; uniformizer square -3; unramified sign twist | no counterexample | BCDT line 923 |
| 0.6 Theorem, `simpleAdmittanceCubic` :209 | peu versus tres; competing constituents and multiplicities | no counterexample | BCDT line 934 |
| 0.7 Theorem, `simpleAdmittanceQuadratic` :220 | m=0,1; peu versus tres | no counterexample | BCDT line 949 |
| 0.8 Theorem, `simpleAdmittanceExtended` :231 | Frobenius 1 versus -1; full-group versus inertial shape | no counterexample | BCDT line 963 |
| 1.1 Theorem, `kummerQ3` :257 | classes 3,4,12,27; non-Galois cube-root field; unit annihilator | R08, R10 | BCDT line 1911 |
| 1.2 Definition, `uniformizerData` :278 | identity automorphism; invariant uniformizer; nonzero wild correction | no counterexample | BCDT line 2467 |
| 1.3 Construction, `cyclicCubicField` :305 | three conjugates; Eisenstein degree; discriminant 81; cPi(0)=1 | no counterexample | BCDT §6.1, pp.899–900 |
| 1.4 Construction, `nonabelianCubicSplittingField` :324 | cubic versus splitting-field degree; discriminant -324; j^2=-1 | R01 for admitted Check | BCDT §6.2, p.900 |
| 1.5 Construction, `positiveQuadraticSplittingField` :343 | v(alpha)=1/3, v(beta)=1/4; involution squared | no counterexample | BCDT §6.3, pp.900–901 |
| 1.6 Construction, `negativeQuadraticSplittingField` :362 | alpha/beta gives -1/4; shifted numerator gives 1/12 | correction in package is valid | BCDT §6.4, pp.901–902 |
| 1.7 Construction, `extendedTypeSplittingField` :378 | i=0,1,2; twelfth-power sign; wild t versus H | R13 missing mirrors | BCDT §6.5, pp.902–904 |
| 1.8 Theorem, `smallGroupFacts` :399 | GL2(F3) order 48; commutator order 24; beta^5=-beta, norm 3 | no counterexample | BCDT proof of 2.2.1, pp.863–864 |
| 1.9 Definition, `sixLocalCases` :415 | tame tag; finite-prime-field versus algebraic-closure coefficients | no counterexample | BCDT proof of 2.2.1, pp.862–864 |
| 1.10 Theorem, `sixCaseClassification` :443 | trivial wild inertia versus normal order-three subgroup | no counterexample | BCDT proof of 2.2.1, pp.862–864 |
| 1.11 Theorem, `manoharmayumCubicCurves` :454 | b=2,4; e=1 excluded; finite splitting field versus infinite nr | R04 | Manoharmayum line 775, line 883 |
| 1.12 Theorem, `manoharmayumQuadraticCurves` :468 | positive/negative quadratic cases; b=-1/2; conductor 3,5 | R04 | Manoharmayum line 892, line 992 |
| 1.13 Theorem, `crossPrimeTypes` :491 | good versus potentially good; trivial inertia; general abelian variety | R09 | CDT line 2090, line 2125 |
| 1.14 Theorem, `extendedLocalFrobeniusSign` :507 | A=9,B=-3; v3(Delta)=5; 0 affine F3 points; trace 3 | no counterexample | BCDT Lemma 2.3.1, pp.865–866 |
| 1.15 Theorem, `twistedX5_rational` :521 | arbitrary characteristic-zero K; rational point versus genus zero; level 4 failure | R07; field-base supplier limitation | SBT line 102, line 123 |
| 1.16 Construction, `localPairedCurves` :537 | all six curve discriminants; pulled-back pairing; split restriction avoided | no counterexample | BCDT Corollary 2.3.2, p.866 |
| 2.1 Definition, `BreuilModule` :575 | rank 0; multiplicative/etale extremes; p=2 excluded; UT3(F3) | R06 | BCDT line 1985, line 2024, line 2057 |
| 2.1 Theorem (Breuil), `BreuilModule` :577 | rank 0; multiplicative/etale extremes; p=2 excluded; UT3(F3) | R06 | BCDT line 1985, line 2024, line 2057 |
| 2.2 Definition, `BreuilModule.rankOne` :596 | r=0,e; F3 versus F9 squares; forbidden r+s-e cross term | no counterexample | BCDT line 2095, line 2146, line 2165, line 2188 |
| 2.2 Theorem, `BreuilModule.rankOne` :598 | r=0,e; F3 versus F9 squares; forbidden r+s-e cross term | no counterexample | BCDT line 2095, line 2146, line 2165, line 2188 |
| 2.3 Definition, `BreuilModule.Descent` :615 | identity and unramified descent; tame nonfixed uniformizer; wild gamma | no counterexample subject to R06 | BCDT line 2555, line 2615, line 2664, line 2678 |
| 2.3 Theorem, `BreuilModule.Descent` :617 | identity and unramified descent; tame nonfixed uniformizer; wild gamma | no counterexample subject to R06 | BCDT line 2555, line 2615, line 2664, line 2678 |
| 2.4 Definition, `FiniteFlatDescent` :634 | zero object; singleton filtration; two models; F9 semilinearity | R06; R13 mirror | BCDT line 1271, line 1397, line 1541 |
| 2.4 Theorem, `FiniteFlatDescent` :636 | zero object; singleton filtration; two models; F9 semilinearity | R06; R13 mirror | BCDT line 1271, line 1397, line 1541 |
| 2.5 Definition, `cubicCategory` :654 | zero; split 1+omega excluded; exponent 9 | no counterexample | BCDT §4.4, p.875 |
| 2.6 Definition, `quadraticCategory` :672 | zero; involution +1 excluded; F^2=-3 | no counterexample | BCDT line 1649 |
| 2.7 Definition, `extendedCategory` :688 | F=V=0 on F9^2; unipotent gamma3; gamma4 diag(j,-j) | third-generator negative control valid | BCDT line 1688 |
| 2.8 Construction, `thetaMaps` :705 | zero maps; E21; upper-right matrix; diag(1,-1) | R12 | BCDT line 1880 |
| 2.9 Theorem, `thetaKernelCriterion` :725 | peu fails pairing step; matrix image has 9 elements; char 2 excluded | no counterexample | BCDT line 1884, line 1911, line 1926 |
| 2.10 Theorem, `cubicPointFactorization` :738 | zero type ring; every torsion level versus residual level only | no counterexample | BCDT §4.4, p.875 |
| 2.11 Theorem, `quadraticPointFactorization` :749 | F=V=0 on 3-torsion versus torsion-free lattice; sign -3 | no counterexample | BCDT line 1651 |
| 3.1 Theorem, `cubicRankOneModels` :775 | r=0,1,2,3; constant/multiplicative extremes | no counterexample | BCDT line 2960 |
| 3.2 Theorem, `cubicForwardExtensions` :787 | c=0,1,-1; scalar N(u)=u versus N(e)=0 | no counterexample | BCDT line 2967 |
| 3.3 Theorem, `cubicLocalLocalDescent` :806 | arbitrary totally ramified cyclic cubic; local-local hypothesis | no counterexample | BCDT line 3026 |
| 3.4 Theorem, `cubicResidualModel` :817 | c=0 versus c nonzero; nine parameter pairs; contravariance | no counterexample | BCDT line 3038, line 3069 |
| 3.5 Theorem, `cubicRankOneSelfExtensions` :835 | b=0 versus b nonzero; both signs delta; minus descent constant | no counterexample | BCDT line 3076, line 3111 |
| 3.6 Theorem, `cubicRankThreeSplitting` :847 | c=0 degeneracy versus tres c nonzero; rank-three filtration | no counterexample | BCDT line 3149, line 3170 |
| 3.7 Theorem, `cubicDiagonalVanishing` :858 | cyclic fixed-determinant condition versus nonabelian all Ext | no counterexample | BCDT line 1936 |
| 3.8 Theorem, `cubicTangentBound` :869 | tangent dimension zero or one; upper bound does not imply existence | no counterexample | BCDT Theorem 4.4.1, p.875 |
| 3.9 Theorem, `cubicWeakAcceptability` :877 | peu excluded; nonempty versus zero type quotient | no counterexample | BCDT line 943 |
| 4.1 Theorem, `degreeTwelveRankOneDescent` :904 | r=0,2,4,6,10,12; c0 signs; scalar extension to F9 | no counterexample | BCDT line 3280, line 3638 |
| 4.2 Theorem, `degreeTwelveAdaptedBases` :916 | rank one; rank zero; r=4 excluded; F3 versus F9 rank | R11 | BCDT line 3312, line 3649 |
| 4.3 Theorem, `quadraticResidualModel` :928 | peu versus tres; reversed pair; F=V=0 does not prove nonvanishing | no counterexample | BCDT line 3339 |
| 4.4 Theorem, `quadraticPushPullVanishing` :940 | rank-three filtration; forbidden constant c | no counterexample | BCDT line 3543, line 3584 |
| 4.5 Theorem, `quadraticDiagonalVanishing` :951 | weights 2,10; ramified versus unramified class | no counterexample | BCDT line 3589 |
| 4.6 Theorem, `quadraticTangentBound` :962 | zero tangent; one-dimensional bound | no counterexample | BCDT line 1677 |
| 4.7 Theorem, `quadraticWeakAcceptability` :968 | both quadratic signs; unramified twist | no counterexample | BCDT Theorem 2.1.4, p.862 |
| 5.1 Construction, `extendedModels` :994 | zero parameters; c=1,cprime=0; u^30 nonzero; same inverse deep sign | R11, R13, R14 | BCDT line 3678, line 3716 |
| 5.2 Theorem, `extendedModelClassification` :1025 | zero, peu and tres parameters; c+cprime=0 splitting line | no counterexample | BCDT line 3669, line 3727 |
| 5.3 Theorem, `extendedReverseExtensions` :1037 | three zero reverse Ext groups versus (6,6) | no counterexample | BCDT line 4024, line 4071 |
| 5.4 Theorem, `extendedDiagonalExtensions` :1048 | r=2,6,10; c=0 unramified; negative monodromy sign | no counterexample | BCDT line 4089, line 4134 |
| 5.5 Theorem, `extendedCoefficientFiltration` :1059 | k=F3 and finite extension; unique generic omega line | no counterexample | BCDT line 4197 |
| 5.6 Definition, `extendedFilteredCategories` :1070 | empty filtration; one residual piece; split characters excluded; exponent 9 | no counterexample | BCDT line 1721 |
| 5.7 Theorem, `extendedThetaVanishing` :1089 | c=0 degeneration excluded by tres; exceptional rank-four calculation | no counterexample | BCDT line 4330 |
| 5.8 Theorem, `extendedTangentBound` :1100 | four weight pairs; zero versus one-dimensional tangent | no counterexample | BCDT line 1726 |
| 5.9 Construction, `extendedArtinDeformations` :1106 | N=1,2; coefficient Frobenius fixes T; three t exponents | R11 applies to descent carrier; R01, R13 | BCDT line 1728, line 4236 |
| 5.10 Theorem, `extendedCharacteristicThreeRings` :1127 | D=0; exponent 3,9; F(x,y)=(-3y,x) without torsion-kernel condition | corrected annihilator argument valid | BCDT line 1741 |
| 5.11 Theorem, `extendedPointFactorization` :1141 | characteristic-zero point excludes 3-killed rings | no counterexample | BCDT line 1786 |
| 5.12 Theorem, `extendedWeakAcceptability` :1152 | full G3 shape; unramified sign twist; zero type quotient | no counterexample | BCDT line 969 |
| 6.1 Theorem, `threeTorsion_locallyConstant` :1178 | identity point; finite-etale 3-torsion over Q3 despite residue prime 3 | no counterexample | BCDT proof of 2.2.1, p.864 |
| 6.2 Theorem, `threeTorsionCover` :1189 | 48 bases; one-sign quotient 24; simultaneous sign gives two components | no counterexample | SBT line 123 |
| 6.3 Construction, `globalCompanion` :1203 | all six local types; pairing chosen from local point | no counterexample | BCDT proof of 2.2.1, p.864 |
| 6.4 Theorem, `sixCaseTateTypes` :1222 | tame/potentially multiplicative branch; extended Frobenius sign | no counterexample | BCDT proof of 2.2.1, p.865 |
| 6.5 Theorem, `bcdtLifting` :1233 | finite inertia of determinant ratio; odd prime and restricted irreducibility | supplier theorem not available for exact comparison | BCDT Theorems 1.4.1–1.4.2, pp.857–860 |
| 6.6 Theorem, `modThree_modular` :1245 | irreducible but not initially absolute; oddness; weight 1+1=2 | no counterexample | DDT line 3265, line 3292, line 3316 |
| 6.7 Theorem, `modularityTransfer` :1257 | reducible residual requires semisimplification; twist and isogeny | supplier conditional interfaces unavailable | DDT line 3302 |
| 6.8 Theorem, `wildLiftingApplication` :1269 | surjective mod 3; local nonsplit centralizer scalars | no counterexample under suppliers | BCDT proof of 2.2.1, p.865 |
| 6.9 Theorem, `tameBranchModularity` :1280 | conductor exponent <=2 versus exponent >=3 | no counterexample | CDT line 1608 |
| 6.10 Theorem, `globalModFive` :1291 | F5 versus F5bar; irreducibility; all six local cases | no counterexample under suppliers | BCDT Theorem 2.2.1, pp.862–865 |
| 6.11 Theorem, `exceptionalIsogenyClasses` :1303 | j signs; twists; zero and pole of level-75 double cover; constant-map rejection | equations verified; explicit modular maps uncertified here | CDT line 1658; Elkies line 2477; Cremona line 131, line 1384 |
| 6.11 Finite modularity targets, `exceptionalIsogenyClasses` :1309 | j signs; twists; zero and pole of level-75 double cover; constant-map rejection | equations verified; explicit modular maps uncertified here | CDT line 1658; Elkies line 2477; Cremona line 131, line 1384 |
| 6.12 Theorem, `fiveAdicSwitch` :1327 | restricted mod-5 image Borel/order16; tame inertia at 3 | no counterexample | CDT line 1631, Theorem 7.2.4 |
| 6.13 Theorem, `ellipticModularity` :1339 | elliptic/nonzero discriminant; reducible residual branch retained | no counterexample under suppliers; R18 ownership form | BCDT Theorem 2.2.2, p.865 |

### Lean declaration and context table

All declarations are in `packages/EllipticCurveModularityWild3Adic/Suggested.lean`. Global context: `noncomputable section`, namespace `TauCetiRoadmap.EllipticCurveModularityWild3Adic`, `open Polynomial`, and explicit local prime facts for 3 and 5. There are no section `variable` or `include` declarations. `Q3`, `Q3bar`, `F3`, and `M2` are fixed aliases. Polymorphic `k` and `D` retain their own universe and typeclass binders. No Lean command was run.

The two ellipticity instances are local to `LayerW36`: the conductor-50 instance is available from line 499, the conductor-338 instance from line 503, both through line 513. The `j`-invariant example at line 508 therefore has both instances in scope. All other field, algebra and topology instances come from the fixed carriers or the explicit binders shown below.

| Declaration and line | Layer | Additional variable / instance context | Mathematical test and outcome |
|---|---|---|---|
| `instance` :33 (instance) | preamble | Fact (Nat.Prime 3) | alias/instance has real body; no mathematical defect identified |
| `instance` :34 (instance) | preamble | Fact (Nat.Prime 5) | alias/instance has real body; no mathematical defect identified |
| `Q3` :37 (abbrev) | preamble | no variable binder | alias/instance has real body; no mathematical defect identified |
| `Q3bar` :40 (abbrev) | preamble | no variable binder | alias/instance has real body; no mathematical defect identified |
| `zetaMatrix` :49 (def) | Layer W3.0 | no variable binder | matrix cube 1, order 3, difference-square -3 agree |
| `zeta` :52 (def) | Layer W3.0 | no variable binder | matrix cube 1, order 3, difference-square -3 agree |
| `orderOf_zeta` :56 (theorem) | Layer W3.0 | no variable binder | matrix cube 1, order 3, difference-square -3 agree |
| `zeta_sub_inv_sq` :61 (theorem) | Layer W3.0 | no variable binder | matrix cube 1, order 3, difference-square -3 agree |
| `SerreWeightAdmitsTriangular` :70 (def) | Layer W3.0 | (ℓ : ℕ); (n : ℕ); (m a b : ZMod (ℓ - 1)); (peu : Prop) | p=3 and n=0,2 discriminate; p=0,1,2 are merely arithmetic predicates, not claims of a representation classification |
| `DiagonalCharacterSimplyAdmits` :75 (def) | Layer W3.0 | (ℓ : ℕ); (m a b : ZMod (ℓ - 1)); (tres : Prop) | p=3, m=0,1 and tres=True,False discriminate; other p give only arithmetic predicates |
| `ExtendedCharacterFrobeniusCondition` :80 (def) | Layer W3.0 | {k : Type*}; [Field k]; (c frob : k) | frob=1 and c=+1,-1 over F3 distinguish the sign; in characteristic 2 the signs coincide |
| `example` :85 (example) | Layer W3.0 | no variable binder | finite exponent/sign cases agree |
| `example` :89 (example) | Layer W3.0 | no variable binder | finite exponent/sign cases agree |
| `example` :94 (example) | Layer W3.0 | no variable binder | finite exponent/sign cases agree; third example for one definition (R15) |
| `example` :100 (example) | Layer W3.0 | no variable binder | finite exponent/sign cases agree |
| `example` :102 (example) | Layer W3.0 | no variable binder | finite exponent/sign cases agree |
| `example` :108 (example) | Layer W3.0 | no variable binder | finite exponent/sign cases agree |
| `example` :111 (example) | Layer W3.0 | no variable binder | finite exponent/sign cases agree |
| `card_units_mod_cubes` :122 (theorem) | Layer W3.1 | no variable binder | valuation/unit cube classes; non-Galois negative control; R10 |
| `card_integerUnits_mod_cubes` :127 (theorem) | Layer W3.1 | no variable binder | valuation/unit cube classes; non-Galois negative control; R10 |
| `three_not_unit_mod_cubes` :132 (theorem) | Layer W3.1 | (u : ℤ_[3]ˣ); (x : Q3ˣ) | valuation/unit cube classes; non-Galois negative control; R10 |
| `nonGalois_cubic_kummer_control` :138 (theorem) | Layer W3.1 | (α : Q3bar); (hα : α ^ 3 = 3) | valuation/unit cube classes; non-Galois negative control; R10 |
| `cyclicCubicPoly` :146 (def) | Layer W3.1 | no variable binder | root equations, Eisenstein degrees and valuations consistent; no omitted root hypothesis |
| `nonabelianCubicPoly` :149 (def) | Layer W3.1 | no variable binder | root equations, Eisenstein degrees and valuations consistent; no omitted root hypothesis |
| `cyclicCubicField` :152 (def) | Layer W3.1 | (π : Q3bar) | root equations, Eisenstein degrees and valuations consistent; no omitted root hypothesis |
| `nonabelianCubicSplittingField` :155 (def) | Layer W3.1 | (π j : Q3bar) | root equations, Eisenstein degrees and valuations consistent; no omitted root hypothesis |
| `degreeTwelveSplittingField` :159 (def) | Layer W3.1 | (s j α β : Q3bar) | root equations, Eisenstein degrees and valuations consistent; no omitted root hypothesis |
| `cyclicCubic_minpoly` :163 (theorem) | Layer W3.1 | (π : Q3bar); (hπ : π ^ 3 - 3 * π ^ 2 + 3 = 0) | root equations, Eisenstein degrees and valuations consistent; no omitted root hypothesis |
| `cyclicCubic_galois` :169 (theorem) | Layer W3.1 | (π : Q3bar); (hπ : π ^ 3 - 3 * π ^ 2 + 3 = 0) | root equations, Eisenstein degrees and valuations consistent; no omitted root hypothesis |
| `nonabelianCubic_finrank` :177 (theorem) | Layer W3.1 | (π j : Q3bar); (hπ : π ^ 3 - 3 * π ^ 2 + 6 = 0); (hj : j ^ 2 = -1) | root equations, Eisenstein degrees and valuations consistent; no omitted root hypothesis |
| `example` :184 (example) | Layer W3.1 | (π j : Q3bar); (hπ : π ^ 3 - 3 * π ^ 2 + 6 = 0); (hj : j ^ 2 = -1) | mathematics consistent; admitted example R01 |
| `positiveQuadratic_finrank` :190 (theorem) | Layer W3.1 | (s j α β : Q3bar); (hs : s ^ 2 = 3); (hj : j ^ 2 = -1); (hα : α ^ 3 - 3 * α + 3 = 0); (hβ : β ^ 2 = s) | root equations, Eisenstein degrees and valuations consistent; no omitted root hypothesis |
| `negativeQuadratic_finrank` :195 (theorem) | Layer W3.1 | (s j α β : Q3bar); (hs : s ^ 2 = -3); (hj : j ^ 2 = -1); (hα : α ^ 3 = 4); (hβ : β ^ 2 = -s) | root equations, Eisenstein degrees and valuations consistent; no omitted root hypothesis |
| `extendedTypeField_finrank` :200 (theorem) | Layer W3.1 | (i : Fin 3); (s j α β : Q3bar); (hs : s ^ 2 = -3); (hj : j ^ 2 = -1); (hα : α ^ 3 = 3 * (1 + 3 * (i.val : Q3bar))); (hβ : β ^ 2 = -s) | root equations, Eisenstein degrees and valuations consistent; no omitted root hypothesis |
| `negativeQuadratic_shifted_root` :206 (theorem) | Layer W3.1 | (α : Q3bar); (hα : α ^ 3 = 4) | root equations, Eisenstein degrees and valuations consistent; no omitted root hypothesis |
| `extendedTypeField_pi_pow_twelve` :211 (theorem) | Layer W3.1 | (i : Fin 3); (s α β : Q3bar); (hs : s ^ 2 = -3); (hα : α ^ 3 = 3 * (1 + 3 * (i.val : Q3bar))); (hβ : β ^ 2 = -s) | root equations, Eisenstein degrees and valuations consistent; no omitted root hypothesis |
| `positiveQuadratic_valuation` :218 (theorem) | Layer W3.1 | (v : AddValuation Q3bar (WithTop ℚ)); (hv : ∀ q : Q3, v (algebraMap Q3 Q3bar q) = ((Padic.addValuation q).map ((↑) : ℤ → ℚ))); (s α β : Q3bar); (hs : s ^ 2 = 3); (hα : α ^ 3 - 3 * α + 3 = 0); (hβ : β ^ 2 = s) | root equations, Eisenstein degrees and valuations consistent; no omitted root hypothesis |
| `negativeQuadratic_valuations` :226 (theorem) | Layer W3.1 | (v : AddValuation Q3bar (WithTop ℚ)); (hv : ∀ q : Q3, v (algebraMap Q3 Q3bar q) = ((Padic.addValuation q).map ((↑) : ℤ → ℚ))); (s α β : Q3bar); (hs : s ^ 2 = -3); (hα : α ^ 3 = 4); (hβ : β ^ 2 = -s) | root equations, Eisenstein degrees and valuations consistent; no omitted root hypothesis |
| `cartan_element_sq` :234 (theorem) | Layer W3.1 | (β : GaloisField 5 2); (h₁ : β ^ 5 = -β); (h₂ : β ^ 6 = 3) | finite-field/group computation agrees |
| `GL2_F3_index_two` :241 (theorem) | Layer W3.1 | (H : Subgroup (GL (Fin 2) (ZMod 3))); (hH : H.index = 2) | finite-field/group computation agrees |
| `GL2_F3_eq_top` :247 (theorem) | Layer W3.1 | (H : Subgroup (GL (Fin 2) (ZMod 3))); (hcard : 24 ≤ Nat.card H); (hdet : Function.Surjective fun h : H => Matrix.GeneralLinearGroup.det (h : GL (Fin 2) (ZMod 3))) | finite-field/group computation agrees |
| `shortWeierstrass` :253 (def) | Layer W3.1 | (a b : ℚ) | all displayed discriminants, j-values, valuations and point count agree |
| `localCurveCaseOne` :258 (def) | Layer W3.1 | no variable binder | all displayed discriminants, j-values, valuations and point count agree |
| `localCurveCaseTwo` :259 (def) | Layer W3.1 | no variable binder | all displayed discriminants, j-values, valuations and point count agree |
| `localCurveCaseThree` :260 (def) | Layer W3.1 | no variable binder | all displayed discriminants, j-values, valuations and point count agree |
| `localCurveCaseFour` :261 (def) | Layer W3.1 | no variable binder | all displayed discriminants, j-values, valuations and point count agree |
| `localCurveCaseFive` :262 (def) | Layer W3.1 | no variable binder | all displayed discriminants, j-values, valuations and point count agree |
| `localCurveCaseSix` :263 (def) | Layer W3.1 | no variable binder | all displayed discriminants, j-values, valuations and point count agree |
| `example` :266 (example) | Layer W3.1 | no variable binder | all displayed discriminants, j-values, valuations and point count agree |
| `example` :270 (example) | Layer W3.1 | no variable binder | all displayed discriminants, j-values, valuations and point count agree |
| `example` :274 (example) | Layer W3.1 | no variable binder | all displayed discriminants, j-values, valuations and point count agree |
| `example` :279 (example) | Layer W3.1 | no variable binder | all displayed discriminants, j-values, valuations and point count agree |
| `example` :287 (example) | Layer W3.1 | no variable binder | mathematics consistent; admitted example R01 |
| `example` :293 (example) | Layer W3.1 | no variable binder | all displayed discriminants, j-values, valuations and point count agree |
| `F3` :307 (abbrev) | Layer W3.2 | no variable binder | alias/instance has real body; no mathematical defect identified |
| `M2` :310 (abbrev) | Layer W3.2 | no variable binder | alias/instance has real body; no mathematical defect identified |
| `thetaLowerLeft` :313 (def) | Layer W3.2 | no variable binder | entry identities and image verified; zero-map Checks fail to distinguish (R12) |
| `thetaOneDiagonal` :319 (def) | Layer W3.2 | no variable binder | entry identities and image verified; zero-map Checks fail to distinguish (R12) |
| `thetaOmegaDiagonal` :325 (def) | Layer W3.2 | no variable binder | entry identities and image verified; zero-map Checks fail to distinguish (R12) |
| `thetaOne_eq_neg_thetaOmega` :332 (theorem) | Layer W3.2 | (A : M2); (hA : Matrix.trace A = 0) | entry identities and image verified; zero-map Checks fail to distinguish (R12) |
| `example` :339 (example) | Layer W3.2 | (b : F3) | entry identities and image verified; zero-map Checks fail to distinguish (R12) |
| `adjointKernelEmbedding` :344 (def) | Layer W3.2 | no variable binder | entry identities and image verified; zero-map Checks fail to distinguish (R12) |
| `range_adjointKernelEmbedding` :355 (theorem) | Layer W3.2 | no variable binder | entry identities and image verified; zero-map Checks fail to distinguish (R12) |
| `BreuilScalars` :362 (abbrev) | Layer W3.2 | (n : ℕ) | n=0 gives zero quotient, n=1 gives F3; cPi signs agree |
| `uVar` :365 (def) | Layer W3.2 | (n : ℕ) | n=0 gives zero quotient, n=1 gives F3; cPi signs agree |
| `cPi` :368 (def) | Layer W3.2 | (G : F3[X]) | n=0 gives zero quotient, n=1 gives F3; cPi signs agree |
| `example` :371 (example) | Layer W3.2 | no variable binder | n=0 gives zero quotient, n=1 gives F3; cPi signs agree |
| `example` :376 (example) | Layer W3.2 | no variable binder | n=0 gives zero quotient, n=1 gives F3; cPi signs agree |
| `example` :381 (example) | Layer W3.2 | no variable binder | arithmetic true; does not encode full Breuil/descent object |
| `example` :386 (example) | Layer W3.2 | no variable binder | mathematics consistent; admitted example R01 |
| `example` :393 (example) | Layer W3.2 | no variable binder | arithmetic true; does not encode full Breuil/descent object |
| `example` :397 (example) | Layer W3.2 | no variable binder | arithmetic true; does not encode full Breuil/descent object |
| `sixSixFiltration` :415 (def) | W3.3–W3.5 | (c c' : F3) | generator membership true; missing exclusion test R14 |
| `example` :421 (example) | W3.3–W3.5 | no variable binder | generator membership true; missing exclusion test R14 |
| `ArtinCoeff` :426 (abbrev) | W3.3–W3.5 | (N : ℕ) | N=0,1,2; coefficient-linear Frobenius consistent; R13 |
| `tVar` :429 (def) | W3.3–W3.5 | (N : ℕ) | N=0,1,2; coefficient-linear Frobenius consistent; R13 |
| `ArtinBreuilScalars` :432 (abbrev) | W3.3–W3.5 | (N : ℕ) | N=0,1,2; coefficient-linear Frobenius consistent; R13 |
| `uArtin` :435 (def) | W3.3–W3.5 | (N : ℕ) | N=0,1,2; coefficient-linear Frobenius consistent; R13 |
| `artinFrobenius` :438 (def) | W3.3–W3.5 | (N : ℕ) | N=0,1,2; coefficient-linear Frobenius consistent; R13 |
| `artinFrobenius_u` :444 (theorem) | W3.3–W3.5 | (N : ℕ) | N=0,1,2; coefficient-linear Frobenius consistent; R13 |
| `example` :449 (example) | W3.3–W3.5 | no variable binder | mathematics consistent; admitted example R01 |
| `nsmul_three_eq_zero_of_frobenius_sq` :456 (theorem) | W3.3–W3.5 | {D : Type*}; [AddCommGroup D]; (F : D →+ D); (hprimary : ∃ n : ℕ, ∀ x : D, (3 ^ n) • x = 0); (hker : ∀ x : D, 3 • x = 0 → F x = 0); (hsq : ∀ x : D, F (F x) = -(3 • x)) | bounded 3-primary proof valid; Z/9 negative control agrees |
| `example` :464 (example) | W3.3–W3.5 | no variable binder | bounded 3-primary proof valid; Z/9 negative control agrees |
| `card_GL2_F3` :480 (theorem) | Layer W3.6 | no variable binder | finite-field/group computation agrees |
| `exceptionalCurveFifty` :485 (def) | Layer W3.6 | no variable binder | all displayed discriminants, j-values, valuations and point count agree |
| `exceptionalCurveThreeThirtyEight` :488 (def) | Layer W3.6 | no variable binder | all displayed discriminants, j-values, valuations and point count agree |
| `example` :491 (example) | Layer W3.6 | no variable binder | all displayed discriminants, j-values, valuations and point count agree |
| `instance` :499 (instance) | Layer W3.6 | exceptionalCurveFifty.IsElliptic | all displayed discriminants, j-values, valuations and point count agree |
| `instance` :503 (instance) | Layer W3.6 | exceptionalCurveThreeThirtyEight.IsElliptic | all displayed discriminants, j-values, valuations and point count agree |
| `example` :508 (example) | Layer W3.6 | no variable binder | all displayed discriminants, j-values, valuations and point count agree |

Counts: 82 bold target blocks in 76 sections; 90 Lean declarations; 221 README Check bullets.

## Not verifiable

- **Serre, Corps locaux, Chapter XIV §1 Proposition 3.** No readable legal copy was obtained through the sources service. BCDT line 1925 confirms the citation, not its primary text. This is the sole outstanding entry in the job's `needs-references.toml`; all ten cited works were attempted before recording that request.
- **Berthelot–Breen–Messing, Théorie de Dieudonné cristalline II, 4.2.14.** The service records the DOI `10.1007/bfb0093025` as `uncertified` because the text is paywalled. It is not an outstanding missing-reference request and is not itself a new finding.
- **Twelve supplier heads.** The supplied main/Completed checkout contains no readable roadmap copy for LocalGaloisDeformationRings, FiniteFlatGroupsAndIntegralPadicHodgeTheory, GL2AutomorphicRepresentationsAndTransfer, GL2ModularityLifting, OrdinaryAutomorphicFormsAndModularityLifting, ModularCurvesPartII, InverseGaloisAndArithmeticFundamentalGroups, ArithmeticGaloisRepresentations, AlgebraicModularFormsAndSerreWeights, EllipticCurveModularity, PadicHodgeTheory or ComplexMultiplicationAndExplicitReciprocity. Their names occur in the permitted order, but that does not establish the claimed section names, declarations, hypotheses or monodromy conventions. No supplier-drift finding is inferred merely from absent local copies.
- **Arbitrary-base twisted moduli.** The available ModularCurves §5C contract is over `ℚ`, whereas §1.15 uses any characteristic-zero field `K`. The target `twistedY5_universal` may supply the required extension; the inaccessible ModularCurvesPartII contracts prevent certification of the claimed full input interface. The arithmetic realization theorem itself is supported by SBT Lemma 1.1.
- **Explicit modular parametrizations in §6.11.** The cited curve rows and exceptional-value calculations were verified. The displayed sources do not provide the proposed explicit nonconstant maps from the relevant modular curves to the fixed curves. Those construction certificates remain future proof obligations; they were not inferred from database labels.
- **Lean elaboration.** No elaborator was run, as required by the read-only brief. The context table records written binders and typeclass arguments; it does not claim an elaborated `#check` result or certify the 22 example proof scripts against the pins.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "c2a310201c372046b22377c69971368a88f7d5a6", "job": "RT-EllipticCurveModularityWild3Adic~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->

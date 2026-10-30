# Review of EllipticCurveModularityPartIIGL2TypeAbelianVarieties (pull request #1036 at 563d1cb)

**Verdict:** needs changes

The gate fails on `target-ids` (44 headings), so the folder cannot be accepted at this head whatever else holds. One finding is blocking (R01, P2): the finiteness of newforms that drives Ribet's pigeonhole step is demanded from a completed roadmap that does not state it. Everything else is P3: declaration names and section numbers that have drifted in five suppliers, Lean form, a supplier theorem stated as a headline, and a few style fragments. The mathematics of the 32 targets checked below is sound against the sources, and the four Lean statements match the README at the pins.

## R01 (P2) — GT.3/fixed-newform asks a completed roadmap to export a finiteness it does not state

**Location.** `TauCetiRoadmap/EllipticCurveModularityPartIIGL2TypeAbelianVarieties/README.md` line 760: "ModularForms Layer 4 must export finiteness of normalized weight-two newforms of positive level dividing `cond(A)`"; line 769 *Needs:* `ModularForms Layer 4`.

**Claim.** The pigeonhole step of GT.3/fixed-newform (Ribet's proof of Theorem 4.4, ribet92 lines 339–343) needs that there are finitely many normalized weight-two newforms of level dividing `cond(A)`. The README attributes this to ModularForms Layer 4 and phrases it as an obligation on that roadmap.

**Witness.** ModularForms is a completed roadmap on main. Its Layer 4 (`TauCetiRoadmap/ModularForms/README.md` lines 532–637) states the newform decomposition and the conductor, and contains no finiteness statement (no hit for "finite" or "finitely many" in those lines). Finite-dimensionality at every level is built in its Layer 10 (lines 207–208); distinctness of newforms is Layer 5 (line 657, cross-level strong multiplicity one). A completed roadmap cannot be asked to export anything, so as written the input is unowned.

**Repair.** Own the finiteness in GT.3/fixed-newform as one sentence of the target: distinct normalized newforms of level `M` are linearly independent in `S₂(Γ₁(M))` (ModularForms Layer 5), which is finite-dimensional (ModularForms Layer 10), so each of the finitely many `M | cond(A)` carries finitely many. Replace the *Needs:* item `ModularForms Layer 4` by `ModularForms Layers 5 and 10`, and delete "must export". Tested on the instance that refuted the original: the same two citations give the count for `cond(A) = 529` (levels 1, 23, 529) that the `J₀(23)` Check uses.

## R02 (P3) — Supplier declaration names and anchors that do not exist where they are cited

**Location and claim.** The README cites, as supplier declarations or anchors, names that none of the cited roadmaps declare (each checked at the open head via `roadmaps show`, README and `Suggested.lean`):

- line 74 (and 740): `TauCeti.ResidualModularity.ArisesFrom`, `ArisesFrom.iff_integral_model`, link `#target-s-type-arises-from-and-modular`. AlgebraicModularFormsAndSerreWeights uses `ArisesFrom` only in prose (its lines 1560, 1590, 1604, 1630); the qualified name and `iff_integral_model` occur in neither its README nor its `Suggested.lean`; the anchor string does not occur. The content exists: §7.5 "S-type and modularity predicates" (its line 1586) states the integral-model reading as a theorem (line 1590).
- line 82 (and 1063, 1070): `newformOf`, `IsNewformOf.level_eq_conductor`, link `#elliptic-conductor-comparison`. EllipticCurveModularity declares `IsNewformOf` (its `Suggested.lean` line 80) but neither `newformOf` nor `level_eq_conductor`; the anchor does not occur. The content exists as the prose targets "The newform of an elliptic curve" (its line 1197, Layer R29.3), "The conductor and its semistable comparison" (line 1312) and "The level is the conductor" (line 1340, Layer R29.4).
- line 1397: `GL2Transfer.compatible_descent_twist` of GL2AutomorphicRepresentationsAndTransfer R17.6.18. Zero occurrences in that roadmap's README and `Suggested.lean`; R17.6.18 "Automorphic descent with a consistent compatible-system twist" (its line 2791) is prose.
- line 1019: `fixedEigenformFamily` and "the dual operation of AutomorphicGaloisRepresentationsPartII AG2.P". The name occurs nowhere in AutomorphicGaloisRepresentations (§7.3 "The fixed-eigenform compatible family", its line 3098, names no declaration). AG2.P has no dual operation; its "Arbitrary-rank compatible data and operations" subsection (its line 432) supplies restriction, direct sum, twist by an algebraic character and a Frobenius-convention adapter `P_v ↦ XⁿP_v(1/X)/P_v(0)` without dualising.
- lines 979 and 1045: "AutomorphicGaloisRepresentations §6.4 (a)" and "6.4 (c)". §6.4 "Classical conductors and bad Euler factors" (its line 2568) is one paragraph with no part labels.

**Repair.** Cite by section title in each case and drop the invented names: AlgebraicModularFormsAndSerreWeights §7.5 (R15.6) for the predicate and its integral-model theorem; EllipticCurveModularity R29.3 "The newform of an elliptic curve" and R29.4 "The level is the conductor"; GL2AutomorphicRepresentationsAndTransfer R17.6.18 by title; AutomorphicGaloisRepresentations §7.3 by title, with AG2.P's Frobenius-convention adapter named as what it is; §6.4 without part labels. Lines 1397–1399 ("set `r = ρ₂`, `s = ρ₁`, and use the same H-intertwiner P") describe a declaration that does not exist and should be rewritten against R17.6.18's prose.

## R03 (P3) — ModularCurvesPartII Layer 16 is cited one section off

**Location.** README lines 69, 380, 386, 388, 393, 397, 701–707, 853, 924, 945, 947, 955, 966, 1352 and the Scope paragraph (line 13).

**Claim and witness.** ModularCurvesPartII Layer 16 (its lines 4097–4240) has exactly seven targets: 16.1 Hecke prime and coefficient field, 16.2 `A_f`, 16.3 Tate module and dimension, 16.4 differentials, **16.5 Trivial character: the quotient of `J₀(N)`**, **16.6 Oldforms: `A_f` inside `J₁(M)`**, **16.7 The Abel–Jacobi composite to `A_f` is nonconstant**; there is no §16.8. The README cites "§16.6, Trivial character" (lines 393, 397, 947), "§16.8, The Abel–Jacobi composite" (line 945), §16.7 for the old/new isogeny decomposition (line 388) and the range "§§16.1–16.8" (line 955).

**Repair.** Shift every Layer-16 citation at or above 16.5 down by one and cap ranges at 16.7. The definition cited at line 380 (`A_f = J₁(N)/p_f J₁(N)`) agrees with that roadmap's `J₁(N)/B_f` (its line 4122), so nothing else changes.

## R04 (P3) — Gate: 44 target headings are not in `### k.n Title` form

**Location.** README lines 205, 241, 292, 318, 355, 378, 424, 474, 495, 526, 547, 565, 584, 602, 620, 638, 658, 693, 730, 754, 773, 808, 833, 873, 892, 912, 938, 972, 992, 1013, 1039, 1061, 1097, 1192, 1231, 1257, 1276, 1294, 1331, 1356, 1391, 1422, 1441, 1462 (headings `### GT.k/slug — Title`).

**Claim.** The gate reports `target-ids=44 ... FAIL` with the rule "write `### k.n Title` (digits only, no prefix)"; all other gate counters are 0 and the build passes. No acceptance while the gate fails.

**Repair.** Renumber flat: `## Layer 1: Abelian varieties of GL₂-type …`, `### 1.1 The degree of an acting division algebra divides the dimension`, …, `### 6.4 ℚ-curves over quadratic fields are modular`, and replace every `GT.k/slug` cross-reference (in *Needs:* lines, Checks, the two docstrings in `Suggested.lean` and the Downstream paragraph) by `§k.n`. The two open consumers that cite this roadmap today use the old labels (AbelianSurfacesModularity line 186 "GT.3"; SatoTateGroups lines 1292 "GT.1/primitive" and 1590 "GT.5"), so say in the pull request that the labels changed.

## R05 (P3) — Lean form: library namespace, docstring form, an unneeded local instance

**Location.** `TauCetiRoadmap/EllipticCurveModularityPartIIGL2TypeAbelianVarieties/Suggested.lean` lines 8–33, 39, 41, 102, 132.

**Claim.** (i) Declarations live in `namespace TauCeti.GL2Type` and `TauCeti.QCurve`, the library's namespace, instead of `namespace TauCetiRoadmap.EllipticCurveModularityPartIIGL2TypeAbelianVarieties`; a later library file named `TauCeti.GL2Type.End0` would clash. (ii) The module docstring is not of the form "<title>: target signatures", carries commit hashes and the `GT.n` labels that R04 removes. (iii) `attribute [local instance] CategoryTheory.Over.cartesianMonoidalCategory` (line 39) is unnecessary: a copy of the file with that line deleted elaborates identically (four `sorry` warnings, no error), since `TauCeti/AlgebraicGeometry/AbelianVariety/Product.lean` lines 224–232 already give `HasFiniteProducts (AbelianVariety K)`.

**Repair.** Use the roadmap namespace (one `namespace`, with `/-! ## Layer k -/` section comments between the GT.1 and GT.5 statements), rewrite the docstring as "Abelian varieties of GL₂-type and modularity of ℚ-curves: target signatures" listing the non-statable headlines as now, and delete line 39. Update the eight backticked names in README lines 140–142 accordingly.

## R06 (P3) — `tateVanishingQbar` is a supplier's theorem, not a headline of this roadmap

**Location.** `Suggested.lean` lines 134–135; README lines 79, 1231–1255.

**Claim.** The statement is Tate's vanishing `H²(G_ℚ, ℚ̄ˣ) = 0` for the trivial action. The README's own contract (line 79) assigns `H²(G_F, ℚ/ℤ) = 0` to ArithmeticGaloisRepresentations §7.6 "Projective lifting" (its line 4619 states exactly that, for every number field `F`), and the passage to `ℚ̄ˣ` is one application of the pinned `TauCeti.ContinuousCohomology.subsingleton_continuousCohomology_of_module_rat` (`TauCeti/RepresentationTheory/Homological/ContCohomology/Torsion.lean` line 124) to the uniquely divisible quotient. The declaration names none of this roadmap's objects. It is not one-tactic padding (probes with `simp`, `Subsingleton.elim` and `infer_instance` all fail: `Additive ℚ̄ˣ` has torsion), but a sorried restatement of an imported theorem is still not an acceptance test of this roadmap.

**Repair.** Delete `tateVanishingQbar`, `trivialUnitsCoefficients` and `unitCohomology2` from `Suggested.lean` (they exist only to state it); GT.5/tate-vanishing-qbar in the README keeps the target with its derivation from ArithmeticGaloisRepresentations §7.6, and lines 1175–1190 and 1235–1236 drop the Lean names.

## R07 (P3) — "The Abel–Jacobi image generates the Jacobian" is not what JacobianChallenge Layer F states

**Location.** README lines 944 and 946 ("The pointed Abel–Jacobi image generates `J₁(N)` by JacobianChallenge layer F"; "the Jacobian is generated by the curve, Tau Ceti JacobianChallenge layer F").

**Witness.** `TauCetiRoadmap/JacobianChallenge/README.md` Layer F (lines 448–452) defines `abelJacobi` and proves the Albanese property: every pointed morphism to an abelian variety factors uniquely through `Jac X`. Generation is not stated (no relevant hit for "generat" in the file).

**Repair.** Derive it in the target in one sentence: if `B ⊆ J₁(N)` is the abelian subvariety generated by the image, the pointed map `X₁(N) → B` factors through `π : J₁(N) → B` by Layer F, and `i ∘ π` and the identity both factor `AJ_c` through `J₁(N)`, so uniqueness gives `i ∘ π = id`, hence `B = J₁(N)`. Cite Layer F for the uniqueness clause only.

## R08 (P3) — A Check misreads Caraiani–Newton Corollary 7.3.4

**Location.** README line 1455: "`K = ℚ(√−11)` and the ℚ-curves with `x(P) ∈ ℚ` of Caraiani–Newton Corollary 7.3.4".

**Witness.** cn23 lines 5052–5065: the points with `x(P) ∈ ℚ` (over any quadratic `F`) satisfy `σ(P) = w₃(P)` and are ℚ-curves; the `ℚ(√−11)` points of Proposition 7.3.3 are the ones that are **not** covered by that argument and are shown modular by Corollary 6.1.1 and a Faltings–Serre check of the LMFDB curve 8100.2-a2. The Check attaches the field of the exceptional points to the ℚ-curve family.

**Repair.** "For a quadratic `K` and a `K`-point of `X(b3, ns5)` with `x(P) ∈ ℚ` (Caraiani–Newton Corollary 7.3.4, first case), Π is a twisted base change from ℚ"; drop `ℚ(√−11)`, or state separately that its two exceptional points are outside this target.

## R09 (P3) — Style: field-list fragments, a garbled sentence, works cited outside the References

**Location and repair.**

- Lowercase sentence fragments that read as stripped `Hypotheses:` lines: README lines 209 ("the map `D → End⁰_ℚ(A)` sends 1 to the identity; …"), 245 ("the isogeny class of `E ⊗_F B` …"), 322 ("A is ℚ-simple and of `GL₂(E)`-type …"), 382 ("f is a newform: …"), 697 ("homomorphisms of abelian varieties over ℚ …"), 1101 ("elliptic curves are those of Mathlib …"), 1196 ("C₀ non-CM, so …"). Fold each into the sentence it qualifies.
- Line 534: "ArithmeticGaloisRepresentations §6.2 and §6.4, Endomorphism coefficients with ArithmeticGaloisRepresentations §6.4, Endomorphism coefficients" is a duplicated clause.
- Works cited in targets but absent from `## References`: Ribet 1980, Cor. 4.2 (line 387); Serre's "Théorème 5" (line 914, no paper named); Diamond–Shurman §5.10 (line 1059); Darmon–Diamond–Taylor §§1.1, 2.2 (line 1082); and two citations by another paper's bibliography numbers, "[6, Theorem 1, p. 204]" (line 627) and "[26, Th. 1] in Ribet" (line 1342). Add entries (Darmon–Diamond–Taylor is readable on the first author's page; its Propositions 2.11–2.12 are on p. 57 and §1.1 on pp. 18–19, as cited) or cite Ribet's own statement instead of his references.
- Line 14 of the Scope section and line 1385 cite "ProfiniteCohomology Layer 10 and the canonical library `H²` comparisons": fine, but line 78's row title "Tau Ceti continuous-cohomology library (ProfiniteCohomology Layer 10)" mixes a library and a roadmap in one owner; split the row.

## Verified sound

**Gate, build, direction.** `gate.md` at 563d1cb: every counter 0 except `target-ids=44` (R04); `build=0`. `lake env lean` on `Suggested.lean`: exit 0, four `declaration uses sorry` warnings (lines 70, 84, 90, 135), nothing else. Dependency check (`gate --depcheck … --movable`): `depcheck: 208 roadmaps, 1483 edges, 0 problem(s)`; no UPWARD or CYCLE line. The merge order lists this roadmap at line 152, after EllipticCurveModularity (151) and every supplier it names; every *Needs:* supplier (AbelianSchemesAndArithmeticModuli 40, ArithmeticGaloisRepresentations 41, NeronModels 46, ModularCurvesPartII 70, AutomorphicLFunctions 77, AlgebraicModularFormsAndSerreWeights 84, GL2AutomorphicRepresentationsAndTransfer 85, SmallRamification 104, FaltingsFiniteness 140, AutomorphicGaloisRepresentations(PartII) 146–147, ClassicalSerreModularity 150) is earlier. No file outside the roadmap folder is changed (`git diff --stat origin/main...HEAD` excluding the folder is empty); the folder holds only `README.md`, `Suggested.lean`, `metadata.toml`.

**Lean signatures against the README.** A scratch copy with `#check @` for all twelve declarations elaborated once; the printed types agree with README lines 160–166, 179–182, 294–300, 357–361, 1296–1304 and 1175–1178: `ribetTheorem21` carries `ι : E →ₐ[ℚ] End0 A` and `↑(finrank ℚ E) = A.dim` and concludes the three conjuncts; `totallyRealOrCm` carries `IsSimpleOverQ A` (needed: a cubic field of signature (1,1) acts regularly on `B³` and is neither totally real nor CM); `ribetTheorem61` takes `IsGeometricQCurve C` and `Nonempty (ℚ ≃ₐ[ℚ] End0 C)` (equivalent to `End C = ℤ` since `End0 C = ℚ ⊗[ℤ] End C`) and returns a simple `A` with full number-field endomorphism algebra of degree `dim A` and an isogeny `A.baseChange Qbar ⟶ C^{finrank ℚ A.TangentSpace}`; `tateVanishingQbar` is over `continuousCohomology 2` of `ofDiscreteModule ℤ GQ (Additive Qbarˣ)` with the trivial action. No `set_option`, no sorried data, single `import Mathlib` plus five existing `TauCeti.*` modules.

**Padding probes.** One-tactic attempts (`simp`, `exact Subsingleton.elim _ _`, `infer_instance`) on `tateVanishingQbar` and `totallyRealOrCm` all fail; the other two statements quantify over all abelian varieties over ℚ and are not closable by one lemma. No declaration mirrors a Check or computes a value.

**Adversarial table.** Instances and values computed on both sides.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| GT.1/lie-algebra-divisibility `dim D ∣ dim A` | elliptic `A/ℚ`, `D = ℚ`; `B×B`, `D = ℚ(√2)`; supersingular `E/𝔽_{p²}` | 1 ∣ 1; 2 ∣ 2; quaternion `dim 4 ∤ 1` | holds in char 0; fails in char p exactly as the Check says | none |
| GT.1/primitive `E ⊗_F B` | `F = ℚ`, `E = ℚ(√2)`, `B = X₀(11)`; `E = F` | `dim = 2 = [E:ℚ]`; `B` itself | ok; `(1,√2)`-basis leaves the first factor unstable | none |
| GT.1/ribet-theorem-2-1, `ribetTheorem21` | `B×B`, `E = ℚ(i)`: `X = M₂(ℚ)`; `J₀(23)`; `A = 0` | `F = ℚ, n = 2, t = 1`: `nt²[F:ℚ] = 2 = nt[F:ℚ]`; `X = ℚ(√5), n = 1`; `A = 0` excluded by `finrank E ≥ 1 ≠ 0` | "simple ↔ ι surjective": `ι(ℚ(i)) ≠ M₂(ℚ)` and not simple; `J₀(23)` simple and surjective | none |
| GT.1/totally-real-or-cm | `ℚ(√5)`; `ℚ(√−3)`; signature-(1,1) cubic on `B³` | totally real; CM; neither (not simple) | `hs` necessary and present | none |
| GT.1/modular-quotient-is-gl2-type | `N = 11, 23, 13` | `K_f = ℚ`, `ℚ(√5)`, `ℚ(√−3)`; `j(11a3) = −4096/11 ≠ j(11a1) = −122023936/161051` | ok | none |
| GT.2/integral-model | `E₀/ℚ`; `X₀(11)²` with `ℚ(√2)` | `A′ = A`; `End_ℚ(A) = M₂(ℤ)` noncommutative, no integral model | negative control correct | none |
| GT.2/frobenius-polynomial | `E = ℚ`; `J₀(23), p = 2` | `d_p = (a_p² − (a_p² − 2p))/2 = p`; `a₂ = (−1+√5)/2`, `d₂ = 2` | ok | none |
| GT.2/determinant-character | `E` totally real; `J₁(13)`; `X₀(11), λ = 11` | `ε = 1`; `ε` of order 6 with `ε(p)ε̄(p) = 1`; `det ρ₁₁ = χ₁₁` by Frobenius comparison | `N_{E/ℚ}(ε) = 1` as ribet92 line 205 | none |
| GT.2/odd | scalar `F_∞ = ±1` | `det = +1`, contradicts the Hodge swap; `χ_ℓ(c) = −1` gives `ε(c) = 1` | ok | none |
| GT.2/coefficient-conjugation | direction of the bar | `V_σ ≅ V_σ̄(σε)` ⇒ `σ(a_p) = σ(ε(p))·σ̄(a_p)` ⇒ `a_p = ε(p)ā_p`; newform `ā_p = ε(p)⁻¹a_p` | matches ribet92 lines 255–257 | none |
| GT.2/inner-twist-field | level 169, `ε = 1`, `σ(a_p) = φ(p)a_p` | `a_p² ∈ ℚ` so `F = ℚ`; `J₀(23)`: `F = E` | ok | none |
| GT.2/residual-irreducibility | `X₀(11)[5]` | reducible (rational 5-torsion), one of finitely many exceptions | ok | none |
| GT.2/conductor-bound | `y² = x³ − x` | conductor 32, bad-prime product 2 (additive at 2) | restriction factor `[E_λ:ℚ_ℓ] ≥ 1` gives `f_p(ρ_λ) ≤ f_p(A)` | none |
| GT.2/crystalline-at-good-primes | `X₀(11)` at 11 | multiplicative, nonzero monodromy, not crystalline | excluded by the good-reduction hypothesis | none |
| GT.3/modular-abelian-variety | `N ≤ 10, 12`; `N = 13`; `X₀(11)` | `g(X₁(N)) = 0`; `J₀(13) = 0`, `dim J₁(13) = 2`; modular at 11 and 22 | ok | none |
| GT.3/serre-witnesses | `X₀(11)`, `λ = 5` | reducible despite good reduction at 5 | excluded from Λ | none |
| GT.3/fixed-newform | finiteness input | ModularForms Layer 4 lines 532–637: none; Layer 10 finite-dimensionality, Layer 5 distinctness | unowned as written | R01 |
| GT.3/coefficient-identification | `K_f = E = ℚ(√5)`, char 5 | `√5 ↦ 0` in both factors; `5 ∣ D` so removed | Check correct | none |
| GT.3/modularity-theorem | powers; dimension one | `d(2^{n−1}) = n` copies in `J₁(N·2^{n−1})`; inverse Frobenius gives `X² − (a_p/p)X + 1/p ≠ X² − a_pX + p` | ok | none |
| GT.3/trivial-character | `J₀(23)`; `J₁(13)` | `ε = 1`, totally real, `Γ₀`; `ε` order 6, no `J₀` quotient | ok | none |
| GT.3/modular-parametrisation | `B×B` from `J₁(22)` | `J₀(22) ~ X₀(11)²`, `g(X₀(22)) = 2` | ok; generation input | R07 |
| GT.4/conductor-of-gl2-type | `J₀(23)`, `J₁(13)`, `X₀(11)` | `2·1 ⇒ 23²`; `13²`; `11` | ok | none |
| GT.4/exact-level | KW level | `Mⁿ = cond(A)ⁿ = N(A)^{n²}`: `529²` for `J₀(23)`, `11` for conductor 11 (kw1 line 921) | ok | none |
| GT.4/strict-compatibility | `X₀(11)` at 3; KW definition | `a₃ = −1`: covariant `X² + X + 3`; dual roots `1/α, 1/β`: `X² + X/3 + 1/3`; kw1 lines 298–300 include `q ∣ ℓ` | ok | none |
| GT.4/l-function | functional equation twice | `Λ(A,s) = ∏_σ Λ(f^σ,s)`, `w_A = ∏ w_σ`, `w_A² = 1` since the Euler product is nonzero | ok | none |
| GT.4/parent-compatibility | 11a1 mod 2 | `y² + y = x³ + x²`: 2 + 2 affine points + ∞ = 5, `a₂ = −2`; `Δ = −11⁵` | ok | none |
| GT.5/q-curve | twist over `𝔽₇`; `a_𝔭²` criterion | `#E(𝔽₇) = 12`, `a₇ = −4`, `j = −6912/23`; `3` non-residue ⇒ `+4`, `4` residue ⇒ `−4`; `Hom⁰` is a `G_K`-line with `±1` action | ok | none |
| GT.5/ribet-cocycle | `μ₁ = [2], μ_σ = id`; twist family | `c(σ,σ) = 1/2`, `c(1,σ) = 2`; `c ≡ 1`; `c² = ∂(deg μ)` | ok | none |
| GT.5/tate-vanishing-qbar | trivial vs natural action; real place | `ℚ̄ˣ = μ_∞ ⊕ (uniquely divisible)`; natural action gives `Br(ℚ) ≠ 0`; `H²(G_ℝ, ℚ/ℤ) = (ℚ/ℤ)/2 = 0` | true; ownership | R06 |
| GT.5/lie-free-rank-one | equivariance on `C_σ`, `h = (gσ)⁻¹` | `λ_g ι = c(g,σ)·ʰμ_{gσ} = ι λ_g` | ok | none |
| GT.5/ribet-theorem-6-1, `ribetTheorem61` | rational model; cubic twist; 169 | `E_α = ℚ`, `A = C`; `E_α = ℚ(ζ₃)`, `dim 2`; `E_α = ℚ(√3)`, `K = ℚ(√13)` (ribet92 lines 708–743) | ok | none |
| GT.5/quadratic-q-curves | `θ(σ)`; imaginary `K`; Koike | `m/|m|`; `m = γγ̄ > 0`; `E = ℚ(√3)`, `K = ℚ(√−3)`, level 81 (ribet92 lines 703–707) | ok | none |
| GT.6/twisting-lemma | `S₃ × C₃`; reducible control | trace `2ζ₃` separates `η` from `η⁻¹`; `Hom_H` two-dimensional | ok | none |
| GT.6/q-curve-automorphy | tower steps; FLHS rationality | irreducible on `G_K` ⇒ on each `G_{K_i} ⊇ G_K`; eigenvalues `a_v(C) ∈ ℤ` | ok; Check 2 | R08 |
| GT.6/quadratic-q-curves-modular | square `m` | `Res C₀ ~ E × E^χ`, `E ≁ E^χ` (non-CM), so `J₀(lcm)` surjects; CM included by cn23 lines 57–60 | ok | none |
| Lean `IsSimpleOverQ` | `B = A`, `f = id`; `B = 0` | surjective; `dim 0`; zero variety excluded by `dim ≠ 0` | ok | none |
| Lean `IsGeometricQCurve` | `σ = 1` | base change is an isomorphism, isogeny exists | ok | none |
| Conventions, split multiplicative place | Tate curve `0 → ℤ_ℓ(1) → T → ℤ_ℓ → 0` | invariants eigenvalue `q`, coinvariants `1`, factor `1 − T` | ok | none |

**Library declarations opened at the pins** (Mathlib `6b7abb3`, Tau Ceti `a91d3aa`): `AbelianVariety.baseChange` (`TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean` 281), `Hom.baseChange` (`Hom/BaseChange.lean` 57), `End.baseChange` (`End/BaseChange.lean` 74), `prod` and `hasFiniteProducts` (`Product.lean` 61, 232), `IsIsogeny` (`Isogeny.lean` 61), `finrank_tangentSpace_eq_dim` (`TangentSpace.lean` 193), `ofDiscreteModule` (`ContCohomology/SmoothDiscrete/Basic.lean` 236), `subsingleton_continuousCohomology_of_module_rat` (`ContCohomology/Torsion.lean` 124, namespace `TauCeti.ContinuousCohomology`), `Z2` (`LowDegree.lean` 472), `explicitInfl2` (`Inflation/Basic.lean` 389), `explicitH2IsoContinuousCohomology` (`CohomologyComparison.lean` 414), `explicitIso_coeffMap2` (`ComparisonDegreeTwo.lean` 86), `explicitIso_infl2` (`Inflation/Comparison.lean` 148), `HeckeRing.GL2.Newform` (`Newforms/Newform.lean` 104), `Newform.eq_of_forall_notMem_eigenvalue_eq` (`StrongMultiplicityOne.lean` 120), `TauCeti.CoefficientField` (`Newforms/Fields.lean` 48), `cuspFormCharSpace` (`DiamondOperators.lean` 279), `isInternal_cuspFormCharSpace` (`CharacterDecomp.lean` 154), `CuspForm.hasEntireExtension_qExpansion_coeff` (`LFunction/Basic.lean` 137), `TauCeti.Isogeny` (`EllipticCurve/Isogeny/Basic.lean` 139), `Isogeny.map` (`Isogeny/BaseChange/Basic.lean` 212), `quadraticTwistOf` (`QuadraticTwist/Basic.lean` 169); Mathlib `continuousCohomology` (`ContCohomology/Basic.lean` 131), `TopRep` (`Continuous/TopRep.lean` 31), `Field.absoluteGaloisGroup` (`AbsoluteGaloisGroup.lean` 42), `NumberField.IsCMField` (`CMField.lean` 69, totally complex quadratic over the maximal real subfield), `IsTotallyReal` (`TotallyRealComplex.lean` 47), `cyclotomicCharacter` (`CyclotomicCharacter.lean` 307), `Gamma1` (`CongruenceSubgroups.lean` 131), `exists_algEquiv_pi_matrix_divisionRing` (`WedderburnArtin.lean` 190), `algebraMap_end_bijective_of_isAlgClosed` (`AlgebraRepresentation/Basic.lean` 28), `bijective_or_eq_zero` (`SimpleModule/Basic.lean` 499), `finrank_dvd_finrank_right` (`Dimension/Free.lean` 77), `traceForm_nondegenerate` (`Trace/Basic.lean` 501), `exists_variableChange_of_j_eq` (`IsomOfJ.lean` 331), `WeierstrassCurve.IsElliptic` (`Weierstrass.lean`). No Tate module of an abelian variety, modular curve, Jacobian or conductor exists at the pin (only elliptic `TateModule` files), so the docstring's non-statable list is correct.

**Cross-roadmap citations resolved** (open heads via `roadmaps show`, main via the content checkout): SmallRamificationAndAbelianVarietyBaseCases §5.1 `GL2TypeAction` (line 2127) and §6.1 Fontaine row (lines 2585, 2597); ArithmeticGaloisRepresentations §§1.5, 1.7, 1.8, 3.1–3.6, 4.1, 5.3, 6.1–6.4 ("Endomorphism coefficients" line 3976, `TateModule.residualRep` 3733, `TateModule.lambdaTateModule` 3981, anchor `#elliptic-residual-representation` to its line 3730), 7.6 (4508, "Projective lifting" 4619); AbelianSchemesAndArithmeticModuli A1.6, A2.5, A3.3, A3.4, A3.9, A5.1–A5.7, A6.2–A6.4, A6.8, A6.11, A6.12, A6.14, A6.22, A6.26, A6.30–A6.34 (Weil restriction and its product decomposition at A6.30–A6.31); PELModuli M0.1–M0.2 (431, 494); NeronModels §§5.0b, 5.1, 5.4–5.7, 6.10; FiniteFlatGroups R07.1.19, R07.4.19, R07.6.1, R07.P7.3; FaltingsFiniteness R28.4.5–R28.4.7, R28.6.2–R28.6.4, R28.6.7; AlgebraicModularFormsAndSerreWeights R15.4 = Layer 4 and R15.6 = Layer 7 by its own line 18 (the worker's lead "no R15.4" is a false positive), §4.9 weight-two criterion, §7.5; ClassicalSerreModularity R27.6 (line 915, full classical Serre theorem 919); EllipticCurveModularity R29.1–R29.6 (509–1605); ModularCurvesPartII §§13.1–13.3 (`jacobianNorm`, `jacobianNorm_pull` at 3265–3266), 16.1–16.7, 17.3; AutomorphicGaloisRepresentations §§1.5, 3.11, 4.4–4.9, 6.1–6.4, 7.3; AutomorphicGaloisRepresentationsPartII AG2.P (278); GL2AutomorphicRepresentationsAndTransfer R17.4.3–R17.4.9, R17.6.17–R17.6.18; on main: ModularForms Layers 3–8 and 8G, JacobianChallenge Layers E and F, ProfiniteCohomology Layer 10, Chebotarev Layer 10, ClassFieldTheory Layers 11–12, GlobalNumberFields Layers 9–10, EllipticCurves Layers 1, 3, 4 and 4.5a (`IsSemistable`), RepresentationTheory/SemisimpleAlgebras Layers 1–3. Drift is confined to R02, R03 and R07.

**Ownership.** `roadmaps grep` for GL₂-type and ℚ-curves over the 434 open heads and main: SmallRamification §5.1 owns only the `GL₂(E)`-type bundle (imported here); HeegnerPointEulerSystems uses `A_g` as data; AbelianSurfacesModularity (#1746) and SatoTateGroups (#1725) are consumers citing GT.1, GT.3 and GT.5; EffectiveDiophantineMethods' "Q-curves" are modular curves, unrelated; EllipticCurveModularityPartII (#1491) and EllipticCurveModularityImaginaryQuadratic mention neither notion. This roadmap is the owner of Ribet's Theorems 2.1, 4.4, 6.1 and §7 and of the ℚ-curve modularity targets. Tate's vanishing is owned by ArithmeticGaloisRepresentations §7.6 (R06).

**Sources, seeded sample of 15 targets** (the worker's sample found no headings; I sampled across layers), each read at its locator: GT.1/ribet-theorem-2-1 (ribet92 lines 100–131, Theorem 2.1 p. 3 with `D = E`, `X ≈ M(n,F)`, `t = 1`); GT.1/totally-real-or-cm (lines 156–159, 234–237); GT.2/determinant-character (Lemma 3.1, lines 177–206); GT.2/odd (Lemma 3.2, 207–221); GT.2/absolute-irreducibility (Prop 3.3, 222–230); GT.2/coefficient-conjugation (Prop 3.4, 238–257); GT.2/inner-twist-field (Prop 3.6, 277–284); GT.2/residual-irreducibility (Lemma 3.7, 295–299; the integral model at 285–294); GT.3/serre-witnesses (Lemmas 4.1–4.2, 314–332); GT.3/modularity-theorem (Theorem 4.4, 336–360; kw1 Corollary 10.2 line 923, definition lines 914–921); GT.4/exact-level and conductor (kw1 line 921 `Mⁿ`; carayol86 Théorème (A) lines 86–92 printed p. 410, Corollaire lines 102–104 printed p. 411, §0.6 lines 77–84); GT.4/strict-compatibility (kw1 lines 298–326); GT.5/tate-vanishing-qbar (Theorem 6.3, ribet92 lines 535–549, trivial action stated); GT.5/restriction-of-scalars and lie-free-rank-one (Lemma 6.4 596–600, Prop 6.5 624–627, Cor 6.6 628–632); GT.5/quadratic-q-curves (§7 lines 645–743, Lemma 7.1 674–682, Prop 7.2 685–697); GT.6/twisting-lemma (proof of Theorem 5.3, lines 415–417); GT.5/q-curve and GT.6/quadratic-q-curves-modular (cn23 §1 lines 57–60 definition with the CM clause, line 313; Corollary 7.2.5 lines 4987–4995, Corollary 7.3.4 lines 5052–5065; flhs15 §12 lines 838–845 p. 18, Lemma 12.1 lines 851–888 p. 19, §1 lines 66–77 pp. 2–3); GT.4/parent-compatibility (ddt Propositions 2.11–2.12 lines 2132–2164 p. 57, §1.1 lines 680–697 pp. 18–19). All page numbers match the versions named in the References; the OCR of ribet92 drops overbars, which I reconstructed from the surrounding identities.

## Not verifiable

- Diamond–Shurman, *A First Course in Modular Forms*, §5.10 (README line 1059): Springer textbook, not fetchable legally; cited only for the standard two-form functional equation, which I checked by the computation in the table instead.
- Ribet 1980, Math. Ann. 253, Cor. 4.2 (line 387): paywalled; parenthetical, the README gives its own argument.
- Serre's "Théorème 5" (line 914): no paper named; presumably Duke 1987, paywalled.
- Shimura 1971 and Faltings–Wüstholz as "[26, Th. 1]" and "[6, Theorem 1, p. 204]" (lines 1342, 627): cited by Ribet's bibliography numbers, not fetched; both are remarks, not proof inputs.

## Source issues

- none

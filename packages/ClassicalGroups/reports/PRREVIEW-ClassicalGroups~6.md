# Review of ClassicalGroups (pull request #1192 at d7f7648)
Folder: `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/`

**Verdict:** needs changes

Eight findings: four P2 and four P3. The head is the one the previous review read (no change in the folder since review 5), so this is a full re-review of the same content with every check redone from scratch: the gate and dependency check were rerun, all 21 acceptance signatures re-elaborated with `#check`, every admitted theorem re-probed with one tactic, every seeded locator reread in the cached texts, every library name reopened at the pins, and every value in the adversarial table recomputed by exact arithmetic. The folder's files are named below by basename; library paths are those of the manifest pins.

## R01 (P2) — The LR supplier gap cannot be declared by this pull request

**Location:** `README.md:231`, "What SchurWeyl must provide (gap:skew-tableau-lr-product)"; `README.md:23`, "stated explicitly below as a supplier gap"; `README.md:997`, "*Needs:* the supplier gap's finite tableau/product bijection"; `README.md:1057`.

**Claim:** Layer 4's general Littlewood–Richardson multiplicity theorem is supplied by a declared extension contract on SchurWeyl Layer 7.

**Witness:** `packages/ClassicalGroups/` has no `design/plan.json`, so no gap is registered. SchurWeyl on main (`TauCetiRoadmap/RepresentationTheory/SchurWeyl/README.md:323–351`) has Schur polynomials, Frobenius and RSK but no skew tableaux and no LR rule; those exist only in SchurWeyl's open revision (§7.2 at its head), which is a revision of a main roadmap and so is never a dependency. A pull request revising a main roadmap has no design stage and cannot add a declared gap.

**Repair:** Delete the gap paragraph and the three sentences that consume it. Restate §4.1 as what this roadmap can prove alone: the multiplicity of the Weyl module of weight ν in the tensor product of the Weyl modules of λ and μ equals the coefficient of the Schur polynomial of ν in the expansion of the product of those of λ and μ in n variables, by §4.2, linear independence of the Schur polynomials and complete reducibility. The tableau formula for that coefficient stays with SchurWeyl's symmetric-function theory and is not cited here. At (2,3) the instance is 25 = 19 + 6 for s₍₁₎², and in one variable at 2 it is 4 = 4 + 0; the horizontal-strip case keeps `TauCeti.hsymm_mul_diagramSchurPoly` (`Pieri.lean:231`), which the U(3) example alone needs.

## R02 (P2) — Four new programmes extend the base roadmap in place

**Location:** `README.md:330` (Layer 0A), `README.md:473` (Layer 2A), `README.md:1815` (the ordinary Kan-extension programme), `README.md:1894` (mixed symmetric tensors), `README.md:2042` (the U(3) Pieri computation).

**Claim:** The native-coordinate/monoid comparison, the Schur functor on all linear maps with its column injection, the pointwise Kan extension of endomorphism-monoid functors, the mixed contraction/Fischer decomposition and the U(3) symmetric-square Pieri decomposition belong in this roadmap.

**Witness:** The base on main (`README.md:173–374` there) plans Layers 0–6 only; none of these five programmes is a target there, none is consumed by any layer of the base, and no roadmap on main or in the open pull requests asks ClassicalGroups for them (`roadmaps grep` for "all linear maps", "Kan extension" with endomorphism monoids, the mixed contraction and the Pieri decomposition finds no consumer). The principle that an existing roadmap is built on, never re-planned, puts extensions in a Part II. By contrast Layer 6A is requested: TensorProductCombinatorics (open, new folder) declares `gap:diagonal-overgroups` and `gap:diagonal-overgroup-restrictions` with supplier ClassicalGroups (`TauCetiRoadmap/TensorProductCombinatorics/README.md:339–350` at its head), and Layers 3A, 6B and §6.7 fill the base's own §3.5 and Layer 6 SO/Sp/Spin targets. Those stay.

**Repair:** Keep Layers 0–6, 3A, 6A and 6B here, with the base corrections. Move Layers 0A and 2A and the three worked-example programmes, with their Checks and acceptance signatures, into a continuation roadmap whose introduction says where this one stops; the existing ClassicalGroupsPartII is the GSp similitude roadmap (`TauCetiRoadmap/ClassicalGroupsPartII/README.md:28–40` at its head), so the continuation needs its own name and a Scope sentence here deferring to it. Preserve in the move the discriminating instances: the empty-shape functor sends the zero map to the identity of ℂ (value 1) while shape (1) sends it to 0; Δ(x₁²y₁³) = 6x₁y₁², not x₁y₁²; at a = b = 1 the Pieri sum is 24 + 15 + 6 + 3 = 48 = 6·8.

## R03 (P2) — `PolynomialMonoidExtensionTargets.lean` restates ReductiveGroups §10D

**Location:** `PolynomialMonoidExtensionTargets.lean:24–35`, "∃ Φ : Representation ℂ (Matrix (Fin N) (Fin N) ℂ) W, … ∃ P … LinearMap.toMatrix b b (Φ A) i j = MvPolynomial.eval …".

**Claim:** The companion is an acceptance signature for Layer 0A's comparison of the native polynomial predicate with the supplied monoid action.

**Witness:** `TauCetiRoadmap/ReductiveGroups/README.md:1850–1872` (§10D, main) owns the unique polynomial extension of a GL(V)-module to End(V) with its unit, multiplication and coefficient factorisation. The companion's theorem is exactly that existence statement specialised to ℂ and `TauCeti.IsPolynomialRep` (`Rational.lean:118`); it mentions no supplied action and no comparison map, so it tests the supplier's theorem, not the comparison. The module docstring of `Suggested.lean:36–39` already says the comparison is not statable.

**Repair:** Delete the file. The README's Layer 0A comparison targets keep their statement; the docstring's explanation stays. At N = 1 and weight 2 both presentations send 2 to 4 and 0 to 0, and degree 0 sends 0 to 1: existence alone distinguishes neither presentation from the other.

## R04 (P2) — The five companion files break the Lean form rules, including a `set_option`

**Location:** `U3PieriTargets.lean:11`, "set_option autoImplicit false"; the import blocks of `AntidiagonalTargets.lean:1–4`, `EndomorphismKanExtension.lean:1–3`, `MixedSymmetricContractionTargets.lean:1–3`, `PolynomialMonoidExtensionTargets.lean:2`, `U3PieriTargets.lean:3–4`; `EndomorphismKanExtension.lean:48–66`.

**Claim:** The companion files are acceptance signatures in the required form.

**Witness:** The form rules apply to every `.lean` file in the folder and a `set_option` of any kind is blocking; the gate counts `set_option` and submodule imports only in `Suggested.lean`, so it reports 0 while U3 has the option and all five files import `Mathlib.*` submodules. `EndomorphismKanExtension.lean` has no declaration docstrings, and `unit_isIso` is one library lemma (`IsPointwiseLeftKanExtension.isIso_hom`, `Mathlib/CategoryTheory/Functor/KanExtension/Pointwise.lean`), `restrictionIso_hom` is `rfl` and `colimitModel` is `Iso.refl _`: padding. The README refers to these files as "prototypes" and "illustrated in" (`README.md:785, 1827, 2037, 2090`).

**Repair:** Delete the five companions and the README sentences naming them. Each headline among them that is statable at the pins is stated in the acceptance file of the roadmap that owns it after R02 (the U(3) multiplicity theorem and the mixed-contraction surjectivity are statable with `import Mathlib` plus the Tau Ceti modules U3 already imports); the antidiagonal adjoint identities and the Kan unit isomorphisms are Checks and native facts, not headlines. Keep the instances: Δ(x₁²y₁³) = 6x₁y₁²; for (a,b) = (0,0) the Hom dimension is 1 at μ = (2,0,0) and 0 at (1,1,0); diag(2,3) fails both antidiagonal tests with values 6I and 6J.

## R05 (P3) — Unused or over-strong hypotheses in three acceptance theorems

**Location:** `Suggested.lean:161`, "(hn : 2 ≤ n)"; `Suggested.lean:189`, "(hρ : TauCeti.IsRationalRep ρ)"; `Suggested.lean:198`, "(hρ …) (hσ …)"; `MixedSymmetricContractionTargets.lean:35`, "(hN : 2 ≤ N)".

**Claim:** Each hypothesis is needed for the statement.

**Witness:** For n = 1 the closed connected complex subgroups of ℂˣ × ℂˣ containing the diagonal are the diagonal and the whole group, and the README says so (`README.md:1721–1722`); for n = 0 all four groups are trivial, so the disjunction holds without `hn`. Restriction of any finite-dimensional irreducible complex GLₙ-module to SLₙ is irreducible: ρ(λI) is central, hence a scalar by Schur, and GLₙ is generated by SLₙ and scalars; likewise the external product of two such irreducibles is irreducible on SLₙ × SLₙ ⊆ H_det. Rationality enters neither proof. For N = 1, Δ(r·x^a y^b) = (a+1)(b+1)x^a y^b ≠ 0, so the contraction is onto for N = 1 too; only N = 0 fails.

**Repair:** Drop `hn` and the rationality hypotheses, or keep them and say in the docstrings that they match the README's scope rather than the statement's truth; state the contraction for N ≥ 1.

## R06 (P3) — LieHighestWeight Layer 9 is both a consumer and a proof input

**Location:** `README.md:29`, "its Layer 9 owns the GL differentiation application"; `README.md:2138`, "LieHighestWeight Layer 9 uses the GL models"; `README.md:1225`, "using LieHighestWeight Layer9's GL dictionary".

**Claim:** Layer 9 is downstream of this roadmap.

**Witness:** `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:1437–1441` (main) consumes ClassicalGroups Layers 2–4 for its differentiation bridge, so it is downstream of Layers 2–4; but §6.4 here uses its GL dictionary to normalise the GT vectors, and §6.4's *Needs:* line omits it. No target-level cycle results (Layer 6 is above Layers 2–4), but the README contradicts itself about the direction.

**Repair:** Either list "LieHighestWeight Layer 9 (differentiation dictionary)" in §6.4's *Needs:* and say in Scope that Layer 9 consumes Layers 2–4 and supplies Layer 6, or construct the differentiated action of §6.4 here (the §3A.2 differentiation already covers it) and drop the Layer 9 reference. The same precision applies to SpinRepresentations, which consumes Layer 0's standard module (`SpinRepresentations/README.md:48`) and is consumed by §6.2: say in Scope that the two directions are at different layers.

## R07 (P3) — Unnamed and missing source locators in the added sections

**Location:** `README.md:519`, "the column/exterior model in the notes"; Layers 2A and 6A, the Kan-extension, mixed-contraction and U(3) sections (no locator at any claim).

**Claim:** Every theorem has a locator into a legal source.

**Witness:** "the notes" names no work and the References list none; Layer 6A's four-group classification, Layer 2A's column injection and image, the Fischer decomposition and the Pieri decomposition carry no citation. The only works cited are Molev, Fulton–Harris, Macdonald and Milne, none of which is cited for these sections.

**Repair:** Name the source for the column model and cite one for each of these results where they land after R02; where a result is the roadmap's own derivation (the Fischer telescoping, the U(3) enumeration), say so at the claim.

## R08 (P3) — Spacing and casing glitches

**Location:** `README.md:495, 504, 513, 518, 537, 674, 758–774, 1038, 1211, 1225, 1240–1241, 1477–1479, 1537, 1681, 1696–1699, 1747–1767, 1844, 2001–2087` (forty instances such as "Layer0A", "dimension2r", "Theorems2.3/2.7", "dimensions24,15,6,3", "total48"); "SAME" in capitals at four places.

**Claim:** House style.

**Witness:** `grep -c` of a letter immediately followed by a digit in these forms returns 40.

**Repair:** Insert the spaces and lower-case the emphasis.

## Previous findings

- R01 — not repaired: `README.md:231` still declares `gap:skew-tableau-lr-product` with no plan entry; this review finds the gap mechanism unavailable to a revision pull request at all (R01 above).
- R02 — not repaired: Layers 0A/2A and the three worked-example programmes are unchanged; this review narrows the finding, since Layer 6A is a gap TensorProductCombinatorics declares on ClassicalGroups (R02 above).
- R03 — not repaired: `PolynomialMonoidExtensionTargets.lean:24–35` unchanged (R03 above).
- R04 — not repaired: all five import blocks and `U3PieriTargets.lean:11` unchanged; raised to P2 here because a `set_option` is blocking under the review principles (R04 above).
- R05 — not repaired: `EndomorphismKanExtension.lean:48–66` unchanged; folded into R04.
- R06 — dropped, reason wrong: a `sources.toml` inside the roadmap folder would be a stray file (the gate's `stray-files` rule says sources are the README's references); the manifest lives board-side and is not editable in this review. The References section is complete for the works the base cites.
- R07 — repaired at the previous head and verified again: the §6.6 Checks compute A₁(u) = u − 1, A₂(u) = u² + 2u for (2,1) against (u+2)(u+1) = u² + 3u + 2 unshifted, and A₂(u ± 1) for the shifts.

## Verified sound

### Mechanical checks

The gate rerun on this head returned every counter zero: `gate ClassicalGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The dependency check returned exactly:

```text
depcheck: 204 roadmaps, 1659 edges, 0 problem(s)
```

with no UPWARD, CYCLE or moved line. The prescribed outside-folder diff is empty; the family index files under `TauCetiRoadmap/RepresentationTheory/` are byte-identical to main. Main's copy of the folder has not changed since the branch point. The manifest pins (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`) match both checkouts.

`lake env lean` on `Suggested.lean` exits 0 with exactly ten `declaration uses 'sorry'` warnings (lines 54, 63, 68, 76, 85, 93, 161, 179, 188, 195) and nothing else. A scratch copy with `#check @name` for all 21 declarations elaborated; every type carries its binders: `[FiniteDimensional ℂ W]` and `TauCeti.IsRationalRep ρ` on `rationalRep_isSemisimple`, `[Simple W]` on the classification, `μ.colLen 0 ≤ n` on the Schur isomorphism, `2 ≤ n`, `IsClosed`, `IsPreconnected` and the complex-direction law on the overgroup theorem, the scalar central-character law on the order isomorphism, `[FiniteDimensional]` and `[IsIrreducible]` on the two restriction theorems. Nothing changed and no binder repair was needed; the comparison with the README statements is in the table below. The one-tactic probe (`first | rfl | simp | infer_instance | exact?` in place of each `sorry`) closed none of the ten admitted theorems. The five companions elaborate (four sorry warnings in total, none in the Kan file).

### Sources at the seeded sample

Cache ids and page keys: Molev `0bc32869` (printed page = marker − 2), Milne `f2ddd8fa` (printed = marker − 11), Macdonald `64e242b8` (printed = marker − 11), Fulton–Harris `9324d360` (institutional two-page scan, ends inside Lecture 20). All fetches were from the existing cache; no manifest was touched.

| Target | Text at the locator and what it supports |
| --- | --- |
| 0.2 | Milne §2.10, printed pp. 42–43 (`milne line 2068`–2118): stabilisers of a bilinear form by AᵀCA = C, the orthogonal family with char ≠ 2 and the symplectic family. The volume statement is derived here from det = 1, as the README says. |
| 0.3 | Milne §2.8, p. 41 (`line 2019`–2032): O(GLₙ) = k[Tᵢⱼ, 1/det] with matrix comultiplication; Remark 4.1 and Example 4.2, pp. 84–85 (`line 3746`–3795): representations ↔ comodules via coefficient families, with the standard coaction eⱼ ↦ Σ eᵢ ⊗ Tᵢⱼ. Supports the dictionary; polynomiality of powers is the multilinear consequence the README states. |
| 0.4 | Milne Theorem 22.42, pp. 478–479 (`line 19859`–19877): over characteristic zero a connected group is reductive iff every finite-dimensional representation is semisimple. GLₙ is connected reductive, so it supports §0.4. |
| 1.1 | Fulton–Harris §1.1, pp. 4–5 (`fulton-harris line 347`–372): definitions, tensor powers and the dual as representations. |
| 1.2, 1.3 | Fulton–Harris (6.1)–(6.2) and Theorem 6.3, pp. 77–78 (`line 1996`–2032): Symᵈ and ⋀ᵈ as the extreme Young images, vanishing when the shape has more rows than dim V, and the Schur-polynomial character. |
| 2.1–2.3 | SchurWeyl Layer 8 on main (`SchurWeyl/README.md:352–377`): commuting actions, image-level double centraliser, decomposition with the image Schur functor; the Tau Ceti image carrier is `schurFunctor` (`WeylModule/Basic.lean:504`, a re-export of `weylFDRepOfShape`). |
| 3.2 | Macdonald Appendix A (8.2), printed p. 162 (`macdonald line 6353`–6376): polynomial irreducibles of GLₘ(k), char k = 0 (`line 5903`), are the R_λ with ℓ(λ) ≤ m. Fulton–Harris §15.5 and Proposition 15.47, pp. 231–232 (`line 5377`–5431): determinant twists, the common-shift relation and unique decreasing labels. |
| 3.3 | Fulton–Harris Theorem 6.3 and Proposition 15.47 as above; the Lean statement adds the native carriers and the rank-zero and rank-one cases the README names. |
| 3.4 | Fulton–Harris §15.5 (`line 5415`–5425): two GL labels restrict to the same SL module iff they differ by a multiple of (1,…,1). |
| 3.5 | No locator is claimed; the section defers to Layer 3A, whose sources (Milne 10.31 p. 196, `line 8168`–8178; Cartier 3.23 p. 71, `line 3211`) were read and say what §3A.2 attributes to them. |
| 4.3 | Macdonald I(3.1) p. 40 and (3.4)–(3.5) p. 41 (`line 1804`–1836); the Laurent form is the determinant twist of Tau Ceti `char_rationalWeylFDRep` (`Rational.lean:214`). |
| 6.3 | Molev Remark 2.2, p. 9 (`molev line 368`–374): patterns of a partition ↔ semistandard tableaux with entries in {1,…,n}, row k recording the shape filled by entries ≤ k. Matches the native `gtPatternEquivSSYT` (`Tableau.lean:54`). |
| 6.5 | Molev Theorem 2.1, p. 8 (`line 315`–319), iterated; Theorem 2.3, p. 9 (`line 377`–400). The source works with glₙ and complex weights with integral differences; the README's transport through §3.3 and determinant shifts is necessary and stated. |
| 6.7 | Molev §4: (4.1) p. 48 (`line 2059`), (4.4) p. 48 (`line 2080`), (4.5)–(4.6) p. 49 (`line 2087`–2101), Theorem 4.1 p. 49 (`line 2110`), the o₂ₙ₋₁ generators (`line 2116`–2117), (4.7)–(4.10) pp. 49–50 (`line 2125`–2148, including the two short-root factors fᵢ, f′ᵢ), Theorem 4.2 p. 51 (`line 2159`), §4.3 p. 51 (`line 2164`–2168), Theorems 4.3–4.4 pp. 51–52 (`line 2186`, `2220`). Every operator, denominator and inequality the README restates is there. |

Also reread for the findings and the Layer 6 claims: Molev (2.21)–(2.22) p. 16 (`line 673`–682); Proposition 2.4 p. 10 (`line 410`); Theorem 2.7 p. 11 (`line 467`–479); the type-C shifts ρᵢ = −i, fᵢ = Fᵢᵢ + ρᵢ, lᵢ = λᵢ + ρᵢ + ½, γᵢ likewise (`line 1258`–1269, `1368`); (3.10)–(3.12) pp. 31–32 (`line 1336`–1358); (3.13), Lemma 3.4 and Theorem 3.5 pp. 33–34 (`line 1436`–1484); Milne Theorem 12.12 pp. 234–235 (`line 9716`–9724); Macdonald I(9.2) p. 143 with the reading word on p. 142 (`line 5673`–5694) and I§3 Examples 1 and 4 pp. 44–45 (`line 1955`–1990). No copied passage was found.

### The adversarial table

Every row was recomputed this round by exact rational arithmetic (a scratch script: Schur polynomials by tableau enumeration, Weyl products, pattern counts, Capelli polynomials, Molev's coefficients, the Hodge star on isotropic wedges by minors, the mixed contraction on 1,725 monomials, and the U(3) characters on all 25 pairs), or by hand where marked.

| Statement | Instances | Values on each side / wrong model | Result |
| --- | --- | --- | --- |
| §0.1 standard, dual | diag(2,3); n = 0 | traces 5 and 1/2 + 1/3 = 5/6; empty module 0, its zeroth power 1 | pass |
| §0.2 invariants | diag(2,1/2) on J; diag(−1,1) on I | AᵀJA = J with det 1; AᵀA = I with det −1 | pass: O preserves the form, not the volume |
| §0.3 coefficients | det⁻¹ at 2; trivial at 0 | 1/2 (pole at 0); 1 | pass |
| §0.3 coaction | A = [[1,2ε],[0,1]], ε² = 0 | both presentations send e₂ to e₂ + 2εe₁ | pass (hand) |
| §0.4 semisimplicity | GL₁ weights ±1; zero module | 2 = 1 + 1; 0 = empty sum | pass |
| 0A extension | N = 1, weights 2, 0 at A = 0, 2 | 0, 4; 1, 1; A ↦ A⁻¹ has no polynomial extension | pass (R03 duplication) |
| §1.1 tensor character | diag(2,3), d = 2; d = 0 | 25 = 5²; 1 | pass |
| §1.2 powers | n = 2, k = 2, 3 | h₂ = 19, e₂ = 6, e₃ = 0 | pass |
| §1.3 splitting | (2,3); one variable 2 | 25 = 19 + 6; 4 = 4 + 0; projector (1 ± swap)/2 needs 2 invertible | pass |
| §2.2 images | shapes (2), (1,1) on ℂ²; (1,1) on ℂ | dimensions 3, 1; 0 | pass |
| §2.3 decomposition | n = 2, d = 3 | 8 = 4·1 + 2·2 + 0 | pass |
| 2A functoriality | shape (2), f = 2 and f + f; zero map | 4 and 16 ≠ 8; empty shape gives 1, shape (1) gives 0 | pass (R02 scope) |
| 2A column injection | (2,1) on ℂ³ | image 8 inside V ⊗ ⋀²V of dimension 9 | pass |
| §3.1 torus | GL₂ standard at diag(2,3); det⁻¹ | 2 + 3 = 5; 1/6 | pass |
| §3.1 differential | (1,−1) at diag(1+2ε,1+3ε) | (1+2ε)(1−3ε) = 1 − ε, derivative −1 = 2 − 3 | pass (hand) |
| §3.2 labels | (1,−1); (0,1); rank 0 | shift −1 with shape (2), value 19/6; not decreasing; dimension 1 | pass |
| §3.3 classification | rank 1 weights −1, 0, 1 at 2 | 1/2, 1, 2 distinct | pass |
| §3.3 Schur iso | (2,1), n = 2; (1,1), n = 1 | dimension 2 = 2; 0 (excluded by colLen ≤ n) | pass |
| §3.4 SL | (2,1), (1,0) at diag(2,1/2) and diag(2,3) | 5/2 = 5/2; 30 ≠ 5 | pass |
| §3.4 control | (1,0), (0,0) | restricted dimensions 2 ≠ 1 | pass |
| §3.5, 3A lattices | SO₃ weight 1; sl₂ weight 1; SO₂ weight −1 at 2 | dimensions 3, 2 (no descent); 1/2 | pass (hand) |
| 3A isotropic basis | u = e₁ + ie₂, v = (e₁ − ie₂)/2 | (u,u) = 0, (v,v) = 0, (u,v) = 1 | pass |
| 3A antidiagonal | diag(2,3); diag(i,1); diag(2,1/2) | A^R = diag(3,2), twice gives A; diag(1,i) not diag(1,−i); AA^R = I and AᵀJA = J, versus 6I, 6J for diag(2,3) | pass |
| 3A.2 fixed spaces | Sp₂ standard; SO₃ root operator; sign character of {±1}; Gₘ tᵖ in char 3 | 0 = 0; 0 = 0 (X skew for the form: B(Xw,v) + B(w,Xv) = 1 − 1 = 0); Lie 1 ≠ group 0; 2³ = 2 ≠ 1 | pass (hand) |
| 3A.3 Hodge | r = 1, 2, 3, 4 on u₁∧…∧u_r and u₁∧…∧u_{r−1}∧v_r | eigenvalues −i, 1, −i, 1 and i, −1, i, −1; κ_r = −i, 1, −i, 1 | pass |
| 3A.3 star square, dim 2 | ★e₁ = e₂, ★e₂ = −e₁ | ★u = −iu, ★v = iv, ★² = −1 | pass |
| 3A.3 primitive | Sp₄ ⋀² | 6 − 1 = 5 | pass |
| §4.1 products | s₍₁₎² at (2,3); one variable | 25 = 19 + 6; 4 = 4 + 0 | pass (R01 ownership) |
| §4.2 character | (2,1) at (2,3); tall (1,1) in one variable; empty | 30 = 6·5; 0 = 0; 1 = 1 | pass |
| §4.3 Laurent | (1,−1) at (2,3) | 19/6 | pass |
| §5.1 dimension | (), (−1), (2,1), (2,1,0), (1,0,−1), (3,1,0) | 1, 1, 2, 8, 8, 15 = pattern counts 1, 1, 2, 8, 8, 15 | pass |
| §6.1 branching | (2,1,0) → GL₂; (1,−1) → GL₁ | (1,0),(1,1),(2,0),(2,1) of dimensions 2+1+3+2 = 8; −1, 0, 1 with trace 7/2 | pass |
| §6.1 carrier | `Interlaces l m` (`GelfandTsetlin/Basic.lean:265`); `blockSucc` (`BlockSucc.lean:57`) | λ_{i+1} ≤ μ_i ≤ λ_i; upper-left block, e_{n+1} fixed | matches README |
| §6.2 orthogonal | SO₃ 1 → SO₂; SO₄ (1,0) → SO₃; SO₅ → SO₃ fixing two; Sp₄ → Sp₂ | −1, 0, 1 (trace 7/2); 3 + 1 = 4; 5 = 3 + 1 + 1; 4 = 2 + 1 + 1 | pass |
| §6.2 embedding | q = (u+v)/√2, w′ = i(u−v)/√2 | B(q,q) = 1, B(w′,w′) = 1, B(q,w′) = 0; (F_{ni} − F_{n′i})/√2 kills e_n + e_{n′} and sends e_i to −iw′, so the native generator is i times Molev's | pass (hand) |
| §6.4 coefficients | top (2,1,0), middle (2,0) ↔ (2,1), bottom 1 | E₂₃ coefficient 1, E₃₂ coefficient 1/2, product 1/2 | pass |
| §6.4 invalid move / shift | raise middle 2 to 3; all rows +1 | 0; off-diagonal unchanged, Eᵢᵢ + 1 | pass (hand) |
| §6.6 Capelli | (−1); (2,1); shifts ±1; rank 0 | u − 1; u² + 2u (unshifted u² + 3u + 2); u² + 4u + 3 = A₂(u+1), u² − 1 = A₂(u−1); 0 generators | pass |
| §6.7 SO₃ | basis (u,w,v), F₂₁ = E₂₁ − E₂₃, F₁₂ = E₁₂ − E₂₃ (antidiagonal indices) | F₂₁: u → w → −v → 0; F₁₂ on (u, w, −v): 0, u, w; F₁₁ diagonal (1,0,−1), trace 0; torus trace 7/2 | pass (hand) |
| 6B dictionary | (3.13) under a_j = −λ_{r+1−j}, b_j = −ν_{r+1−j} | a₁ ≥ b₁ ≥ ⋯ ≥ a_r ≥ b_r ≥ 0 and b_i ≥ a_i^{(r−1)} ≥ b_{i+1} | matches README (hand) |
| 6B interpolation | λ = (0,−1): g = (−1/2, −5/2) | coefficients (0,1) at −5/2, (1,0) at −1/2; without the half shift (11/32, 21/32); square differences −2 for (0,0), −6 for (0,−1) | pass |
| 6B multiplicity | Sp₄ standard | 1 + 1 + 2 = 4 | pass |
| 6A subgroups | T = I + E₁₂, D = diag(2,1) | (T,T) ∈ Δ, (T,I) ∉ Δ; r(D,I) = 2, r(I,D) = 1/2; (T,I) ∈ H_det, (2I,I) ∉; (2I,I) ∈ H_sc, (T,I) ∉ | pass (hand) |
| 6A dimensions | n = 2; n = 1; n = 0 | 4, 5, 7, 8; H_det = Δ, H_sc = P; all trivial | pass |
| 6A normal kernel | a = I, h = D, b = T | DTD⁻¹ = I + 2E₁₂ ≠ T: semidirect, not direct | pass (hand) |
| 6A directions | H = Δ, H_det, r⁻¹(S¹) | (N,N) ∈, (N,0) ∉; (N,0) ∈, (I,0) ∉ (ratio e²); (iI,0) ∈ but (−I,0) ∉ (ratio e⁻²) | pass (hand) |
| 6A restriction | weights −1, 2 at (3,2); scalar image of (3,2) | 3⁻¹·2² = 4/3 versus 3 on the diagonal; (6,3) acts by 3/2 = 2⁻¹·3 | pass |
| Kan coend | X = ℂ, F(a) = a², f = 3, a = 2, w = 1 | [6,1] = [3,4], both evaluate to 36; [2,1] gives 4 ≠ [1,1] + [1,1] = 2 | pass (hand) |
| Mixed operators | x₁²y₁³; x₁y₂; x₁y₁; r | Δ = 6x₁y₁², 0, 1; Δr = N | pass |
| Mixed right inverse | N = 2, a = b = 1, f = x₁y₁ | S(f) = (5/24)x₁²y₁² + (1/6)x₁x₂y₁y₂ − (1/24)x₂²y₂² = rf/4 − r²/24; ΔS(f) = f | pass |
| Mixed identities | N = 2, 3, 4; a, b ≤ 3 | ΔS(f) = f and [Δ,r]f = (N+a+b)f on all 1,725 monomials | pass |
| Mixed dimensions | N = 3: (1,1), (2,1), (3,2), (0,2) | 8, 15, 42, 6 = Weyl products | pass |
| U(3) multiplicities | (1,1) at 0; (2,1) at (0,0,1); (3,2) at (0,0,1) | P: 3, 3, 6 = C(L+2,2); H: 2, 2, 3 = L + 1 | pass |
| U(3) Pieri | all (a,b) with a, b ≤ 4 | character of H_{a,b} ⊗ Sym² equals the sum of the guarded six on every weight; sums 6, 48, 252 for (0,0), (1,1), (3,2) | pass |
| Suggested `rationalWeyl_branching` | direct sum over interlacing subtype | (2,1,0): four summands, 8 = 8 | matches §6.1 |
| Suggested `connected_complex_overgroup` | n = 0, 1 | conclusion holds without `2 ≤ n` | R05 |
| Suggested restriction theorems | any finite-dimensional irreducible over ℂ | irreducible on SL and on H_det without rationality | R05 |
| Suggested `scalarRestriction_exists_orderIso` | n = 0 | hypothesis forces a = 0; lattices coincide trivially | pass |

### Library declarations and ownership at the pins

Every file-and-line the README quotes was opened at Tau Ceti `a91d3aaf`: `IsRationalRep.isInternal_weightSpace` (`Weight/Decomposition.lean:233`), `char_tensorPowerRep` (`TensorPower.lean:198`), `char_extPowerRep_diagonal` (`ExteriorPower.lean:138`), `GTPattern.card_topRow_eq_weylDimension` (`GelfandTsetlin/Dimension.lean:187`), `weylModuleOfShape_eq_bot_iff` (`WeylModule/Basic.lean:472`), `tensorSquareRepEquiv` (`Decomposition.lean:49`), the one-row and one-column characters (`WeylModule/Character.lean:94, 133`), the Specht-character sum (`WeylModule/SchurWeyl.lean:162`), `char_rationalWeylFDRep` (`WeylModule/Rational.lean:214`), `eval_one_diagramSchurPoly_eq_card_boundedSSYT` (`Schur/Basic.lean:214`), `card_gtPattern_topRow_eq_card_ssyt` (`GelfandTsetlin/Tableau.lean:453`), `weylDimension_shift` (`WeylDimension/Basic.lean:256`), `hsymm_mul_diagramSchurPoly` (`Schur/Pieri.lean:231`), `rhoShift` and `rhoShift_strictAnti` (`WeylDimension/Basic.lean:81, 90`), `IsPolynomialRep` and `IsRationalRep` (`Rational.lean:118, 139`). Also found: `DominantWeight` (`DominantWeight.lean:87`, antitone `Fin n → ℤ`), `weylDimension` (`WeylDimension/Basic.lean:182`, the product over i < j), `diagramSchurPoly` (`Schur/Basic.lean:174`, sum over bounded tableaux, so it vanishes for tall shapes), `rationalWeylFDRep` (`WeylModule/Rational.lean:172`), `schurFunctor` (`WeylModule/Basic.lean:504`), `diagGL` (`GeneralLinearGroup/Diagonal/Basic.lean:100`), `diagonalTorus` (same file, 166), `weightSpace` (`Weight/Basic.lean:110`), `glBlockSucc` (`GeneralLinearGroup/BlockSucc.lean:55`), `expUnit` (`Exponential/Units/Basic.lean:59`), `normedAlgebraRatOfReal` (`Analysis/Normed/Algebra/Basic.lean:23`), `slIdeal_le_or_le_center` (`Lie/GeneralLinear/Radical.lean`), `isCompl_center_derivedSeries_one_matrix` (`Lie/GeneralLinear/Restriction.lean`), `gtPatternEquivSSYT`, `BoundedSSYT.fiberEquiv`, `rationalWeylSLRep`, `symPowerFDRep`, `PiTensorProduct.reindexRepresentation` and `youngSymmetrizerOver` (Tau Ceti, not Mathlib, as the README's "native" allows), and the `GeneralLinear.UpperTriangular` and `SpecialLinear.UpperTriangular` namespaces.

At Mathlib `6b7abb3c`: `exteriorPower.hodgeStar` (`HodgeStar.lean:48`) requires a finite free module, a bilinear form with bijective associated map, a volume isomorphism and k + l = finrank, and `exteriorPower_hodgeStar_eq_wedgePairing` (`:53`) reads B_l(★x, y)·vol = x ∧ y; the README's α ∧ ★β = ⟨α,β⟩vol then needs ★ isometric with unit volume, which it lists as a target, not an assumption. `Matrix.symplecticGroup` (`SymplecticGroup.lean:101`) is A·J·Aᵀ = J with J = [[0,−I],[I,0]]; `Matrix.orthogonalGroup` (`UnitaryGroup.lean:293`) uses the trivial star, so `specialOrthogonalGroup (Fin n) ℂ` is the algebraic group, as §3A says. Also found: `Subgroup.goursatFst`/`normal_goursatFst`, `Matrix.ProjGenLinGroup`, `GeneralLinearGroup.center_eq_range_scalar`, `SpecialLinearGroup.toGLKerEquiv` (`Defs.lean:307`), `diagonal_transvection_induction_of_det_ne_zero`, `diagonal_transvection_induction'` (`SpecialLinearGroup.lean:708`), `PiTensorProduct.map_comp_reindex_eq` (`:751`), `SymmetricAlgebra.equivMvPolynomial`, `weightedHomogeneousSubmodule`, `Representation.IntertwiningMap`, `Representation.char_one` (`Character.lean:63`), `Representation.directSum` (`Basic.lean:583`), `Representation.Equiv` (`Intertwining.lean:312`), `GeneralLinearGroup.scalar` and `scalar_commute`, `IsPointwiseLeftKanExtension.isIso_hom`.

Cross-roadmap citations resolved this round: ReductiveGroups Layers 0–3, 3A (`:249`), 5P (`:460`), 6 (`:466`), 7 (`:627`), §10D (`:1850–1872`, which owns the End(V) extension: R03), PGLₙ (two mentions); SchurWeyl Layers 0–2, 7, 8 on main (no LR: R01); LieHighestWeight Layers 2–6 and 9 (`:370`, `:1432`); RootSystems Layers 1–4, 6; SpinRepresentations Layers 2–5 and its "SpinHighestWeights" (`:781`); LieGroups Layers 0–4 with the cited Layer 2 anchor; SemisimpleAlgebras Layers 1 and 3; ClassicalGroupsPartII at its head (GSp similitudes, consumes this roadmap's Sp classification); TensorProductCombinatorics at its head (§2.7, its two diagonal-overgroup gaps on ClassicalGroups and its LR gap on SchurWeyl). PositiveMass's Fischer decomposition (`PositiveMass/README.md:471–483`) is for the Dirac operator on spinor-valued polynomials, a different object from the mixed Δ here. No other roadmap owns the diagonal-overgroup classification, the Capelli generators, the Mickelsson operators or the antidiagonal comparison. Ownership against open pull requests was checked only in the checkouts this brief lists.

### Headline inventory

| README headline | In `Suggested.lean` |
| --- | --- |
| Complete reducibility (§0.4) | `rationalRep_isSemisimple` |
| Unique GL classification and Schur identification (§3.3) | `rational_irreducible_classification`, `schurFunctor_iso_irreducible` |
| Schur characters and Weyl dimension (§§4.2, 5.1) | `schur_character`, `rational_dimension` |
| GL branching (§6.1) | `rationalWeyl_branching` |
| Diagonal overgroups and restrictions (Layer 6A) | `connected_complex_overgroup`, `scalarRestriction_exists_orderIso`, `restrict_specialLinear_irreducible`, `external_determinantEqual_irreducible` |
| SO/Sp classification, characters, branching; GT bases and Capelli; symplectic multiplicities; the group/Lie bridge | named as not statable with the missing carriers (rational SO/Sp models, differentiated actions, Mickelsson operators): correct |
| General LR multiplicities; all-linear-map Schur comparison; Layer 0A comparison | named as not statable; R01 and R02 concern their ownership, not the docstring |
| U(3) Pieri multiplicity; mixed-contraction surjectivity | statable at the pins but kept in companions: R02/R04 say where they go |

No padding was found in `Suggested.lean`.

## Not verifiable

- **Fulton–Harris beyond Lecture 20:** the cached institutional scan ends there; every page the README cites (4–5, 77–78, 231–232) is inside it and was read.
- **Goodman–Wallach, Weyl (1939), Procesi (2007):** broad references with no claim-level locator; no legal readable copy is in the cache and none was sought this round, since no finding depends on them.
- **Universal statements:** the computed rows and the admitted elaborations certify instances and signatures, not proofs of the targets.

## Source issues

- **Misprint** in milne at §2.10(b), printed p. 42 (`milne line 2088`): the source writes the last cross-term of the odd orthogonal form with the same index twice; it should pair xₙ with y₂ₙ and x₂ₙ with yₙ as its Gram matrix does; affects a stated result.
- **Misprint** in milne at §2.10(c), printed p. 42 (`milne line 2096`): the source places the symplectic matrices in GLₙ(R); it should be GL₂ₙ(R), the size of the displayed matrix; affects a stated result.
- **Misprint** in molev at §3 introduction, printed p. 28 (`molev line 1191`): the source describes the multiplicity space by glₙ₋₁-highest vectors; it should say gₙ₋₁-highest vectors for the chosen B/C/D subalgebra; affects a stated result.

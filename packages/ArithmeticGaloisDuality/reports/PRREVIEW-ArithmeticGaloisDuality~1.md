# Review of ArithmeticGaloisDuality (pull request #858 at 1510b10)

**Verdict:** needs changes

Previous AI review: none. The push gate at this head fails on two checks (depcheck: two UPWARD
edges; tex: three lines); every other check passes, and the targeted build and my own elaboration
of `TauCetiRoadmap/ArithmeticGaloisDuality/Suggested.lean` succeed with `sorry` as the only warning.
One finding is blocking (R01, the gate's UPWARD edges). The mathematics was checked target by
target (table under *Verified sound*); I found no false statement, no vacuous statement, no
sorry'd data, no `set_option`, no re-planned roadmap and no computational algorithm.

## R01 (P2) — Gate: two upward supplier citations (AlgebraicCurves, ProfiniteProPGroups)

**Location.** `TauCetiRoadmap/ArithmeticGaloisDuality/README.md` lines 1919, 2456 (“ProfiniteProPGroups
Layer 1”), lines 2101, 2111, 2166 (“AlgebraicCurves Layers 3 and 5”, “AlgebraicCurves Layer 12,
step 12B”), and the Dependencies list at line 2844.

**Claim.** The dependency check reports

```text
UPWARD: ArithmeticGaloisDuality (#47) -> AlgebraicCurves (#255) at README lines [2109, 2166, 2844]
UPWARD: ArithmeticGaloisDuality (#47) -> ProfiniteProPGroups (#274) at README lines [1919, 2458, 2844]
not movable: ArithmeticGaloisDuality consumes ProfiniteProPGroups (#274) and is consumed by ArithmeticKTheory (#98) ...
depcheck: 156 roadmaps, 1084 edges, 2 problem(s)
```

The merge order lists both roadmaps after this one (AlgebraicCurves #256, ProfiniteProPGroups
#275 of ORDER.txt, this roadmap #48), so the gate fails and the brief's rule makes this P2.

**Witness.** What is consumed from the two roadmaps already exists in Tau Ceti at the pin, so the
citations are also supplier drift:

- product formula for a function field: `TauCeti.Divisor.degree_principal`
  (`TauCeti/FieldTheory/FunctionField/Divisor/ProductFormula.lean`, line 258: every principal
  divisor has degree zero, for `IsFunctionField k F`);
- finiteness of the degree-zero class group over a finite constant field:
  `TauCeti.Divisor.finite_ker_degreeClass`, and of the ideal class group of any affine model:
  `TauCeti.Divisor.finite_classGroup_of_finite`
  (`TauCeti/FieldTheory/FunctionField/RiemannRoch/AffineClassNumber.lean`, line 107);
- supernatural orders of profinite groups: `TauCeti.Supernatural`
  (`TauCeti/NumberTheory/Supernatural.lean`, line 67) and `TauCeti.profiniteOrder` with
  `profiniteOrder_quotient_le`, `profiniteOrder_apply_eq_top_iff`
  (`TauCeti/Topology/Algebra/Group/Profinite/Order.lean`, lines 58–177).

**Repair.** In *Function-field places, ideles and S-units* (line 2101 ff.) cite
`TauCeti.Divisor.degree_principal` for the product formula and
`TauCeti.Divisor.finite_ker_degreeClass` / `finite_classGroup_of_finite` for the finiteness of
`Cl⁰` and `Cl_S`, in the *Needs:* line and in the Tau Ceti contract; in *The Galois group
`G_{K,S}`* (line 1919) and *P-class formations* (line 2456) replace “ProfiniteProPGroups Layer 1”
by `TauCeti.profiniteOrder` and `TauCeti.Supernatural`; delete both roadmaps from the Dependencies
list at line 2844. For *Restricted ramification over a global function field* (line 2166) the only
remaining input is the dictionary “places of `F` = closed points of the regular projective model”;
state it as one target of R02.3.2 built on `TauCeti.Place` (the places are already the normalised
discrete valuations trivial on the constant field), or cite ArithmeticGaloisRepresentations §5.13,
which already defines `G_{K_C,U}` from closed points. After this the depcheck shows no UPWARD line.

Note for the board: both roadmaps exist on main (`TauCetiRoadmap/AlgebraicCurves`,
`Completed/ProfiniteProPGroups`) and the open pull requests that put them in the merge order
revise existing roadmaps; the brief says such roadmaps are cited as they are on main, so the two
lines may be a false positive of the tool. The repair above removes the edges either way.

## R02 (P3) — Gate: TeX-only syntax in two displays inside list items

**Location.** `README.md` line 1275 (inside item 4 of *Degeneration of the Hochschild–Serre spectral
sequence*) and line 1473 (inside item 2 of *Inflation–restriction for compact and rational
coefficients*).

**Claim.** The gate reports `tex` at both lines: `H^{n−1}`, `H^{n+1}` and `^{G/H}` outside a code
span. Both displays sit in ```` ```text ```` fences indented three spaces inside a numbered list;
the scanner does not treat an indented fence as a code block.

**Witness.** Gate output lines `tex: line 1275 …` (twice) and `tex: line 1473 …`.

**Repair.** Move the two displays out of the list items into unindented ```` ```text ```` blocks
(ending the list before each display), or write them inline as code spans. The mathematics is
unchanged.

## R03 (P3) — Conventions sentence contradicts the dyadic real-place Checks

**Location.** `README.md` line 329: “For finite `S` and finite `p`-primary coefficients, modified
compactly supported cohomology lives in degrees `0` to `3`.”

**Claim.** As written the sentence has no `(P)` qualifier, but the next sentence and the Checks of
*Duality when `p = 2` and `K` has real places* (D7.5) and *Finite arithmetic compact support*
(R02.4.5) state that for `K = ℚ`, `S = {2, ∞}`, `M = ℤ/2` the modified compactly supported groups
are `ℤ/2` in every negative degree.

**Witness.** My computation: the fibre sequence gives `Ĥⁱ_c ≅ Ĥ^{i−1}(ℝ, ℤ/2) = ℤ/2` for `i < 0`
and `H⁰_c ≅ ℤ/2` (the README's own Checks, lines 4093–4094 and 6056–6058).

**Repair.** Insert “under `(P)`” into the sentence at line 329.

## R04 (P3) — Locator: Khare–Wintenberger Lemma 4.6 page

**Location.** `README.md` line 7105: “Lemma 4.6, pp. 44–45”.

**Witness.** In the cited author PDF, Lemma 4.6 is stated on p. 43 (`khare-wintenberger-2` line
2038); Lemma 4.3 is on p. 40 and Lemma 4.4 on p. 41 (lines 1915, 1972), as the README says.

**Repair.** Write “Lemma 4.6, p. 43”.

## R05 (P3) — Backticked Lean names that `Suggested.lean` does not declare

**Location.** API bullets throughout, for instance `README.md` line 809
(`CompactCoefficients.HomPt`), line 1230 (`HochschildSerre.spectralSequence`), lines 3270–3285
(`PoitouTate.restrictedProductCohomology`, `PoitouTate.beta`, …), lines 3977–3983
(`ArithmeticDuality.finiteCompactCochains`, …).

**Claim.** The house rule reserves a backticked name of the roadmap's own for a declaration of
`Suggested.lean`; several hundred such names here name library targets that the file does not
declare. The file's introduction says so explicitly, and the gate's id check passes, so this is a
style note.

**Repair.** Either describe these interfaces in prose without backticked names, or keep the
current disclaimer; the author's call.

## Verified sound

**Gate and build.** I re-ran the gate on this head: identical to the worker's (set_option 0, blob 0,
latex 0, tex 3, sorry-data 0, sorry-examples 0, imports 0, lean-lines 0, readme-ids-missing 0,
depcheck 2, outside-folder 0, FAIL). `git diff --stat origin/main...HEAD` outside the roadmap folder
is empty. `lake env lean` on `Suggested.lean` succeeds with 11 `declaration uses sorry` warnings and
nothing else. Imports: `import Mathlib` plus four `TauCeti.*` modules, all present at the pin.

**Signatures.** I elaborated a scratch copy of `Suggested.lean` with `#check @name` for all 16
declarations (11 theorems, 3 `def`s, 2 `abbrev`s). Every hypothesis the README states is in the
elaborated type: `rationalisation` carries `Module.Finite`, `IsModuleTopology`, both joint-continuity
hypotheses and the bijectivity of the base change; the five `galoisGroupS` theorems carry
`[NumberField K]`, `[IsSepClosed Ω]`, `[Algebra.IsAlgebraic K Ω]`, `S.Finite` where the README asks
for it (not for the high-degree restriction, which Milne 4.10(c) states for every `S`), `[Finite M]`,
discreteness, `ContinuousSMul`, and the unit hypothesis `#M ∈ v.asIdeal → v ∈ S`; the two Sha
dualities carry `0 < n`, `n • x = 0`, and `IsUnit (n : F)` in the function-field case;
`grunwaldWang` carries `0 < m`. Nothing was lost to the section-variable rule (the `def`s mention
every variable they use). The README's generality equals the Lean's in each case.

**Padding probe.** On a scratch copy I replaced each `:= sorry` by
`by first | infer_instance | rfl | decide | simp | exact?`; all ten probed theorems fail
(“unsolved goals” or `exact?` finds nothing); the eleventh (Hermite finiteness, whose `sorry` is on
its own line) is a theorem of Hermite type and closes by no single tactic. Nothing in the file is
padding: no API lemma, no boundary case, no Check mirror, no `example`.

**Headline theorems.** From the README: Tate's inverse-limit theorem and rationalisation (R02.1);
the Hochschild–Serre identification and transgression (R02.2); `G_{K,S}`, Hermite, finiteness of
`H¹` (R02.3); the `S`-class formation; Tate's class-formation duality, Poitou–Tate, finiteness,
`cd`, the Euler characteristic, all-place Sha duality, Grunwald–Wang, character roots, torus
duality (R02.4); derived local/global duality, lattice Poitou–Tate, abelian-variety duality,
mapping-fibre duality (D7); Greenberg–Wiles (R02.5); the first-order cocycle comparison (D8); the
Taylor–Wiles and Khare–Wintenberger numerics (R02.6). Statable at the pins and stated:
rationalisation, Hermite, finiteness of `H¹` and of all degrees, the Euler characteristic, the
high-degree restriction, all-place Sha duality (number fields and function fields), Grunwald–Wang's
alternative, function-field Tate vanishing, the first-order cocycle equivalence. Not statable and
named as such in the module docstring, with the missing carrier: Tate's inverse-limit sequence
(coefficient towers), Hochschild–Serre and residue sequences (quotient actions, assembled spectral
sequence), the `S`-class formation and nine-term sequence (`P`-class formations, `S`-idele modules,
modified localisation complexes), exact Grunwald–Wang, character roots, torus duality (idele class
characters, character lattices), derived duality (admissible coefficients, dualizing complexes,
dual abelian varieties), Greenberg–Wiles and the auxiliary-prime theorems (the Selmer carrier with
its local pairings), the fixed-determinant quotient (trace sequence). I agree with each.

**Sources opened at their locators.** `milne-adt` (author PDF, printed = PDF − 8): Example 0.8
(p. 7), Remark 0.10 (p. 8), Proposition 0.20 (pp. 14–15), Lemma 1.7, Theorem 1.8, Lemma 1.9, Remark
1.12 (p. 24), Theorem 1.13 (p. 25, lines 1031–1039: parts (a)–(c) exactly as restated), Theorems
2.1, 2.6 (p. 30, line 1191), 2.8, Lemma 2.10 (p. 32), Theorem 2.13 (p. 35, lines 1374–1384, (c)
for finite `M`), Lemma 4.1 (p. 49), Propositions 4.2–4.3 (p. 50), Lemmas 4.4–4.5 (p. 51), Theorem
4.6 (p. 52), Lemma 4.8 (p. 55), Lemma 4.9 (p. 56, lines 2108–2110: `M` finite, every `S`),
Theorem 4.10 (pp. 56–57, lines 2139–2160, including the topological table), Example 4.11 (p. 57),
Lemmas 4.12–4.13 (pp. 58–59), Remark 4.14 (p. 61), Corollaries 4.15–4.16 (p. 62), 4.17–4.18 (p. 63,
lines 2384–2389), Theorem 4.20 (p. 65), Corollary 4.21 (p. 66), the explicit pairing (p. 65, lines
2429–2444), Theorem 5.1 with footnote 13 and Remark 5.2 (p. 67, lines 2501–2530), Lemmas 5.3–5.4
(pp. 69–70). `ddt`: Theorems 2.18 (p. 61), 2.19 (p. 62, lines 2319–2328: ordinary `H⁰(G_v, M)` at
every place), Lemma 2.39 (p. 75), Lemma 2.44 (p. 80), Lemma 2.46 (p. 81), Lemma 2.48 (p. 82),
Theorem 2.49 (statement p. 82, proof pp. 83–84), Theorem 3.42 (p. 100). `khare-wintenberger-2`:
§4.1.4 (p. 39), §4.1.6 (p. 42), Lemmas 4.3 (p. 40), 4.4 (p. 41), 4.6 (p. 43; R04), 5.2–5.4 and
Proposition 5.5 (pp. 47–48), Proposition 5.6, Lemmas 5.8, 5.10 (pp. 49–50), Lemma 7.10 (p. 69).
`harpaz-wittenberg-massey`: Remark 3.1 (p. 9), Remark 3.4 (p. 10), Lemma 5.5 (p. 19, lines
829–841), Lemmas 7.6–7.7 (pp. 28–29). `jannsen-cet`: Theorem 2.2 (p. 216), Proposition 4.8 and
Corollary 4.9 (p. 227), Remark 4.14 (p. 228) (running heads at lines 718, 785). `milne-ant` (v3.08):
Theorem 4.3, Theorem 4.9, Remark 4.11 (Chapter 4), Theorem 5.11 (`S`-units finitely generated of
rank `r + s + #S − 1`), Corollaries 7.51–7.52, Theorem 7.58. `conrad-locchar`: Remark 1.1 (p. 1),
Definition A.1, Remark A.2, Proposition A.3 (pp. 31–32). BCGNT (arXiv v3): Lemma 5.3.1 (p. 55),
Lemma 5.3.3 (p. 56). `merkurjev-scavia`: Lemmas 2.3, 2.5 (p. 6). `kaletha-rigid`: §3.2 (p. 12,
citing NSW 2.7.7), §4.3 (p. 19). `calegari-geraghty`: Lemma 4.14 (p. 52), §8.2 (p. 77), §8.4
(p. 80). `newton-thorne-sympow` (arXiv v2): Lemma 3.4 (p. 16, citing Maire Proposition 19), Lemma
5.3 (line 1804), so the two URLs in the reference list are one paper. `chan-orders`: Theorems 8.1
(p. 24), 8.7 (p. 27), 8.10 (p. 30), Lemma 8.9 (p. 29). `demarche-lucchini-neftin`: Proposition 2.5,
Lemma 2.6 (p. 1019). `mazur-rubin-core` (arXiv v1): Definitions 1.1–1.2 (p. 4), 1.6 (p. 5).
Mathlib at the pin: `ContinuousCohomology.tateShafarevich` (`Mathlib/RepresentationTheory/
Homological/ContCohomology/Sha.lean`, line 71: `⨅ v` of the kernels of the maps induced by
`Field.absoluteGaloisGroup.map (algebraMap K (f v))`, ordinary `H⁰`, `f : V → Type u` with `K : Type u`,
as the README says), `Algebra.IsUnramifiedIn` (`Mathlib/RingTheory/Unramified/Locus.lean`, line 98:
every prime over `𝔭` is `IsUnramifiedAt`), `AdicCompletion.of_injective_iff`
(`Mathlib/RingTheory/AdicCompletion/Basic.lean`, line 618: injective iff Hausdorff),
`NumberField.finite_of_discr_bdd` (`Discriminant/Basic.lean`, line 494), `Nat.card_coe_set_eq`
(`Data/Set/Card.lean`, line 627), `NumberField.Units.logEmbedding`. Of the 154 library names the
README cites, every one resolves at the pin by a declaration grep (file recorded in my scratch
`libcheck-grep.txt`); the only non-declarations are two module names cited as modules.

**Cross-roadmap citations resolved.** ArithmeticGaloisRepresentations at #856: §2.1
(*Decomposition and inertia groups*, *The local embedding*, *Local restriction*;
`GaloisRep.decompositionGroup`, `inertiaGroup`, `localEmbeddingMap`, `localRestriction`), §2.2
(`IsUnramifiedOutside`), §4.4 (*Dickson's theorem*, `GL2Subgroup.dickson_projectiveImage`), §4.7
(*Characteristic two*, with `H¹(G₀, Ad) = 0` and the submodule list), §5.13
(*Restricted-ramification function-field groups and Frobenius*, *Chebotarev for function fields*),
§7.2 (*The adjoint*, *The trace pairing on matrices*; `ContinuousRep.ad`, `adZero`, `adQuot`), §7.6
(*Projective lifting*: `H²(G_F, ℚ/ℤ) = 0`), §7.7 (*`SL₂` with adjoint coefficients*, `#F ≠ 5`).
IntegralIwasawaTheory #1306: §§2.0, 10.0, 10.1 and all nine names. NoncommutativeAndEquivariantIwasawa
#1307: §§F.3, F.4 and all seven names. PadicPeriodRings #940: §0.1 `procyclic_H1_equiv_coinvariants`,
§0.2 *Low-degree continuous descent*. PerfectoidTowers #816: §P9.0 and its three targets.
DerivedModuleAlgebra (main): §§0.2, 1.1, 1.3, 1.5, 1.M.1, 1.M.2, 1.T.1, S.1 and the sixteen names
(the “six-term sequence” is named in §1.T.1's text). EnhancedDerivedSheaves §E1.8.DMA.1
`derivedTensor_affine`. SchemeAndStackFoundations §§2.7, 2.9, 2.15, 2.18, 2.21 and their names.
AbelianSchemesAndArithmeticModuli #849 §A2.2 `AbelianScheme.dual`, `dual_elliptic`.
AlgebraicModuliForArithmeticGeometry #853 §§4.2, 4.20 `gerbeClass`. EtaleCohomologyFoundations
§§F.0.A0, F.0.A2. AdelicAlgebraicGroups #792 §§1.1, 1.2, 1.5, 3.4 *Finiteness of class numbers*.
PadicLocalLanglandsForGL2Qp #1312 §0.5 `CycleSupport.multiplicity`, `exists_hilbertSamuel_polynomial`.
On main: HeightsAndUnits §4.2 (Layer 4, *The S-unit theorem*), EllipticCurves Layer 7 *Selmer
structures, the Selmer group, and Sha*, RepresentationTheory/ModularInduction Layers 0–1, 4
(`modRepK0`, `modularArtin_natCard_nsmul_mem_indCyclicCoprime`, decomposition map excluded),
GlobalNumberFields Layers 1, 6, 7, 8, NumberFieldArithmetic Layers 1, 4, 6 and §§1.2, 5.6,
Chebotarev Layer 10, ClassFieldTheory Layers 2–13 and the five names, ReductiveGroups Layers 4–7,
ProfiniteCohomology Layers 1–12 and its named exports, PolynomialGaloisGroups *What Mathlib
provides*, AlgebraicCurves Layers 3, 5, 12 and ProfiniteProPGroups Layer 1 (both exist on main; see
R01). Every citation names a section or target that exists where cited; none is a pull-request
number. Gaps: none declared, none needed.

**Ownership.** `roadmaps grep` over the open pull requests and main: `galoisGroupS`,
`maxUnramifiedOutside`, `powerKernel`, the `P`-class formations, the Greenberg–Wiles formula and the
first-order lift comparison are built nowhere else; InverseGaloisAndArithmeticFundamentalGroups
(#850, later in the order), GeometryOfNumbersAndQuadraticArithmetic (#851), SelmerIwasawaCohomology
(#869) and GlobalGaloisDeformations (#920) cite this roadmap's sections (`G_{K,S}`, R02.3.0d,
R02.4.5a–b, D7.7) rather than rebuilding them. `ProfiniteCohomologyPartII` appears in the merge
order but has no folder on main or in any open pull request, so no clash could be checked. The
sibling checkouts named in the brief contain no second owner of these objects.

**Adversarial table** (values computed on each side; rows marked ✓ needed no change).

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Tate's inverse-limit theorem (R02.1.2) | `G = ∏_{j≥1} C_{p^j}`, `T = ℤ_p`, `i = 2` | `Hom_cts(G, ℤ/pⁿ) = ⊕_j ℤ/p^{min(j,n)}`; image of level `n+k` in level `n` on factor `j` is `0` for `j ≤ k`, `p^{n+k−j}ℤ/pⁿ` for `k < j < n+k`; it shrinks at `j = k+1` for every `k`, so not Mittag-Leffler, `lim¹ ≠ 0` | ✓ Check correct |
| Same, trivial `G` | `i = 1` | `lim¹ T_n = 0` (surjective transitions), `H¹(1, T_n) = 0` | ✓ |
| Long exact sequences for continuous cohomology (sampled) | `G = ℤ_p`, `ℤ_p^{disc} → ℤ_p` | identity `1`-cochain has no continuous lift to the discrete module (a lift is locally constant with finite image) | ✓ hypothesis needed |
| Rationalisation (headline; `rationalisation`) | `G = ℤ_p`, `T = ℤ_p`, `i = 1`; `T` with torsion | `H¹ = ℤ_p`, `⊗ℚ_p = ℚ_p = Hom_cts(ℤ_p, ℚ_p)`; torsion killed by `⊗ℚ_p`; Lean carries both joint continuities and `liftBaseChange` bijective | ✓ |
| Divisible elements of `Hⁱ(G, T)` (R02.1.3) | the `∏ C_{p^j}` tower | `∩ pⁿH² = lim¹ ≠ 0`, no divisible subgroup (weakly `p`-complete) | ✓ consistent with Jannsen 4.8–4.14 |
| Pointwise Hom of discrete modules (sampled) | `C = ℤ, ℤ², 0, ⊕_ℕ 𝔽₂`; `A = 𝔽₂` | `Hom_pt = A, A², 0, 𝔽₂^ℕ` (product topology, not discrete); evaluation jointly continuous | ✓; the source gap on `C` is real (see Source issues) |
| Splitting torsor | `Γ = 𝔽₂^ℕ`, `B = A ⊕ C` with `g·(a,c) = (a + Σ gᵢcᵢ, c)` | `γ(g) = (c ↦ Σ gᵢcᵢ)` is a homeomorphism `Γ → 𝔽₂^ℕ`, not continuous into the discrete `Hom` | ✓ |
| Finitely generated `C`: discrete case | `Γ = ℤ/2`, `B = 𝔽₂²`, `σ = [[1,1],[0,1]]` | `γ(σ) = id ≠ 0`, `∂ : 𝔽₂ → H¹(ℤ/2, 𝔽₂) = 𝔽₂` iso, `B^Γ = A` | ✓ |
| Completed tensor products and finite reductions (sampled) | `T = R`; `M = ⊕_ℕ ℤ_p` | `R ⊗̂ M = M`; `⊕ℤ_p` not complete, completion = null sequences | ✓ |
| Factor-set class (R02.1.5) | `G = M = ℤ/2`, `α(σ,σ) = 1` | extension `ℤ/4`, class nonzero in `H²(ℤ/2, ℤ/2) = ℤ/2` | ✓ |
| Unbalanced product sum | `ℤ/4 → ℤ/2` | summing over `Δ` multiplies by `2`, kills `2`-torsion | ✓ |
| Hochschild–Serre `z4_nondegenerate` | `G = ℤ/4`, `H = 2ℤ/4`, `A = 𝔽₂` | `E₂^{0,1} = E₂^{1,0} = E₂^{2,0} = 𝔽₂`; `d₂^{0,1} ≠ 0` forces `dim H¹(ℤ/4, 𝔽₂) = 1` (true: `Hom(ℤ/4, 𝔽₂) = 𝔽₂`); restriction `H¹(G) → H¹(H)` is `0`; inflation `H²(ℤ/2) → H²(ℤ/4)` is `0` | ✓ |
| Degeneration (4), torsion needed | `G = Ẑ`, `H = 1`, `A = ℤ`, `n = 2` | outer terms `0`, middle `H²(Ẑ, ℤ) = ℚ/ℤ` | ✓ |
| `d₂ = −u ∪ ·` witness | `ℤ/9 → ℤ/3`, `𝔽₃`, `s(i) = ī`, `F(t) = ⌊t̄/3⌋` | `dF(s(i),s(j)) = −u(i,j)`; `(dF(1,1), dF(1,2)) = (0, 2)`, `(u(1,1), u(1,2)) = (0, 1)`; `Σ_j u(1,j) = 1`, `Σ_j (−u)(1,j) = 2`, coboundaries sum to `0`, so `[u] ≠ [−u]` | ✓ |
| Transgression and norm | `K = ℚ`, `L = ℚ(√2)`, `2 + √2` | `σ(2+√2) = 2/(2+√2) ≡ (2+√2)·2 ≡ 2+√2` mod squares; `ℚ(√(2+√2)) = ℚ(ζ₁₆)⁺` cyclic of degree 4, not biquadratic, so not from `ℚ^×`; `N(2+√2) = 2 = (√2)²` | ✓ |
| Inflation–restriction compact (2) | `G = ℤ_p²`, `H` second factor, `T = ℤ_p` | `0 → ℤ_p → ℤ_p² → ℤ_p → 0 → H²` exact | ✓ |
| Residue sequence Checks | `k = 𝔽_p((t))`, `m = p` | `H¹(K, ℤ/p) = K/℘K` infinite vs `H¹(𝔽_p, ℤ/p) = ℤ/p` | ✓ coprimality needed |
| Multiplicative completion (R02.3.0a) | `ℤ/2, p = 3`; `ℚ`; `ℚ_p/ℤ_p`; `ℤ_ℓ, ℓ ≠ p` | completions `0, 0, 0, 0`; `ℤ_p ⊗ ℤ_ℓ ≠ 0`; the identity of `ℚ_p/ℤ_p` is a nonzero character | ✓ |
| S-unit adapters (R02.3.0c) | `ℚ(√2)`, `ℚ(√−5)` with `𝔭 = (2, 1+√−5)` | ranks `1` and `2 = 1 + #S`; `𝔭² = (2)`, generator `2` of valuation `2`, image of index `2` | ✓ |
| Finite Galois localization Checks | `K = ℚ`, `A = ℤ/2`, class of `−1` | nonzero in `H¹(ℝ, ℤ/2)` | ✓ |
| `G_{K,S}` (headline carrier `maxUnramifiedOutside`) | `K = ℚ`, `S = {∞}`, `{2,∞}`; `u = 2, n = 3` | `K_S = ℚ` (`|disc| > 2`); `i, √2, ζ_{2ⁿ} ∈ K_S`, `√3 ∉ K_S`; `disc ℚ(∛2) = −108`, so `3` must be added | ✓; Lean uses Mathlib's `IsUnramifiedIn` = every prime over `v` unramified |
| Hermite (headline) | `S = {2,∞}`, `n = 2` | fields `ℚ, ℚ(i), ℚ(√2), ℚ(√−2)` (discriminants `−4, 8, −8`); infinite `S` or no degree bound gives infinitely many | ✓; Lean counts subfields of any `Ω` (at most `[L:K]` embeddings each) |
| Finiteness of `H¹(G_S, M)` (headline) | `S = {2,∞}`, `M = ℤ/2`; `M = ℚ₂/ℤ₂` | order `4`; infinite for `M` infinite (quotient `ℤ₂^×`) | ✓ |
| Localisation maps and the modified local groups (sampled) | real `v`, `M = ℤ/3`; `M = ℤ/2`; `v = 2`, `ℚ₂(i)`, `ℚ₂(√5)` | `Ĥ⁰(ℤ/2, ℤ/3) = 0` vs `H⁰ = ℤ/3`; `Ĥʳ(ℤ/2, ℤ/2) = ℤ/2` all `r`; `ℚ₂(i)` ramified, `ℚ₂(√−3)` unramified | ✓ |
| Function-field class-field Checks | `E = 𝔽₃(t)`, `G = PGL₂(𝔽₃) ≅ S₄`, `H = ⟨t ↦ −t⟩` | `t ↦ −t` fixes `0, ∞`, swaps `1, 2`: a transposition; `N_G(H)/H ≅ C₂`; `⟨H, A₄⟩ = S₄` so `L ∩ F^ab = F`; `C_F/N C_L = 1 ≠ C₂` | ✓ Galois needed |
| S-idele classes (R02.3.3) | `ℚ(√−5)`, `S = {∞}`, Hilbert class field `K(i)` | `𝔭O_{K(i)} = (1+i)` since both square to `(2)`; `Pic(R_{K,S}) = ℤ/2` dies | ✓ |
| P-class formations (sampled) | `G = Ẑ`, `C = ℤ`, `H = ∏_{ℓ≠p} ℤ_ℓ`; `V = U` | `(ℤ_p, ℤ)`: `H²(ℤ_p, ℤ) = ℚ_p/ℤ_p ≠ ℚ/ℤ`, injective not bijective; `u_{U/U} = 0 = 1/1` | ✓ matches Milne p. 25 |
| Reciprocity for `C_S` | `ℚ`, `S = {p,∞}` | `C_S = ℝ_{>0} × ℤ_p^×`, `D_S = ℝ_{>0}`, `G_S^{ab} = ℤ_p^×` | ✓ |
| Kummer sequence for S-units | `ℚ(√−21)`, `S = {𝔭₂, ∞}`, `m = 2` | `Cl = (ℤ/2)²` (`h(−84) = 4`), `𝔭₂` non-principal (`a² + 21b² = 2` impossible), `Pic(R_S) = ℤ/2`, `E_S = {±1} × 2^ℤ`, order `4 · 2 = 8` | ✓ |
| Absolute and relative locally trivial groups (sampled) | `M = 0`; `K = F`; `ℚ(i)` class; `Ш⁰` | all `0`; `ℚ(i)` nonzero at `2` and `∞`; `M^{G_F} ⊆ M^{G_v}` | ✓ |
| Cyclotomic power kernel | `ℚ`, `μ₄`; `μ₈` | `H¹(Gal(ℚ(i)/ℚ), μ₄) = ℤ/2` but decomposition at `∞` is everything, `Ш¹ = 0`; `2` totally ramified in `ℚ(ζ₈)`, `Ш¹(ℚ, μ₈) = 0`, `16 ∈ Ш¹_{{2}}` | ✓ |
| Exponent-two fields | `ℚ({2})`, `ℚ({2,3})`, `ℚ(√3)` | degrees `4`, `8`; `2+√3` has norm `+1`, narrow class number `2`, `ℚ(√3,√−3)/ℚ(√3)` unramified at `2` (`e=2` from `ℚ(√3)`, `ℚ(√−3)` inert) and at `3` | ✓ |
| One new ramified prime | `v = 17`, `w = 41` | `(41/17) = (7/17) = (17/7) = (3/7) = −(7/3) = −1`; `(17/41) = (41/17) = −1` | ✓ |
| Antiunit rank | imaginary quadratic, `T = {𝔩, 𝔩̄}` | `S`-unit rank `0 + 1 − 1 + 2 = 2`; minus part `α/ᾱ`, `(α) = 𝔩^h`, infinite order in the pro-`p` local units | ✓ |
| No `ℤ_p`-extension unramified at `p` | `ℚ`, `S = {ℓ}`, `ℓ ≡ 1 (p)` | pro-`p` abelianisation = `p`-part of `(ℤ/ℓ)^×`, cyclic of order `p^{v_p(ℓ−1)}` | ✓ |
| Ext of discrete G-modules (sampled) | `G = 1`, `M = ℤ/m` | `Ext¹(ℤ/m, ℤ) = ℤ/m` vs `H¹(1, Hom) = 0` | ✓ divisibility needed; Milne Example 0.8 p. 7 |
| Tate's class-formation duality | `M = ℤ`, `r = 1, 2, 3` | both sides `0`; `α² = inv`; `H³(G, C)` has finite layers `Ĥ¹(G/U, ℤ) = 0` | ✓ Theorem 1.13 |
| Descent of Kummer coefficients | `m = 3`, `S = {3,∞}` over `ℚ` | cohomology orders `1, 3, 1` of `μ₃` (`H¹ = ℤ[1/3]^×/3 = ⟨3⟩`) | ✓ |
| `M^D` | `K = ℚ`, `S = {∞}`, `M = ℤ/3` | `E_S = {±1}`, `(ℤ/3)^D = 0 ≠ (ℤ/3)^{DD}` | ✓ unit hypothesis needed |
| Local duality at archimedean places | real, `M = ℤ/3`; complex | `3 · 1 / 1 = 3 = |3|_ℝ`; `#M · #M = |#M|_ℂ` | ✓ Milne 2.13(c) |
| Unramified annihilators | `M = ℤ/m`, `m` prime to `q` | `#H¹(K_v, μ_m) = m · #μ_m(K_v)` = `#H¹_un(ℤ/m) · #H¹_un(μ_m)` | ✓ |
| Restricted products, `Ш¹_S` example | `K = ℚ(√−35)`, `L = K(√−7)`, `S = {v₂, ∞}` | `disc L = 5·(−7)·(−35) = 1225 = 35²`, unramified; `−7 ≡ 1 (8)` splits `2`; `x² − x + 9 ≡ x(x−1) (3)`, so `K_v = ℚ₃` at `3` and `−7` nonsquare mod `3`: nonzero outside `S`, zero on `S` | ✓ |
| `β¹` is proper | `S` all places, `M = ℤ/2`, `S ∖ T = {2,∞}` | inverse image = `4` quadratic characters | ✓ |
| Character duality for the arithmetic topological groups (sampled) | `ℤ/m`; `∏_ℕ ℤ/2`; finite-support subgroup | bidual `ℤ/m`; dual `⊕_ℕ ℤ/2`; dense proper subgroup has annihilator `0` | ✓ Milne 0.20 p. 14 |
| Poitou–Tate (b) | `K = ℚ`, `S = {3,∞}`, `M = ℤ/3` | `P⁰ = ℤ/3 ⊕ Ĥ⁰(ℝ, ℤ/3) = ℤ/3`, `β⁰` bijective, `H²(G_S, μ₃) = 0`; with ordinary real `H⁰`, `P⁰ = (ℤ/3)²` and exactness fails | ✓ Theorem 4.10 p. 56 |
| Poitou–Tate (c) (headline `highDegree_restriction_bijective`) | `S = {2,∞}`, `M = ℤ/2`, `r = 3`; `K_S` real at `w` | `H³(G_S, ℤ/2) ≅ ℤ/2`; if `2 | #M` the unit hypothesis puts `μ₄ ⊂ K_S`, so `K_S` is totally complex and the stabilizer of `w` is `C₂ = G_v`; if `#M` odd both sides vanish | ✓ Lean matches |
| Cohomological dimension Check | `ℚ(√−5)`, `p = 2`, `S = {complex place}` | root discriminant `√20 ≈ 4.47 < (π/4)e² ≈ 5.80`, so the unramified tower is finite of even degree (contains `ℚ(i,√5)`), `G_S ⊇ C₂`, `H⁴(G_S, Coind 𝔽₂) = 𝔽₂` | ✓ sharp negative control |
| Surjectivity of `H²` | `T = {∞}`, `M = μ₂` over `ℚ`; `T = S = {p,∞}` | `(−1,−1)` hits the generator; `H²(G_S, μ_p) = 0` while `H²(ℚ_p, μ_p) = ℤ/p` | ✓ |
| High-degree units | real `v`, `r` odd/even | `Ĥ¹(C₂, ℂ^×) = 0`; `Ĥ⁰ = ℝ^×/ℝ_{>0} = ℤ/2` | ✓ Corollary 4.18 |
| The explicit Poitou–Tate cochain pairing (sampled) | `deg β = 0`, `deg β′ = 1` | `d(β∪α′) = α∪α′`, `d(α∪β′) = −α∪α′`, difference `d(β∪β′) = α∪β′ + β∪α′`; `ε` exists since `H³(G_S, E_S)(ℓ) ≅ ⊕_{real} Ĥ¹(C₂, ℂ^×)(ℓ) = 0` | ✓ Milne p. 65; sign convention differs as stated |
| Modular Artin | `S₃`, `p = 3` | induced classes `(3,1) ↦ 2[1]+[sgn]`, `(3,−1) ↦ [1]+2[sgn]`, regular `3[1]+3[sgn]`; index `det[[2,1],[1,2]] = 3`; `3[sgn] = 2(1,2) − (2,1)` | ✓ |
| Euler-quotient multiplicativity | `0 → μ₂ → μ₄ → μ₂ → 0` over `ℚ`, `S = {2,∞}` | `χ(μ₄) = 2/4`, `χ(μ₂)² = 1`; `φ(μ₄) = ½·4/2 = 1 = φ(μ₂)²` | ✓ |
| Equivariant Kummer Euler class | `L = ℚ(ζ₃)`, `p = 3`; `L = ℚ(i)`, `p = 2` | `[U/U³] = [ε]+[1]` (`c` on `(ζ, π)` is `[[−1,−1],[0,1]]`, diagonalisable), `A = 0`, `B_S[3] = 0`, class `−[1]`; invariants give `log χ = 0` for `ℤ/3`, `−1` for `μ₃`; `ℚ(i)`: `1 − 2 + 0 = −1` | ✓ |
| Tate's global Euler characteristic (headline `eulerChar_galoisGroupS`) | footnote 13; `ℚ, S = {3,∞}, ℤ/3`; product identity | `2^{−r₂}`; `H⁰ = H¹ = ℤ/3` (cubic field of `ℚ(ζ₉)`), `H² = 0`, `χ = 1 = 3/3`; `χ(M)χ(M^D) = 1·(1/3) = χ(ℚ₃, ℤ/3)·χ(ℝ, ℤ/3) = (1/3)·1`; alternating product of the nine-term orders gives `#P⁰#P²/#P¹` | ✓; Lean's stabilizer of `w` is `G_v`'s image and `v.mult ∈ {1,2}` |
| Remark 5.2(a) denominator | `ℚ`, `M = ℤ/3` | with `M^D`: `1/1 = 1`; with `M`: `1/3 ≠ 1`; identity `#H⁰(M)/|#M|_v = #Ĥ⁰(M^D)/#H⁰(M^D)` holds by 2.13(a),(c) and Herbrand | ✓ README right, Milne misprint |
| Function-field Poitou–Tate | `𝔽_q(t)`, `S = {∞}`, `ℤ/m`; `S = ∅` | prime-to-`p` covers of `𝔸¹` are constant, `H¹ = ℤ/m`, `H² = 0`, `χ = 1`; `S = ∅`: `P⁰ = 0` but `H⁰ ≠ 0` | ✓ |
| Finite compact support | `ℚ`, `S = {2,∞}`, `ℤ/2`; `(P)` | `0 → Ĥ^{−1}(ℝ) → H⁰_c → ℤ/2 ↪ ℤ/2 ⊕ ℤ/2`, so `H⁰_c = ℤ/2`; under `(P)` `H⁰_c = 0` | ✓ (and R03) |
| Finite-coefficient Poitou–Tate input | real `H¹(ℝ, ℤ/2) × H¹(ℝ, μ₂) → ½ℤ/ℤ` | nontrivial classes cup to Hamilton's quaternions | ✓ |
| Grunwald–Wang alternative (headline `grunwaldWang`) | `m = 1, 2`; `16` for `T = {2}`; `ℚ(√7)` | kernel trivial; `x⁸ − 16 = (x²−2)(x²+2)(x²−2x+2)(x²+2x+2)`, one of `2, −2, −1` a square in each `ℚ_v`, `v₂(16) = 4`; `ℚ₂(√7) = ℚ₂(i)` (`−7 ≡ 1 (8)`), `(1+i)⁸ = 16`, no `√2, √−1, √−2 ∈ ℚ(√7)`; `s = 2`, `F(μ₈)/F` biquadratic, `S_F = ∅`, generator `(2+η₂)⁴ = 16` | ✓ Lean: order `1 ∨ 2`, trivial unless `8 | m` and `−1` nonsquare |
| All-place Sha duality (headlines `finite_sha_duality`, `sha_duality`) | inseparable `𝔽₂(u)/𝔽₂(t)`, `μ₃`; normalisation | `res[t]² = [u]⁴ = [u]`, so `res⁻¹[u] = [t]²` while `N(u) = t`: `v_t` differs mod `3`, `[L:E]·res⁻¹[u] = [t]⁴ = [t]`; `⟨res x, res y⟩_L = d⟨x,y⟩_F` | ✓; Lean uses Mathlib's all-place kernel on actual completions |
| Grunwald–Wang exact obstruction | `ℚ`, `n = 8`, `χ₂` unramified of order `8` | `χ₂(16) = χ₂(2)⁴ = −1`; unramified twist of order `| 4` leaves `−μ(2)⁴ = −1` | ✓ Conrad A.1–A.3 |
| Character roots | `ℚ(√5)`, `ℚ(i)`, `m = 2` | `(5,−1) = 0` (`5 > 0`, `−1 ≡ 4 (5)`, `(5,−1)₂ = 1`); `(−1,−1) ≠ 0` | ✓ |
| Totally real local base change with avoidance (sampled) | `F = ℚ`, `Σ = {2}`, `d₂ = 2`, `T = {13}`, `L = ℚ(i)`; `L = ℚ(√3)` | `ℚ(√3)`: ramified at `2`, `3 ≡ 4² (13)`, disjoint from `ℚ(i)`; fails for `L = ℚ(√3)`, `ℚ(√10)` works (`6² ≡ 10 (13)`); the `S_n` construction: `(n−1)`-cycle plus transitivity gives primitivity, transposition at `q₀` gives `S_n`, `ℚ(√disc g)` ramified at `q₀` while `L̃` is not | ✓ BCGNT 5.3.3 p. 56 |
| Roots after prescribed totally real base change (sampled) | `η = 1`; `η` odd at a real place, `m = 2` | `M = ℚ`, `ψ = 1`; sign character has no square root on `Gal(ℂ/ℝ)`; the twist `ε` above `T` has no dyadic obstruction (`S_F ⊄ S` or empty product) | ✓ |
| Tate vanishing (headline `tate_vanishing`) | `ℚ`, `n = 2` | `(−1,−1) ≠ 0` in `H²(ℚ, ℤ/2)`, dies in `H²(ℚ, ℤ/4)` as `δ(χ_{−1})`; function field: `H²(G_F, (ℚ/ℤ)(p)) = H³(G_F, ℤ)(p) = 0` for `p ≠ char` | ✓ |
| Torus duality | `T = G_m`; `R¹_{L/F}G_m`, `L/F` cyclic | `Ш¹ = 0` (Hilbert 90), `Ш²(ℤ) = 0` (Chebotarev); Hasse norm theorem | ✓ |
| Derived tensor / residual criterion (D7.1) | `ℤ/2 ⊗^L_ℤ ℤ/2`; `k[ε]`, `K = k` | `Tor₁ = ℤ/2` in degree `−1`; minimal resolution periodic, not perfect | ✓ |
| Grothendieck local duality | `ℤ_p`, `ω = ℤ_p[1]`, `K = ℤ/p`; `k[ε]`, `K = k` | `Ext⁰(ℤ/p, ω) = Ext¹(ℤ/p, ℤ_p) = ℤ/p = D(H⁰_𝔪(ℤ/p))`; `Ext⁰_R(k, R) = εR ≅ k = Hom_R(k, R)` | ✓ |
| Derived composite spectral sequence | `F = H = Hom(ℤ/2, −)`, `X = ℚ/ℤ` | `R¹(H∘F)(ℚ/ℤ) = Ext¹(ℤ/2, ℚ/ℤ) = 0` but `E₂^{1,0} = Ext¹(ℤ/2, ℤ/2) = ℤ/2` would inject | ✓ acyclicity needed |
| Euler function | `ℤ_p`: `P(n) = n+1`, `e = 1`; `k[[x,y]]/(x)` | graded lengths constant `1` would give `0`; `e_R(R/(x)) = 0` at `d = 2` | ✓ |
| Universal coefficients / Künneth (D7.2) | `C₂`, `ℤ/2`; `A₅ × A₅` over `𝔽₂` | `H₂(C₂, ℤ/2) = Tor₁(ℤ/2, ℤ/2) = ℤ/2`; `H¹(A₅) = 0`, `H² = 𝔽₂`, no mixed term | ✓ |
| Cohomological finiteness (D7.3) | `G_{ℚ_p}`, `p` odd, `T = ℤ_p`; `ℚ(μ_p)`, `S` all places | `H¹ = ℤ_p²`, `H² = 0`; `K^×/K^{×p}` infinite | ✓ |
| Nakamura comparison | `Ind_{G_{ℚ(i),S}} ℤ₂` | restriction to `G_ℝ` is `ℤ₂[C₂]`, Tate cohomology `0`; perfect amplitude `[0,2]` by Shapiro | ✓ |
| Derived local duality (D7.4) | `ℚ_p`, `ω• = ℤ_p`, `T = ℤ_p`; Hilbert symbol | `H¹(ℚ_p, ℤ_p(1)) = ℤ_p²`, `H²(ℚ_p, ℤ_p(1)) = ℤ_p`; `(a,b)(b,a) = 1` is `∪_f ∘ s₁₂ = ∪_f` | ✓ |
| Compact support Euler characteristic | `ℚ`, `S = {p,∞}`, `M = 𝔽_p` | `H⁰_c = H¹_c = 0` (local `H⁰` iso; the degree-`p` field in `ℚ(ζ_{p²})` is ramified at `p`), `H²_c = 𝔽_p` (`2 − 1`), `H³_c = 0`; `χ_c = 1 = dim 𝔽_p^{G_ℝ}` | ✓ |
| Trace of `H³_c` | `ℚ(√−21)`, `p = 2` | `Pic(R_{K,S})/2 = ℤ/2` injects into `H²(G_S, μ₂)` and vanishes locally | ✓ |
| Lattice Poitou–Tate (D7.6) | `ℚ(μ_p)`, `T = ℤ_p(1)` | `H⁰(T) = 0`, `H⁰(T/p) = μ_p = H¹(T)[p]` | ✓ |
| Abelian-variety Ext | small site, `F` algebraically closed | `Ext¹_{Ab}(A(F), F^×) = 0` (divisible target) vs `A^∨(F) ≠ 0` | ✓ |
| Isogeny index | `[n]` on `E/ℚ_ℓ`, `ℓ ∤ n`; `n = ℓ` | `|E/nE| = |E[n]|`; extra factor `ℓ` from `ℤ_ℓ ⊆ E(ℚ_ℓ)` | ✓ |
| Perfect pairings (D7.7.1) | `ℚ_ℓ`, `ℓ ≢ 1 (p)`, `ℤ/p` vs `μ_p`; `3xy` on `ℤ` | `H¹(ℚ_ℓ, ℤ/p) = ℤ/p` all unramified, `K^×/p = ℤ/p`, `O^×/p = 0`; curried maps have image `3ℤ`, not perfect | ✓ |
| The local-condition menu (sampled) | `Q = ∅`; `M = ℤ/p`, `v ∤ p`; `v | p` | both changes return `L`; unramified classes = unramified characters; kernel to inertia = inflation image but its dual need not be unramified | ✓ |
| The Greenberg–Wiles formula (sampled, DDT 2.19 p. 62) | `ℚ`, `𝔽_p`, `L_fin = H¹_un`, `L_∞ = 0`; `ℤ/2` with `L_∞ = H¹(ℝ)` | `H¹_L = 0`; `L_p^⊥ = ℤ_p^×/p` (order `p` in `(ℤ/p)²`), `H¹_{L^⊥}(ℚ, μ_p) = {±1} = 0`; right side `(p/1)·(1/p) = 1`, with `Ĥ⁰` it would be `p`; `ℤ/2`: `L_2^⊥` = even valuation classes (order `4` of `8`), `L_∞^⊥ = 0`, both Selmer groups `0`, right side `1·1·1 = 1` | ✓ ordinary `H⁰` at `∞` as in the source |
| Greenberg–Wiles dimensions | `ad⁰` in characteristic `2`, rank `2` | dual is `(ad/k·1)(1)`, trace pairing on `ad⁰` has radical `k·1` | ✓ |
| Changing one local condition | `ℚ`, `𝔽_p`, `q ≡ 1 (p)`; `q ≢ 0,1 (p)` | `[L′_q : L_q] = p²/p = p`, new Selmer order `p` (degree-`p` subfield of `ℚ(ζ_q)`); `[L′_q : L_q] = 1` | ✓ |
| Rank-one numerics | `ℚ(√2)`, `p = 3`; `ℚ(ζ₃)` | `O^×/3 = 𝔽₃` from `1+√2`, difference `−1 = −(2+0−1)`; `μ₆/μ₂ = 𝔽₃`, `−1 = −r₂` while `−(r₁+r₂−1) = 0` | ✓ |
| Trace-zero adjoint (D8) | `𝔽₂`, `n = 2` | `tr(1) = 0`, `1 ∈ ad⁰`, radical `k·1`, `(ad⁰)^∨ = ad/k·1` | ✓ |
| First-order cocycle comparison (headline `firstOrderLift_equiv_cocycles`) | product of lifts | `(1+εc(g))ρ₀(g)(1+εc(h))ρ₀(h) = (1 + ε(c(g) + ρ₀(g)c(h)ρ₀(g)⁻¹))ρ₀(gh)`, the Lean cocycle law; inverse `(ρ₀(g)⁻¹, −ρ₀(g)⁻¹c(g))` | ✓ no commutativity used |
| Local cohomology at a Taylor–Wiles prime (sampled, DDT 2.46 p. 81) | eigenvalues `x, 1, x⁻¹`; `𝔽₇`, `[[0,−1],[1,0]]`; scalar `Frob` | `h⁰ = h¹ = 1`; `−1` nonsquare mod `7`, centraliser `𝔽₄₉`, trace-zero part the line of `ρ̄(Frob_q)`; scalar gives `h⁰ = 3` | ✓ |
| Group-theoretic TW input | `ℓ = 3`, image `S₄` | `Gal(ℚ(ζ₃)/ℚ)` is the sign quotient, `H ↦ A₄ ≅ PSL₂(𝔽₃)`; `cor∘res = 2` invertible mod `3` | ✓ |
| Archimedean adjoint dimensions | `(a,b) = (m,m)`, `(m+1,m)`; char `3`, `n = 5` | `2m²−1 = m(2m−1) + (m−1)`; `2m²+2m = (2m+1)m + m`; `(3,2)` and `(0,5)` both have trace `1` but `h⁰ = 12, 24` | ✓ |
| KW tangent count | real place over `𝔽₂`, `c = [[1,1],[0,1]]` | centraliser `{[[a,b],[0,a]]}`, `h⁰(ad) = h⁰(ad⁰) = 2`, trace zero; `(1+c)² = 0`, norm image = invariants, `Ĥ⁰ = 0` | ✓ |
| Dyadic auxiliary primes | `ℚ`, `n ≥ 3` | `(ℤ/2ⁿ)^× ≅ ℤ/2 × ℤ/2^{n−2}`, `𝔽₂`-dual of dimension `2`, exponent `2^{n−2}` | ✓ |
| Finite-order determinant twists (sampled, KW 7.10 p. 69) | `ψ′/ψ` of order `p^m`, `p` odd; `ℚ`, `ψ′ = χ_{ℚ(i)}`, `v = 3`, `p = 2` | `ζ = (ψ′/ψ)^{(p^m+1)/2}` squares to `ψ′/ψ`; `ψ′(c) = −1`, `ζ(c′)² = ζ(1) = 1`, no solution after any totally real base change | ✓ parity needed |

**Other principles.** No `set_option`, no sorry'd data, no `lemma`, no process words or pull-request
numbers in the README or the Lean docstrings (gate: prnum 0, round-labels 0). No computational
algorithm. Every `*Needs:*` line lists its inputs item by item; the within-roadmap order (R02.1,
R02.2, R02.3, R02.4, D7, R02.5, D8, R02.6) is respected by every `*Needs:*` line I read, with D7
after R02.4 as the README explains. No passage of a source is copied; locators are given with pages.
Every definition I read has an API list and at least three discriminating Checks; every theorem
has its hypotheses and a locator.

## Not verifiable

- `nsw` (Neukirch–Schmidt–Wingberg, electronic version 2.3): the author page says the PDF is free
  for non-commercial use, but the server returned the HTML landing page for the PDF URL on both
  attempts and the shared cache holds only that page. All NSW locators (I §1 Exercise 4; I §5
  Corollary 1.5.7; II §4 Theorems 2.4.1, 2.4.3, 2.4.4, 2.4.6 and Exercises 1, 3, 4, 5; II §7 Lemma
  2.7.2 and Theorem 2.7.7; VII (7.1.8), (7.2.6), (7.2.9), (7.2.15), (7.3.1); VIII §1, §3, §6, §7;
  IX 9.1.5–9.1.6) are unverified; the statements they support were checked mathematically.
- `nekovar-sc` (Nekovář, *Selmer complexes*): the author-page URL returns HTTP 403; the Numdam copy
  of Astérisque 310 was not fetched by the service. Every Nekovář locator in D7 and R02.1.5 is
  unverified; the statements were checked mathematically where a finite instance exists.
- `rubin-es` (Rubin, *Euler Systems*): the README cites an author draft with no URL; the service
  finds only the De Gruyter landing page. Appendix B and Chapter I locators are unverified.
- `qian-potaut` (Qian, *Potential automorphy for `GL_n`*): the NSF PAR link is in no licence class
  for the service; Lemmas 2.1–2.2 unverified.
- `schmidt-wingberg-safarevic` (arXiv math/9809211): fetched, but image-only and OCR is not
  installed here; Definitions 8–9 and Lemma 10 unverified.
- Stacks Project tags, Pottharst, Groechenig–Wyss–Ziegler, Harari, Harari–Szamuely, Wood,
  Böckle–Juschka, Paškūnas–Quast, Poonen's class-field summary, LMFDB pages and Serre's *Linear
  representations* were not opened (not in the sample; the statements they support were checked
  mathematically).
- Ownership against open pull requests was checked only through `roadmaps grep` and the sibling
  checkouts the brief lists; `ProfiniteCohomologyPartII`, which the merge order names, has no files
  anywhere I could read.

These items are listed in the job's `needs-references.toml`.

## Source issues

- **Misprint** in milne-adt at Remark 5.2(a), printed p. 67: the rewritten Euler characteristic
  formula has `H⁰(G_v, M)` in its denominator; it should be `H⁰(G_v, M^D)`, as the derivation two
  lines above gives; affects nothing (Theorem 5.1 is correct; the README already notes it).
- **Gap** in harpaz-wittenberg-massey at Lemma 5.5, p. 19: the lemma treats `Hom(C, A)` as a
  discrete `Γ`-module for an arbitrary discrete `C`, but for `C` not finitely generated the torsor
  cocycle need not be continuous for the discrete topology; it should assume `C` finitely generated
  (as in every application in the paper) or use the pointwise topology; affects nothing in the
  paper (its `C` are finite), and the README's *Pointwise Hom of discrete modules* repairs it.

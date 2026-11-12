# Review of IntegralHeckeAndGaloisDeterminants (pull request #1689 at 4d32e6c)

**Verdict:** needs changes

This is a full review: the folder changed by 388 lines since `d966840`. All six findings of the previous review are repaired (section *Previous findings* below). Four new findings follow: one P2 and three P3.

- R01 (P2) comes from an ownership check against ReductiveGroups on main.
- R03 and R04 come from objects now at the Tau Ceti pin.
- R02 comes from scratch derivations that elaborate.

The gate passes. Locations are in `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md` unless another file is named.

## R01 (P2) — Rational cohomology and algebraic induction have two owners: ReductiveGroups §1.1 on main and §0.7 here

**Location:**

- README:37–38 lists, among what this roadmap owns: "rational cohomology of a flat affine group scheme".
- README:79–80: "its layers 6A and 10B consume the generic cohomology and induction constructed here."
- README:1255–1297 (*Rational cohomology of a flat affine group scheme*) and README:1319–1334 (*Algebraic induction*: "Construct this arbitrary-base induction on the native comodule and corestriction carriers").

**Claim:** This roadmap owns rational cohomology (cofree resolution, Hochschild complex, connecting maps) and algebraic induction with Frobenius reciprocity, and ReductiveGroups consumes them.

**Witness:** ReductiveGroups on main, README:66–67: "IntegralHeckeAndGaloisDeterminants §0.7 states the rational cohomology and induction of Layer 1.1; it is a consumer of Layer 1.1". Its §1.1 (:1085–1186) states the same complex, injectives, connecting maps and induction.

**Detail.** ReductiveGroups §1.1 owns the following:

- enough injectives;
- the complex `M ⊗ H^⊗n` and its cofaces;
- cofree acyclicity;
- the coefficient-last permutation;
- connecting maps;
- the antipode comparison with `f(gh)=h⁻¹f(g)`.

It pins induction to Tau Ceti `TauCeti.Comodule.induced` and `TauCeti.Comodule.inducedEquiv` (`TauCeti/Algebra/Coalgebra/Comodule/Induced.lean:102, :215`). The two roadmaps compute the same objects. ReductiveGroups gives `d⁰(1)=1⊗(t−1)` on the weight-one line of `ℤ[t,t⁻¹]`, and §0.7 here gives `τ₁d⁰(1)=(t−1)⊗1`. Both give rank three for `Ind_{C₂}^{S₃}(ℤ)`.

**Repair:**

- **Delete from §0.7 what ReductiveGroups §1.1 owns.** That is:
  - enough injectives, the augmented cofree resolution and the Hochschild complex;
  - `H⁰ = ker(ρ − (m ↦ m⊗1))` and cofree acyclicity;
  - the coefficient-last comparison, functoriality, and connecting maps with their exactness;
  - all of *Algebraic induction*: the equalizer, reciprocity and the Jantzen-convention involution.
- **Cite the suppliers** under *Exact supplier contracts*: "ReductiveGroups §1.1, *Rational cohomology and algebraic induction*", and Tau Ceti `TauCeti.Comodule.induced`, `TauCeti.Comodule.inducedEquiv` and `TauCeti.Comodule.inducedMap` in `TauCeti/Algebra/Coalgebra/Comodule/Induced.lean`.
- **Keep as a target** only the invariant product `H^i(M) × H⁰(N) → H^i(M⊗N)` and its compatibility with connecting maps (README:1293–1297). ReductiveGroups §1.1 does not state it.
- **Fix the ownership wording.** Delete "rational cohomology of a flat affine group scheme" from README:37–38 and README:605–606, 633–635. Rewrite README:79–80 to say that this roadmap consumes ReductiveGroups §1.1.
- **Repoint the dependencies** to ReductiveGroups §1.1: the *Needs:* lines at README:4181, 4186, 4244–4245, 4329 and the dependency paragraphs at README:1690, 1712 and 5277.

ReductiveGroups is on main, so this adds no upward edge. No roadmap cites §0.7 for these two targets: `roadmaps grep` finds §0.7 citations only for the invariant-word colimit and the pseudocharacters.

## R02 (P3) — Two Lean headlines are special cases of other headlines in the same file

**Location:**

- `Suggested.lean:440`, `Determinant.existsUnique_descent_kerLift`. Its docstring says "the nilpotence exponent of the error ideal is quantified separately".
- `Suggested.lean:188`, `Determinant.exists_unique_trace_eq [Algebra ℚ A]`.

**Claim:** Each states a separate headline result.

**Witness:** Both derivations elaborate in a scratch copy, with the 22 `sorry` warnings and nothing else. The descent is the compact-gluing theorem at `ι := Unit`. The ℚ case is `exists_unique_trace_eq_of_isUnit (Or.inl hu)`, where `hu` is the image of the unit `((2d)! : ℚ)`.

**Detail.** The descent derivation sets `φ := fun _ ↦ RingHom.kerLift φ` in `existsUnique_isCoefficientChange_of_compact` and takes three tactic lines.

**Repair:**

- **`Suggested.lean`.**
  - Delete both theorems (:186–189 and :435–449).
  - Remove "coefficient descent through a Hecke comparison (IHG.5)" from the module docstring.
  - Add one docstring sentence: the IHG.5 descent is the one-map case of the IHG.4 gluing theorem.
- **README.**
  - Drop the *Lean:* lines at README:1004 and README:3458.
  - Reword README:995 and README:3444–3445 so they no longer backtick the deleted names (the gate checks backticked names). Keep both targets as prose.
  - In §5.1, add that the target is `Determinant.existsUnique_isCoefficientChange_of_compact` with one map.

## R03 (P3) — Supplier contracts cite roadmap sections for declarations that are at the Tau Ceti pin

**Location:**

- README:107, 548–553, 3618–3619, 3658–3664, 5279–5281: "`TauCeti.Iwasawa.fittingIdeal_le_annihilator`, owned by PadicMeasuresIwasawaAlgebras §4.5", for finitely presented modules.
- README:131–132 and 518: "ProfiniteCohomology, layer 2, `B1`, `explicitRes1`".
- README:557–558: "SchemeAndStackFoundations §0.20 supplies `Ring.IsJapanese`, `Ring.IsNagata`".

**Claim:** These declarations are roadmap targets.

**Witness:** Tau Ceti `2fd255d9` has:

- `TauCeti.fittingIdeal_zero_le_annihilator` (`FittingIdeal/Determinant.lean:143`, for finite modules);
- `TauCeti.ContCohomology.B1` (`LowDegree.lean:184`) and `explicitRes1` (`ExplicitFunctoriality.lean:608`);
- `TauCeti.Ring.IsJapanese` (`Japanese.lean:125`) and `TauCeti.Ring.IsNagata` (`Nagata.lean:65`).

**Detail.** SchemeAndStackFoundations §0.20 on main (README:1477–1478, 1542–1543) states its complete-local theorems on Tau Ceti's predicates.

**Repair:**

- List the five declarations, with their files, under *From Tau Ceti*.
- Point Layer 6's *Fitting annihilator bound* and the §6 dependencies at `TauCeti.fittingIdeal_zero_le_annihilator`. Delete the PadicMeasuresIwasawaAlgebras §4.5 supplier and the "finitely presented, so this form suffices" remark.
- Keep SchemeAndStackFoundations §0.20 only for `Ring.IsJapanese.of_complete_local` and `Ring.IsNagata.of_complete_local`.

Over `ℤ`, `Fitt₀((ℤ/2)²) = (4) ≤ (2) = Ann`, which matches the existing Check at README:3669.

## R04 (P3) — §6.5 claims as its own work the Koszul cohomology complex and its annihilation by the ideal, both at the Tau Ceti pin

**Location:** README:4564–4567 (*Generic combinations of an ideal containing a regular sequence*): "This target owns the Koszul-cohomology argument: define the cochain complex `Hom_A(K(b), A)`, … and prove that multiplication by every element of `(b)` is nullhomotopic."

**Claim:** The cochain complex and the annihilation of its cohomology by the ideal `(b)` are new here.

**Witness:** `TauCeti/RingTheory/KoszulComplex/Cohomology.lean` at the pin:

- defines Koszul cohomology as the cohomology of `(koszulComplex φ).linearYonedaObj R N`;
- proves `smul_cohomology_eq_zero` (:47, via `smulHomotopy`);
- proves `span_le_annihilator_cohomology` (:70): `Ideal.span (range x)` annihilates every cohomology group.

**Detail.** For `x = (2)` over `ℤ`, `H¹ = ℤ/2` and `2` kills it.

**Repair:**

- Add `TauCeti/RingTheory/KoszulComplex/Cohomology.lean`, with these two theorems and the carrier, to the Koszul paragraph under *From Tau Ceti* (README:441–449).
- Cite them in this target.
- Keep as the target's own content only the vanishing of `H^q` for `q < d` and the degree-zero identification with the common annihilator.

## Previous findings (r6), checked against this head

- **R01 — repaired.** `Suggested.lean:147–153` states `Determinant.exists_vaccarino`:
  - `ψ` maps `RingQuot.mkAlgHom ℤ (commRel _) ((RobyAlgebra.gamma ℤ (FreeAlgebra ℤ X) d).ground x)` to `(genericMatrices X d x).det`;
  - `ψ` is injective;
  - `ψ.range = vaccarinoSubalgebra X d`.

  The README has *Lean:* `Determinant.exists_vaccarino` at :906. The "absent at the pins" sentence is gone. `vaccarinoSubalgebra` uses all elements of `ℤ{X}`, as in Chenevier line 617–618.
- **R02 — repaired.**
  - `Suggested.lean:75–77`: "`isHomogeneous : toLaw.IsHomogeneousOfDegree d`", "`isMultiplicative : toLaw.IsMultiplicative`".
  - README:407–439 lists the Tau Ceti polynomial-law and Roby declarations.
  - §0.4 (README:860–874) keeps only the commutator quotient, the restriction to commutative `B` and base change.
- **R03 — repaired.** `Suggested.lean:635–637`: "`∃ _ : Module.Finite A (localModule L ρ χ ψ), Continuous[_, (IsLocalRing.maximalIdeal A).adicModuleTopology …]`". The gate reports `statement-hygiene=0`.
- **R04 — repaired.** `Suggested.lean:668–669`: "`∃ (M : ModuleCat.{u} A) (_ : Module.Finite A M) (κ : G → M), Continuous[_, …adicModuleTopology M] κ`".
- **R05 — repaired.** README:308 cites `TauCeti/RingTheory/Idempotents/Corner/Basic.lean`, and README:314 "`TauCeti.mul_mul_mem_cornerSubmodule`". Both resolve by `#check`.
- **R06 — repaired.** README:199–201 gives `1b1ccf4b088b…` and `2fd255d997f4…`, which equal `lake-manifest.json`. The description says "Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`".
- **Remarks.** All four are also settled:
  - README:304 now cites `Ideal.quotientKerEquivRange`, which resolves.
  - The local `HasDerivedCategory` instance is now a section variable `[HasDerivedCategory.{w} (ModuleCat.{u} A)]` (`Suggested.lean:348`).
  - `LinearMap.projectiveDet` is cited (README:451–455, 1157–1168).
  - The description now lists the four Tau Ceti imports.

## Verified sound

**Gate, dependencies, outside files.**

- My gate run printed `set_option=0 … statement-hygiene=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run adds `build=0`.
- The dependency check printed `depcheck: 234 roadmaps, 2113 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. `ORDER.txt` puts SmoothRepresentationsOfLocalGroups at 25 and this roadmap at 26.
- `git diff --stat origin/roadmap/smooth-representations-of-local-groups-v2...HEAD` outside the folder is empty.
- `overlaps.md` lists no pull request that changes this roadmap and no dropped id.

**Lean (elaborated with `lake env lean`).**

- An unmodified copy of `Suggested.lean`, with `#check @name` for all 59 declarations and the two R02 derivations, gave exactly 22 `declaration uses 'sorry'` warnings and nothing else.
- All 59 elaborated types equal the worker's `signatures.md` after normalising binder names. The six "looks dropped" leads are false positives:
  - five are the `[HasDerivedCategory.{w} …]` binder, which is present;
  - one is `[Algebra A R]` on `cycleTerm`, whose type does not need it.
- One-tactic probe: `first | rfl | (simp; done) | infer_instance | (simp_all; done) | trivial | decide` fails on all 22 theorems.
- `Determinant` takes `S : Type u` commutative semirings, through Tau Ceti's predicates (`Homogeneous.lean:73`, `Multiplicative.lean:71`). Over a ring `A` these are rings, so the predicates are Chenevier's.
- `RobyAlgebra.gamma` has ground value `γ_d(x)` (`RobyAlgebra.lean:409`).

**Library citations at the pins.**

- All 56 `Mathlib/…` and `TauCeti/…` paths in the README exist.
- Of the 229 backticked library names, 223 resolve by `#check` against Mathlib and 30 Tau Ceti modules. The other 6 are in modules without object files, and I read them in the pinned source:
  - `baseChangeHomogeneousEquiv` (`BaseChange.lean:200`) and `symmetricTensorEquiv` (`SymmetricTensor.lean:277`);
  - `exactAt_of_isWeaklyRegular` (`Regular.lean:140`);
  - `tensorIso` (`Tensor.lean:319`) and `tensorIsoAppend` (:340);
  - `satakeParameters` (`Satake.lean:91`).
- I searched by object at the pins for:
  - polynomial-law kernel, characteristic polynomial and pseudocharacter;
  - absolute irreducibility, Cayley–Hamilton algebra, generalized matrix algebra;
  - ghost, telescope, Vaccarino, Buchsbaum–Rim, good filtration;
  - rational cohomology, induction, Fitting annihilator, Japanese and Nagata rings, Koszul cohomology, stable lattices.

  This search gives R03 and R04 and the induction part of R01. Two further hits need no change. `Matrix.mvPolynomialX` is the one-letter generic matrix, not the multi-letter `genericMatrices`. Tau Ceti's `Representation.exists_stable_lattice` is the first step inside the classical Ribet route.

**Cross-roadmap citations resolved.**

- ReductiveGroups §1.1 and :66–67 on main (R01).
- SchemeAndStackFoundations §0.20 (:1448, :1477, :1542) and §2.22 `IsAzumaya.exists_etale_matrix_splitting` (:4626, :4718).
- PadicMeasuresIwasawaAlgebras §4.5 (:2695–2702) and §5.1 `projectiveDeterminant_constantRank`, `projectiveDeterminant_baseChange` (:3213–3214).
- ClassFieldTheory layer 7 `geometricArtinMap`, `isArithFrobeniusLift_of_mk_eq_artinMap_uniformizer` (:1204, :1224, :1229).
- Completed/Chebotarev layer 10 (:410).
- ProfiniteCohomology layer 2 (:1022) and ModularForms layer 9 (:1016, `X²−aₚX+χ(p)p^(k−1)`).
- DerivedModuleAlgebra (:122, :126), whose Tau Ceti names are the ones the README now lists.
- SemisimpleAlgebras layers 0, 2, 3, 4, 5. All README anchors match their headings.
- SmoothRepresentationsOfLocalGroups in this branch's base:
  - *gln-generators* (:3357), *gsp4-spin-polynomial* (:3599), *gsp4-galois-comparison* (:3623);
  - *One integral finite-wild cocycle scheme* (:5027) and *Finite-wild excursion algebra* (:5139);
  - its downstream rows naming IHG.3a (:5320–5321).

**Ownership against open pull requests.** I ran `roadmaps grep` for Vaccarino, Cayley–Hamilton, determinant laws, ghosts, Ribet modules, Buchsbaum–Rim, generalized matrix algebras and good filtrations.

- ArithmeticGaloisRepresentations, GlobalGaloisDeformations, TorsionCohomologyInfrastructure, DeformationAndDerivedPatchingAlgebra and IgusaVarietiesAndTorsionConcentration cite this roadmap as their owner.
- LanglandsParameterStacks (order 80) owns good filtrations over fields, not the integral `GL₂/ℤ` form here.
- No second owner was found among open pull requests.

**Seeded sample: sources read at the locators.** Each row gives what was checked, the result, and the locator's printed page.

| Target | Source lines read | Result |
|---|---|---|
| 0.1 | Tau Ceti `Homogeneous.lean:73`, `Multiplicative.lean:71`, `algHomEquiv` | Declarations as cited |
| 0.2 | Chenevier: §1.5 (line 350), Remark 1.4 (344), Ex 1.8 and Lemma 1.9 (411, 435), §1.10 and (1.3) (452–490), Lemma 1.12(i),(iii) (493–495) | p.9, pp.10–11, p.12 as cited. Lemma 1.12(iii) has no invertibility hypothesis. The definition is for `d ≥ 1`, and the README makes `d = 0` an explicit convention |
| 0.4 | Chenevier: Prop 1.6 (371), Ex 1.7(iv) (398), Thm 1.15 (619), with `E_X(d)` over all `w ∈ ℤ{X}` (617). Emerson–Morel Thm 1.12 (176) | pp.9–10, p.15, p.5 |
| 0.6 | Quast §3.4 dual by transpose-inverse (646–652). Chenevier Ex 1.7(ii) (392–395), Ex 2.5 (1060). Grothendieck Thm 5.1 (370), 5.10 (453), §5.13 (483) | p.17, p.10, p.26, pp.210–213 (PDF page + 197) |
| 0.7 | Quast: Def 3.1 (410), Lemma 3.2 (442), Def 3.10 and Lemmas 3.11–3.12 (619–633), §3.6 and Ex 3.14 (695, 702), Lemma 3.18 (748), Prop 3.19 (762), Thm 3.20 (777). BHKT Def 4.1, Lemma 4.3 (590, 605). Emerson–Morel Thm 4.1 (522). DKSW Def 4.1 (917) | pp.10–20, pp.13–14, pp.13–15, p.22 as cited. Quast invariants are under `G⁰`, which the README notes |
| 1.1 | Chenevier: §1.17 (649–718), Ex 1.20(ii) (725), Lemma 1.21 (731) | pp.16–18 |
| 1.3 | Chenevier: Lemma 2.10(i) (1152), Thm 2.22 and proof (1404–1438), Lemma 2.6 (1075). ANT Thm 2.4, Prop 2.5 (198, 213). BC Def 1.3.1 (776), Lemma 1.3.5 (859), Lemma 1.4.3 (1218), Thm 1.4.4 (1276), Props 1.3.9 and 1.3.13 (923, 1086). Wang–Erickson Def 2.22, (2.3), Prop 2.23 (721, 732, 747). CN Prop 3.2.4(1)–(3) (2479–2496) | All pages as cited |
| 1.7 | Emerson–Morel Thm 4.1 (522). Chenevier Thm 2.12 with `ker ρ = ker D` (1165–1168). BIP Lemma 3.1 (480) | pp.13–15, p.28, pp.10–11 |
| 2.1 | Boxer–Pilloni Lemma 2.4.3 and proof (892–902). ACC images (977–1000), Lemma 2.2.4 (1003) | p.18; p.920 (PDF page + 896) |
| 2.2 | ACC proof of 2.2.4 with `φ₀∘…∘φ_d` (1007–1012). Stacks 0325 (algebra line 20551). Bökstedt–Neeman Cor 1.7 (139), Prop 3.2 (362) | pp.920–921, p.213, p.221 |
| 2.3 | Bökstedt–Neeman Def 2.1 and Rem 2.2 (149, 153). Boxer–Pilloni Lemma 2.4.6 (948). Calegari–Geraghty `lim(U−β)^{n!}` (3323). Stacks 00M9 (10498) | p.213, p.19, p.73 |
| 5.1 | Scholze: Def 5.1.8 (3514), Rem 5.1.9 and Cor 5.1.10 (3519, 3537), Thm 5.4.1 and proof (4313–4356) | p.1037; pp.1058–1059 |
| 6.1 | DKSW: (13) (291), (14) (300), Lemma 2.3 (301), Thm 2.1 (235), Thm 1.1 (67). Stacks 00IN (5678), 032W (20974) | pp.8–9, pp.7–8, pp.2–3 |
| 6.3 | DKSW: (35)–(38) (727–755), (39)–(42) (778–803), Lemma 3.1 (807), Lemma 3.2 and (47) (834, 877), Cor 4.17 (1120), Lemma 4.18 (1221). arXiv v2 printed pages equal its PDF pages (17, 43, 46) | pp.17–21, p.27, p.30 |
| 6.5 | Buchsbaum: Lemma 1.1 (68), definitions (90, 122), Prop 2.1 and Cor 2.2 (183, 188), Thm 2.9 (314), Lemma 2.11 (396), Prop 3.1 (440). DKSW Def 5.1, Thm 5.2, Lemma 5.4 (1505–1514), (60)/(62) (1476, 1497), Lemma 5.11, Cor 5.12, Prop 5.13, Prop 5.14 (1776–1895). Stacks 068P (more-algebra 3814), 0663 (3244) | pp.184–194 (PDF page + 182), pp.36–46 |

Also read for the headlines: GG Lemma 7.1.1 (GG line 1195; p.25) and CHT Lemma 2.1.10 (CHT line 490; p.13).

**Adversarial pass (computed this round).** One row per statement: the instance, the computed values, and the result.

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| `Determinant` (Lean :71) | `x ↦ x²`, `x ↦ 2x²` on `ℤ`, `d = 2`; `d = 0` | `(sx)² = s²x²`, multiplicative; `2·1² = 2 ≠ 1`; degree 0 gives `D(x) = D(0·x) = D(1) = 1` | Agrees |
| Trace-blind determinants (§0.2) | `f ↦ f(0)²`, `f ↦ f(1)²` on `𝔽₂[T]` | `χ(T) = X²` and `X²+1`; `Λ₁ = 0` for both | Agrees |
| `trace` (Lean :88) | `[[2,3],[4,5]]`; `d = 0` | `χ = X²−7X−2`, trace `7`; `0` | Agrees |
| Two-dimensional determinants (§0.2) | `g = diag(2,3)`, `h = 1` | `6·(1/2+1/3) − 5·2 + 5 = 0` | Agrees |
| `IsPseudocharacter` (Lean :171) | `tr` on `M₂`, `x_i = I`; `d = 0` | `8 − 12 + 4 = 0`; the `S₁` sum is `T(x₀)`, which forces `T = 0` | Agrees |
| `exists_vaccarino` (Lean :147) | `X = ∅`; `d = 0, 1`; `d = 2` with one letter | `Γ^d(ℤ) = ℤγ_d(1)`, `ψ(γ_d(n)) = det(nI) = n^d`; `ψ = id`; `ψ(a) = x_{a,0,0}`; `tr M`, `det M` independent; `x₁₂ ∉ ℤ[tr M, det M]` | Agrees with Chenevier line 619 |
| Coordinate ring (§0.4) | `R = A`, `d = 0, 1, 2` at `3` | laws `1`, `3`, `9`; `Z = A` | Agrees |
| `eq_of_charpoly_eq` (Lean :100) | trivial monoid, `d = 2` | `χ(1) = (X−1)²` for both; `D(7) = 49` | Agrees |
| `isPseudocharacter_trace` (Lean :178) | `d = 0` | `trace = 0`, `T(1) = 0 = d` | Agrees (Chenevier line 495) |
| `injective_trace` (Lean :183) | `𝔽₂`, `d = 2`, the two laws above | equal traces, distinct laws; `2!` not a unit | Hypothesis necessary |
| `exists_unique_trace_eq_of_isUnit` (Lean :193) | `d = 0`; `d = 1` | `(0)! = 1`, `T = 0`, unique `D = 1`; `(2)!` unit, `T` multiplicative, `D = T` | Agrees with Chenevier lines 841–845 |
| `exists_unique_trace_eq` (Lean :188) | `ℚ`-algebra | `((2d)! : A) = algebraMap ℚ A (2d)!` is a unit | Special case of the row above (R02) |
| `existsUnique_of_isAzumaya` (Lean :201) | `M₂(A)`; zero ring; `ℍ` | `det`; empty spectrum gives the unique law; `Nrd(i) = 1` | Agrees |
| Dual (§0.6) | `diag(2,3)` | `X² − (5/6)X + 1/6` | Agrees |
| Projective determinant (§0.6) | swap on `A²`; rank 0 | `−1`; `1` | Agrees |
| Compatible evaluation (§0.7) | `x = diag(2,1)`, `g = [[1,1],[0,1]]`, `h = [[1,0],[1,1]]`, `f = tr(xy)` | `tr(x·gh) = tr([[4,2],[1,1]]) = 5`; `tr(x·hg) = tr([[2,2],[1,2]]) = 4`; `mergeLast(2,3,5) = (2,15)` | Agrees |
| CH ideal (§1.1) | `X ↦ 0` on `ℤ[X]`, degree 1; identity on `ℤ` | `CH = (X)`; `CH = 0` | Agrees |
| `exists_semisimple_realization` (Lean :226) | `n ↦ [[1,n],[0,1]]` over `ℂ` | realization `diag(1,1)`; `ρ(g−1) = 0 ⇔ g−1 ∈ ker D` | Agrees (Chenevier line 1168) |
| Inner conjugacy (§1.3) | `U = [[1,1],[0,1]]` over `ℤ₃` | `U E₀₀ U⁻¹ = [[1,−1],[0,0]]` | Agrees |
| `exists_realization_of_henselian` (Lean :241) | `d = 0` | excluded by `0 < d` in `IsAbsolutelyIrreducible` | Agrees |
| Adapted ring and GMA determinant (§1.3) | `M₂`; scalar blocks | `A[b,c]/(bc−1)`; `ad − φ(b,c)` | Agrees |
| `coefficient_descent` (Lean :257) | `A = B` | `P = 1`; `he` gives `m_B ∩ A = m_A` | Agrees with CHT line 490 |
| `symplectic_coefficient_descent` (Lean :282) | residue characteristic 0 | `CharP _ 0` and `2 < 0` is false, so excluded, as GG line 1196 ("> 2") | Agrees; `ρ_A` continuous because `m_B^N ∩ A ⊆ m_A^n` (Chevalley) |
| `classical_ribet_lattice` (Lean :315) | `[[χ,b],[0,ψ]]` conjugated by `[[1,v],[0,1]]` | upper entry `b + v(ψ−χ)` | Negated clause is exactly non-splitting |
| GL `P` and `Q` (§3a) | `n=2, q=2, T=(1,3,5)`; `Q(2,1,3,5)`; `P(2,2,3,5)` | `X²−3X+10`; `X⁴−3X³+20X²−24X+64`; `X⁴−(3/2)X³+(15/2)X²−6X+16 = X⁴Q(8/X)/Q(0)` | Agrees |
| Satake, inversion (§3a) | `s=2, z=(3,5)`; `q=2, T=(1,5,3)` | `X²−16X+60 = (X−6)(X−10)`; `ι(P) = X²−(5/3)X+2/3 = 4·P^rec(X/2)` | Agrees with ACC p.932 |
| `derived_hom_finite` (Lean :365) | `ℤ[0], ℤ[0]`; support `[1,0]` | `Hom = ℤ`; object `0` | Agrees |
| `ghost_nilpotence` (Lean :371) | `δ : 𝔽₂[−1] → 𝔽₂[0]` on `[0,1]` | `H⁰(δ) = H¹(δ) = 0`, `δ ≠ 0`, `δ² = 0` | Exponent `b−a+1 = 2` sharp |
| Summands, telescope (§2.2–2.3) | `e(a,b) = (a,0)` at `(2,3)`; `t = −1` | `(2,0)`; `[0,3] + [1,3] = [1,−3] + [1,3] = 0` | Agrees |
| `eq_of_charpoly_frobenius` (Lean :386) | conjugate `ghg⁻¹` | `D(g)·D(X−h)·D(g⁻¹) = χ(h)`; equalizer closed in a T2 space | Agrees with no ring topology needed |
| `existsUnique_isCoefficientChange_of_compact` (Lean :397) | `𝔽₂×𝔽₃` with both projections; empty family | `1+1 ↦ (0,2)`; injectivity into a point forces `A = 0`, which has a unique law | Agrees (Chenevier Ex 2.32, line 1560) |
| `existsUnique_interpolation` (Lean :415) | `ℤ₂`, `J_r = (2^r)` | `D_s mod J_r = D_r` by uniqueness over discrete `A/J_r`; `⋂ J_r = 0` gives T2 | Compatibility follows; agrees |
| `existsUnique_descent_kerLift` (Lean :440) | `ι = Unit` in the row above | 3-line derivation elaborates | Special case (R02) |
| Descent Checks (§5.1) | `ℤ/4 → 𝔽₂` | `(X−3)(X−1) = X²−4X+3 ≡ X²+3 ↦ X²+1 = (X−1)²` | Agrees |
| `generic_combinations_regular` (Lean :468) | `(2)` in `ℤ` vs `ℤ/4`; `(x)` with `ℓ = 2` | `2V` regular, kills `2` in `ℤ/4`; `V₁` kills `V₂x` modulo `V₁x` | Hypotheses necessary |
| `mixed_scalar_regular` (Lean :488) | `n = k = 0`; block `{3,4}`, `u = 2`, `ℓ = 3` | generic combinations of `u` variables, `ℓ ≤ u`; `b₂·b′₁ ≡ 0` modulo `b₁` and the minor | Agrees; bound sharp |
| Difference modules and cocycle (§6.1) | `[[1,n],[0,1]]`; `ℤˣ` scalar; `g = diag(2,3)`, `h = U` | `Δ = ℤE₁₂`, `M₀ ≅ ℤ`; `M₀ = 2ℤ/4ℤ`; `κ(gh) = 2/3 = 0 + (2/3)·1` | Agrees |
| Local relation matrix (§6.3) | `Y_σ = [[1,2],[3,4]]`, `Y_τ = [[5,6],[7,8]]`, `x = 9, 10` | `A = 14−16 = −2`, `B = 10−48 = −38`, `C = 6−35 = −29`, `D = 18−25 = −7` | Agrees |
| Exterior contraction (§6.5) | `ℤ²` | `ω(e₁*∧e₂*)(e₁∧e₂) = 1`; composite `−1` | Agrees with Buchsbaum line 68 |
| `local_ribet` (Lean :615) | `S = ∅`; scalar, `Σ = {v₀,v₁}`; weight `2`, minor `5` | `N = M₀`; `N = A y_{v₁}`; `10 ∈ (2)`, `5 ∉ (2)` | Agrees |
| `global_ribet` (Lean :658) | `I = T`; `(ℤ/2)²` with trivial `ρ` | `M = 0`, `Fitt = T`; `N = ℤ/2`, `Fitt₀ = (2)` | Agrees |
| R01 objects | weight-one line of `ℤ[t,t⁻¹]`; `Ind_{C₂}^{S₃}` | `(t−1)⊗1` here, `1⊗(t−1)` there; rank 3 in both | Same objects in two roadmaps |
| R03 Fitting bound | `(ℤ/2)²`, finite but not assumed finitely presented | `(4) ≤ (2)` by `fittingIdeal_zero_le_annihilator` | The pinned form suffices |
| R04 Koszul | `x = (2)` over `ℤ` | `H¹(Hom(K(2),ℤ)) = ℤ/2`, killed by `2` | As `span_le_annihilator_cohomology` |

## Not verifiable

- **Jantzen**, *Representations of Algebraic Groups* (2003), cited in §0.7 and §6.4. It is not in the sources cache, and earlier rounds found no legal copy. The cited statements now rest on ReductiveGroups §1.1 and DKSW (R01).
- **Fargues–Scholze, Definition VIII.3.4** (*Untwisted excursion comparison*) is outside the sample and was not opened.
- **Buchsbaum**: the Brandeis copy failed with an SSL error. I read the AMS open-archive copy instead, which has the same journal pages (183–196).

## Source issues

No new source issue was found this round. The nine issues recorded in the r5 report stand.

- none

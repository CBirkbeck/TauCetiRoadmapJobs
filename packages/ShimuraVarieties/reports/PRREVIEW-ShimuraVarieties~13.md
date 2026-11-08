# Review of ShimuraVarieties (pull request #933 at ff31cd8)

**Verdict:** needs changes

This is a full review of the folder at `ff31cd8`. It changed by 219 lines since `6ad2612`, the head the previous review read. The three findings of that review are repaired. This review has five findings: one P2 and four P3.
- **P2.** The Mumford–Tate group is owned both here and in ShimuraData.
- **P3.** Prerequisites §§P.5 and P.6 appear in no dependency line.
- **P3.** The References list omits the source of the new `R_an,exp` headline.
- **P3.** One sentence of §3.4b is narrower than its Lean theorem.
- **P3.** One structure field has no docstring.

What I ran, and found clean:
- the gate and the dependency check;
- elaboration of `Suggested.lean`;
- a `#check` file for all 38 declarations;
- five one-tactic probes;
- the source sample, at every readable locator;
- the cross-roadmap ids, in both directions.

## Previous findings

- **R01 (r12, P2: §3.5a's `R_an,exp` theorem was statable but absent). Repaired.**
  - `Suggested.lean` lines 387–409 now declare `ranExpLanguage`, `ranExpStructure` and `exists_oMinimalStructure_ranExp`.
  - The module docstring (lines 27–30) describes them, and the old "lacks `R_an,exp`" clause is gone.
  - README lines 3, 47 and 147 describe them, and line 914 names them.
  - The instance is named `ranExpStructure`, and README line 914 uses that name.
- **R02 (r12, P3: twenty o-minimal API lemmas were padding). Repaired.**
  - All twenty declarations are deleted. `Suggested.lean` now has 27 theorems (46 − 20 + 1).
  - README lines 802, 806–808, 836 and 857–858 keep the statements as prose, without the deleted names.
  - No roadmap at main or at an open head cites a deleted name (`roadmaps grep` over all 20).
- **R03 (r12, P3: the Lean file had no Layer headers). Repaired.**
  - `Suggested.lean` line 72 reads `/-! ## Layer 3: Algebraicity and complex compactification functoriality -/`, and line 411 reads `/-! ## Layer 5: Complex multiplication and Siegel existence -/`.
  - These match README headings 706 and 1397.

## R01 (P2) — The Mumford–Tate group has two owners: §7.0i.1 here and ShimuraData §§1.2–1.4

**Location.**
- README line 13: "Section 7.0i.1 owns, for an abelian variety over a number field, its Mumford–Tate group with connectedness and reductivity".
- README line 2895: "ShimuraData §§1.2–1.4 construct the Mumford–Tate group of an arbitrary rational Hodge structure, with its connectedness and … reductivity".

**Claim.** The README treats both constructions as owned and only asserts that they agree on `H¹` of an abelian variety. As a result, the group `MT(V_B)`, its connectedness and its reductivity have no single owner.

**Witness.** In ShimuraData's README (#1038 head), §1.2 constructs `mumfordTateGroup` (line 185), §1.3 proves `mumfordTateConnected` and §1.4 proves `mumfordTateReductive`. Their *Needs:* lines cite no ShimuraVarieties section. ShimuraData is merge-order line 113; this roadmap is line 100.

**Repair.** This roadmap comes first in the merge order, and ShimuraData already cites its §§P.1–P.5, so the general construction moves down to §7.0i.1.
- **Generalize §7.0i.1.** Construct `𝐆 = MT(V)` for every finite-dimensional rational Hodge structure `(V,h)`, then specialize to `V_B`. None of the following uses `V = H¹(A)`:
  - the Hopf-ideal intersection;
  - the finite-family argument;
  - connectedness, which follows from `S` being connected;
  - the orthogonal-complement reductivity proof, with a polarization of `V` in place of `ψ`.
- **Keep two hypotheses explicit.** Both were tested on instances:
  - Reductivity needs polarizability. ShimuraData's §1.4 Check gives the counterexample: a 2-dimensional complex torus that contains an elliptic curve but is not isogenous to a product. Its weight-one `H¹` has a sub-Hodge structure without a complement, so `MT` is not reductive.
  - "Contains the homotheties" needs nonzero weight. For `ℚ(0)`, `MT` is trivial. For ShimuraData's weight-zero `ℚ(ζ₅)` example, `MT` is a 2-dimensional norm-one torus without scalars.
  - The untwisted-tensor description and the Galois and Frobenius statements stay specific to `V_B`.
- **Line 13.** Write: "Section 7.0i.1 owns the Mumford–Tate group of a finite-dimensional rational Hodge structure, its connectedness, the reductivity of the polarizable case and, for an abelian variety over a number field, …".
- **Line 2895.** Replace the ShimuraData sentence by: "ShimuraData §§1.2–1.4 consume the Mumford–Tate group of §7.0i.1, with its connectedness and polarizable reductivity."
- **ShimuraData.** That roadmap then replaces its §§1.2–1.4 constructions by this citation. Its own review handles that.

## R02 (P3) — §§P.5 and P.6 are recorded as a dependency nowhere, and §1.2's general-level claim cites neither §P.6 nor its source

**Location.** Several sections use the two prerequisites:
- §P.6, line 209: "Build this before §1.2 and use it for boundary sheaves in Layer 2."
- §1.2, line 368: "the analytic finite quotient by the actual `K/K′` action gives the same space".
- §P.5, line 199, supplies "the positive rational approximation used in §4.8".
- §4.9a, line 1307, takes "the regular semisimple `Lie` open of §P.5".

**Claim.** The *This uses* lines and the layer Dependencies omit §§P.5 and P.6, so the dependency record of these sections is incomplete.

**Witness.**
- The anchors `#p5-real-approximation-and-maximal-tori` and `#p6-finite-analytic-quotients-and-bundle-descent` occur zero times in the README.
- The following lines omit them:
  - the *This uses* lines of §1.2 (line 383), §2.5 (line 612), §3.5 (line 910) and §4.8 (line 1282);
  - the Dependencies of Layer 1 (line 507), Layer 2 (line 702) and Layer 4 (line 1393).
- §1.2 cites only SVI §5, pp.57–58. That passage treats sufficiently small `K` (milne-svi lines 2509–2519). The normal analytic and algebraic structure when `Γ` has torsion is SVI Remark 3.13(a), p.39 (milne-svi line 1722).

**Repair.**
- Add `[Local datum foundations, §P.6](#p6-finite-analytic-quotients-and-bundle-descent)` to:
  - the *This uses* lines of §§1.2, 2.5 and 3.5;
  - the Dependencies of Layers 1–3.
- Add `[Local datum foundations, §P.5](#p5-real-approximation-and-maximal-tori)` to:
  - §4.8's *This uses* line;
  - a new *This uses* line for §4.9a;
  - the Dependencies of Layer 4.
- Add "Remark 3.13(a), p.39" to §1.2's locator.

These are anchor additions only. The headings exist at lines 197 and 207.

## R03 (P3) — References omits van den Dries–Miller, the source of the new `R_an,exp` headline, and other inline-cited works

**Location.** `## References`, lines 2897–2928.

**Claim.** The References list covers every source the roadmap cites. It does not.

**Witness.** §3.5a (line 914) and the docstring of `exists_oMinimalStructure_ranExp` cite van den Dries–Miller, Israel J. Math. 85 (1994), and its 1995 erratum. References has no entry for them. Also absent:
- Clozel 1986;
- Schmid 1973;
- Cattani–Kaplan–Schmid 1986;
- Peterzil–Starchenko;
- H. Cartan's quotient paper;
- Rydh;
- the Stacks Project;
- Margulis.

**Repair.** Add one bullet per missing work, with the edition and the locators already used inline. For example: "L. van den Dries and C. Miller, On the real exponential field with restricted analytic functions, Israel J. Math. 85 (1994), pp.19–56; erratum, 92 (1995), p.427." The manifest already has keys `vdd-miller` and `clozel86`, both settled `uncertified`.

## R04 (P3) — §3.4b states `definable_of_isSemialgebraic` for ordered rings; the Lean theorem assumes no compatibility

**Location.** README line 811: "Over any linearly ordered commutative ring, an o-minimal structure in which the graphs `{x∈R³ : x 2=x 0+x 1}` and `{x∈R³ : x 2=x 0·x 1}` are definable contains every semialgebraic set".

**Claim.** The README's generality equals that of `Suggested.lean`.

**Witness.** `Suggested.lean` line 147 has only `[CommRing R] [LinearOrder R]`, with no `IsStrictOrderedRing`. It therefore admits `ZMod 3` ordered `0<1<2`, where `2+1=0`. The theorem still holds there: the power-set structure satisfies all five axioms.

**Repair.** Change the sentence to: "Over any commutative ring `R` carrying a linear order, which need not be compatible with the ring operations, an o-minimal structure in which … contains every semialgebraic set".

This wider statement is true. Each set `{p>0}` is the projection of the graph of `p`, intersected with `{y : 0<y}`. The graph of `p` is built from the two graphs, the points (definable by condition 5) and the diagonals. No step uses compatibility.

## R05 (P3) — `CMType.star_mem_iff` has no docstring

**Location.** `Suggested.lean` line 423: `star_mem_iff : ∀ φ : E →+* ℂ, star φ ∈ toSet ↔ φ ∉ toSet`.

**Claim.** Every declaration, structure fields included, carries a docstring stating its mathematics.

**Witness.** The neighbouring field `toSet` (lines 421–422) and every field of `OMinimalStructure` (lines 81–99) have docstrings. This field has none.

**Repair.** Insert `/-- The conjugate `star φ` of an embedding lies in the type exactly when `φ` does not. -/` above line 423. I tested this on a scratch copy: it elaborates with the same 27 `sorry` warnings and nothing else.

## Verified sound

**Gate and dependency check.**
- My run of the brief's gate command gives:
  ```
  gate ShimuraVarieties: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```
  The worker's run adds `build=0`.
- The dependency check gives `depcheck: 245 roadmaps, 2476 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. ShimuraVarieties is merge-order line 100.
- Every open-PR supplier sits earlier in the merge order: AdelicAlgebraicGroups 35, AlgebraicModuliForArithmeticGeometry 36, ComplexComparisonPartII 43, AbelianSchemesAndArithmeticModuli 45, ArithmeticGaloisRepresentations 46, InverseGaloisAndArithmeticFundamentalGroups 48, NeronModelsAndSemistableAbelianVarieties 51, ArithmeticLocallySymmetricSpaces 68, ModularCurvesPartII 79, AutomorphicSpectralTheory 88, GL2AutomorphicRepresentationsAndTransfer 94, SmoothRepresentationsOfLocalGroups 26.
- The other suppliers are on main: ReductiveGroups, ReductiveGroupsPartII, ModularCurves, ClassFieldTheory, SchemeAndStackFoundations, AffineMorseLefschetz, AlgebraicCurves, and RepresentationTheory (with its LieGroups component, Layer 9: Cartan decompositions).
- No roadmap on the never-cite list appears in either file.
- The diff outside the folder is empty. The folder holds exactly `README.md`, `Suggested.lean` and `metadata.toml`.

**Lean.**
- **Elaboration.** `lake env lean` gives 27 `sorry` warnings and nothing else.
- **Form.**
  - Imports: `public import Mathlib` and `TauCeti.Geometry.RealAlgebraic.Semialgebraic.Dimension.Basic`, which exists at the pin `2fd255d9`.
  - None of the forbidden forms appears: no `set_option`, `lemma`, `#eval`, `#print`, `True` placeholder or sorry'd data.
  - `ranExpLanguage` is an `abbrev` with a real body. `ranExpStructure` is a `noncomputable instance` with real `funMap` and `RelMap`.
- **`#check` file.** I elaborated `#check @` of all 38 declarations and 13 library names once. Every elaborated type matches its README statement and carries the binders it needs:
  - the §§3.4c–3.4d theorems carry `[Nonempty R] [DenselyOrdered R] [NoMinOrder R] [NoMaxOrder R] [OrderTopology R]`;
  - §3.4e carries `[AddCommGroup R] [LinearOrder R] [IsOrderedAddMonoid R]`, and curve selection adds `[Nontrivial R] [TopologicalSpace R] [OrderTopology R]`.

  Nothing in the file changed. Only the R05 repair was tested, on a copy.
- **One-tactic probe.** I ran five scratch copies, each replacing `sorry` with `first | (T; done) | sorry` for `T` = `rfl`, `infer_instance`, `simp_all`, `aesop` and `exact?`.
  - No theorem closes: there are 27 `sorry` warnings in each run.
  - `exact?` finds nothing, and times out on `dim_union` and `dim_closure_diff_lt`.
  - The file contains no padding by this test.

**Sources: the seeded sample.** Printed page equals the page marker for milne-svi, milne-cm, milne-1999, milne-1984t, deligne82, bkt, the BKT erratum and BGST. milne-1983a is marker + 238.

| Target | What the locator says | Result |
|---|---|---|
| 0.2 | SVI Lemma 5.13 and p.58 (svi lines 2486–2519): `Γ_g` is congruence, so arithmetic. Commensurability and `Γ_b=qΓ_aq⁻¹` are the roadmap's deductions. | sound |
| 0.6 | SVI Thm 5.17 (line 2579, p.59); Lemmas 5.18–5.21 (lines 2604–2658, pp.60–61) | sound |
| 1.1 | SVI double coset before 5.13 (lines 2480–2485, p.57) | sound |
| 1.2 | SVI pp.57–58 covers small `K` only | locator gap (R02) |
| 3.4b, 3.4d, 3.4e | van den Dries's book | not verifiable (below) |
| 3.5 | SVI Rem 3.13(a) (line 1722, p.39); neat tower (lines 2517–2519, p.58) | sound |
| 3.5c | BKT Thms 1.3 and 1.5 (bkt lines 206–238, p.5); §§4.1–4.5 (lines 615–834, pp.13–17); erratum §§1.4–1.5 (bkt-erratum lines 100–126, p.3); BGST Prop 28.1 (bgst lines 634–638, p.14) | sound |
| 4.3 | Milne 1999 §2, pp.3–4 (lines 122–155): `r_x` lands in `T(𝔸_f)/T(ℚ)⁻` | sound |
| 5.1 | Milne CM Def 1.8 (cm line 325, p.11); 1.16–1.17 (lines 421–436, p.13); 1.18(a) (line 446, p.14); 1.21 (line 503, p.15); 1.22 (line 545, pp.15–16) | sound |
| 6.1 | SVI Prop 14.14 (line 5490, p.127) | sound |
| 7.0e | Milne 1983 Lemma 3.8 (line 363, p.250: finite places, no `Aₙ` with `n≥4`); p.258 Hasse transition citing Kneser VII §6 (lines 609–613) | sound |
| 7.0g | Milne 1984T Thm 2.4 (lines 434–447, pp.10–11); Rem 2.7 (lines 498–508, p.12) | sound |
| 7.0i | Deligne 1982 tensor spaces before Ex 2.3 (lines 678–720, p.16); Thm 2.11 (line 848, p.19); 2.12 (line 861, p.20); 2.15 (line 899, p.21) | sound |
| 3.5a (changed) | BKT §1.2 (bkt lines 101–113, p.3): `[0,1]ⁿ` cube convention and o-minimality of `R_an,exp` [VdM94] | sound |

**Adversarial table.** One row per sampled target, per Lean headline and per statement a finding touches.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `exists_oMinimalStructure_definable_iff` | ordered field `ℚ`; `ℝ` semialgebraic | `ℚ`: `{x²<2}` has boundary point `√2∉ℚ`, so `hone` fails and the theorem does not apply; `ℝ`: both hypotheses hold | holds | — |
| `exists_oMinimalStructure_isSemialgebraic` | `ℝ` | a sign condition on finitely many nonzero polynomials has finitely many boundary roots | holds | — |
| `definable_of_isSemialgebraic` | `ZMod 3` with `0<1<2`, power-set structure | `2+1=0<1`, so not an ordered ring; all five axioms hold for a finite `R`, so the conclusion holds | Lean true, README narrower | R04 |
| Swap of coordinates from the axioms | `A⊆R²` | init-cylinders twice put `A` on coordinates 0,1 of `R⁴`; with `x0=x3`, `x1=x2` and two `Fin.tail` this gives `{(b,a)}` | holds | — |
| `monotonicity` | `1/x` on `ℝ∖{0}`; a step function at 0 | `F=∅` (each half-line strictly decreasing); `F={0}` (constant on each side) | holds | — |
| `exists_isCellDecomposition` | hyperbola `xy=1` | 3 cells over each half-line and 1 over `{0}`: 7 | holds | — |
| `exists_ncard_le` | `{(t,x) : t,x∈ℕ, t≤x}` | fibre sizes `x+1` are unbounded, so the set is definable in no structure | consistent | — |
| `dim_eq_iff_nonempty_interior` (no definability hypothesis) | `n=0`, `A=univ, ∅`; `A=ℚ²⊂ℝ²` | `0=0` with nonempty interior; `⊥≠0` with empty interior; `ℚ²` contains 0-cells only, so `dim=0≠2`, and its interior is empty | holds for arbitrary `A` | — |
| `dim_image_appendEquiv_prod` | `A×∅` | `⊥=dim A+⊥` in `WithBot ℕ∞` | holds | — |
| `dim_inter_setOf_dim_fibre_eq` | `d=⊥`, `d=⊤` | left side `dim ∅=⊥`; right side `dim A(⊥)+⊥=⊥`; `A(⊤)=∅` and `⊥+⊤=⊥` | holds | — |
| `dim_closure_diff_lt` | upper half-plane; hyperbola | `1<2`; `⊥<1` | holds | — |
| `dim_eq_semialgebraicDim` | `[0,1]²`; a finite set | `2=2`; `0=0`. (≥) a `d`-cell openly embeds in `ℝᵈ`. (≤) `A` is a finite union of locally closed cells, of covering dimension `≤ dim A` | holds | — |
| `denselyOrdered_…`, `exists_nsmul_eq_…` | `ℤ`; the trivial group; `k=0` | `2ℤ` is infinite with ≤1 point per open interval, so no structure exists; trivial group: vacuous; `0•y=0≠x`, so `hk` is needed | holds | — |
| `exists_definableMapOn_section` | `{x≤y≤x+1}` | `f=id` | holds | — |
| `exists_tendsto_of_mem_closure` | topologist's sine at `(0,0)`; `n=0` | no curve exists, so the set is not definable; `n=0`: `A=univ`, a constant curve, and `ε>0` exists since `R` is nontrivial | holds | — |
| `ranExpLanguage`, `exists_oMinimalStructure_ranExp` | cube convention; `sin(1/(1−x))`; arity 0 | `x=0,1,−1/2` give `1,e,0` on both sides; zeros `1−1/(kπ)∈[0.68,1)` are infinite, so analyticity at `1` must be required; arity 0: the constants, and no `exp` symbol (`Fin 0` is empty) | holds | — |
| `reflexField_isCMField` | `ℚ(i)×ℚ(√−3)`; `ℚ(ζ₈)` with `{1,3}` | `|Φ|=2`, `E*=ℚ(i,√−3)` of degree 4, CM; `ζ₈+ζ₈³↦i√2` under both embeddings, so `E*=ℚ(√−2)` | holds | — |
| `reflexField_representation` | `E=ℚ(i)` with `k=ℚ` and `k=ℚ(i)`; `n=0` | `typeTrace(i)=i∉ℚ`, so no `ρ`, and `ℚ(i)≰ℚ`; `k=ℚ(i)`: `n=1`, `ρ=φ`; `n=0`: trace `0≠1=typeTrace(1)` | holds | — |
| `CMType` | `ℚ`; `ℚ(i)` | `ℚ`: `star φ=φ`, so `φ∈S↔φ∉S` fails and no type exists; `ℚ(i)`: two singleton types | holds | R05 (docstring) |
| Conventions | `u,v`; `diag(p,1)`; `rec(u)`; `s=2` | `uv=[[2,1],[1,1]]≠vu=[[1,1],[1,2]]`; the apex has upper-right entry `≡0 mod p`, index `p+1` (3 at `p=2`); `χ(rec(u))=u⁻¹`; `N(2)=4`, `α=1/2`, `c=1/4` | holds | — |
| 0.2 | `Γ(3)⊂SL₂(ℤ)`; `b=qak` | index `|SL₂(𝔽₃)|=24`; `Γ_b=q(G(ℚ)₊∩aKa⁻¹)q⁻¹`, since `q∈G(ℚ)₊` | holds | — |
| 0.6 | `GL₂` at `K(N)` and at `GL₂(ℤ̂)` | `ℚ_{>0}∖𝔸_f^×/(1+Nℤ̂)^×=(ℤ/N)^×`, so 2 at `N=3`; `GL₂(ℤ̂)`: 1. SVI 5.17 assumes `K` small. The README's injectivity (strong approximation for `G^der`) and surjectivity (`ν(G(𝔸_f))=T(𝔸_f)` by Kneser and integral lifts) need no smallness. | holds | — |
| 1.1 | trivial datum; torus | 1 point; `T(ℚ)∖T(𝔸_f)/K` | holds | — |
| 1.2 | `K(3)`; `GL₂(ℤ̂)` | `Γ(3)` is torsion-free, so a manifold; `Y(1)` is normal with order 2 and 3 points | holds; locator gap | R02 |
| 1.3 strict torus | `K(21)→K(3)` | `(ℤ/21)^×/{±1}` has 6 points over 1 point; `K(3)/K(21)≅(ℤ/7)^×=C₆` acts regularly | holds | — |
| 1.5 `Y₀(2)` | `t=a²/b−3` | `c₄=16bt`, `Δ=16b³(t−1)`, `j=256t³/(t−1)`; `Q` has discriminant `t²(t−1)(t+3)` | holds | — |
| 2.3 Siegel genus 2 | degree `n=2` | `det(Dγ_Z)=det(CZ+D)^{−3}`, so weight 6 = elliptic degree 3 | holds | — |
| 2.9 | `X(3)→X(1)` | degree `|PSL₂(𝔽₃)|=12 = 4` cusps × width 3 | holds | — |
| 3.2 | `exp:ℂ→𝔸¹=Y(1)` | holomorphic but not algebraic; the target has torsion | hypothesis needed and present | — |
| 3.3 | cusp normalization `t↦(t²,t³)` | bijective on points, tangent map 0 at 0, excluded by smoothness | holds | — |
| 3.5 | `𝔸¹/±1` | quotient coordinate `x²`; normal quotient with torsion (SVI 3.13(a)) | holds | — |
| 3.5c | constant variation; BKT 1.3 with the erratum | constant period map; BGST 28.1 hypotheses `K_H=K_G∩H(ℝ)` and forward containment are both in the README | holds | — |
| 4.3 | finite level; full tower | factors through `art_E`; tower values in `T(𝔸_f)/T(ℚ)⁻` | holds | — |
| 4.10 | `GL₂` with `ℚ(√−p)`, `p` unramified in `L` | `p` ramifies in `ℚ(√−p)`, so `ℚ(√−p)⊄L` and the two are linearly disjoint | holds | — |
| 4.12 and Layer 4 example | strict `G_m`, `K(5)` | 2 points `{±1},{±2}`; `χ=2` swaps them; model `ℚ(ζ₅+ζ₅⁻¹)` | holds | — |
| 5.10 | `art` on finite ideles | `E*` is CM, so `E*_∞^×` is connected and `art` factors through `𝔸_{f,E*}^×` | holds | — |
| 5.11 | `s=2`, `σ=id` | `c=χ/N=1/4` | holds | — |
| 6.1 | Siegel datum containing a CM torus | SVI 14.14: the subdatum inherits the model | holds | — |
| 7.0e | `SL₂`, `μ₂`; type `A₄` | `k^×/k^{×2}`: a square at every finite place is a square; `A₄` is excluded by Lemma 3.8 | holds | — |
| 7.0g | `Ric(ω)=−ω`; an abelian variety | `[ω]=2πc₁(K_V)`; `K` is trivial, so the hypothesis fails | holds | — |
| 7.0i | `τ=id`; elliptic `(1,0)` class | unchanged; not of type `(0,0)` | holds | — |
| 7.0i.1 and ShimuraData §1.2 | weight-0 `ℚ(ζ₅)`; non-polarizable torus; `2·id` acting on `ψ` | `MT` is a 2-dimensional torus without scalars; not reductive; `ψ` is scaled by `4⁻¹` | the general version needs the polarizable and nonzero-weight clauses | R01 |
| §§P.5, P.6 | anchor counts | 0 links each | defect | R02 |
| 8.1 / 8.3 | `N=3` | degree `48/2=24`; `φ(3)=2` components; over `j=0`, 8 points of index 3 | holds | — |
| 8.6 | `K=ℤ̂^×` with `Y={±1}`; `N=3` | 1 point; `μ₃^prim` has 2 points swapped by conjugation | holds | — |
| 8.14 | `K₁` against AAG §5.2 | `[[1,b],[0,d]]` and `[[a,b],[0,1]]` both meet `SL₂` in `[[1,b],[0,1]]` | holds | — |

**Pinned declarations opened.**
- **Mathlib `1b1ccf4b`:**
  - `Set.Definable` (`ModelTheory/Definability.lean:54`) and `Set.DefinableMap` (`:450`);
  - `FirstOrder.Language.Structure` (`ModelTheory/Basic.lean:155`);
  - `AnalyticOnNhd` (`Analysis/Analytic/Basic.lean:120`) and `isOpen_analyticAt` (`Analysis/Analytic/ChangeOrigin.lean:373`, which needs `CompleteSpace F`; `ℝ` is complete);
  - `NumberField.IsCMField` (`NumberTheory/NumberField/CMField.lean:70`, totally complex and quadratic over its maximal real subfield);
  - `NumberField.ComplexEmbedding.conjugate` (`…/InfinitePlace/Embeddings.lean:192`, equal to `star φ`);
  - `IntermediateField.adjoin_le_iff` (`FieldTheory/IntermediateField/Adjoin/Defs.lean:55`);
  - `Fin.appendEquiv` (`Logic/Equiv/Fin/Basic.lean:401`);
  - `Setoid.IsPartition` (`Order/Setoid/Partition.lean:194`, which excludes `∅`);
  - `MeasureTheory.IsSetAlgebra` (`MeasureTheory/SetAlgebra.lean:60`).
- **Tau Ceti `2fd255d9`:**
  - `TauCeti.IsSemialgebraic` (`Geometry/RealAlgebraic/Semialgebraic/Basic.lean:75`, over `[CommRing R] [LinearOrder R]`), `.exists_eq_setOf_sign_eval` (`:381`) and `HasSemialgebraicProjections` (`:412`), with its `ℝ` instance at `CAD/Existence.lean:102`;
  - `TauCeti.IsCAD` (`CAD/Basic.lean:147`) and `.finite` (`:182`);
  - `semialgebraicDim` (`Semialgebraic/Dimension/Basic.lean:76`: the sup over nonempty `t⊆s` with an open embedding `t→ℝᵈ`) and `semialgebraicDim_union` (`:248`);
  - the closure, product, projection and manifold laws (`Closure.lean:47`, `Product.lean:49`, `Projection.lean:89`, `Manifold.lean:40` and `:72`);
  - `isSemialgebraic_iff_definable_real` (`RingLanguage.lean:135`).

**Cross-roadmap citations and ownership.**
- **Citation resolver.** The worker's resolver lists no cross-roadmap citation as missing. Its Lean-name leads are:
  - this roadmap's own target ids;
  - names declared in `Suggested.lean`;
  - AdelicAlgebraicGroups' `Reduction.levelArithmetic`, `Neat.IsNeatLevel` and `Neat.exists_isNeatLevel_le` (at #792, lines 284, 4661 and 4764).
- **Supplier ids resolved at their heads.**
  - ComplexComparisonPartII: C−1.1, C−1.2, C0.7, C1.9, C2.1–C2.2, Layer C4, C5.1–C5.3, C6.2, C6.6, and the names `ComplexAnalyticSpace`, `complexSchemeAnalytification`, `analyticEtaleDescent`, `projectiveComplexGaga`, `properSchemeGagaEquivalence` and `riemannExistence`.
  - GL2AutomorphicRepresentationsAndTransfer: R16.1.7 (`chevalley_power_congruence`) and R17.5.0.
  - AutomorphicSpectralTheory: 0.48 and 6.12–6.18.
  - SmoothRepresentationsOfLocalGroups: SR.3a.1.
  - ArithmeticLocallySymmetricSpaces: ALS.0.5–0.9.
  - ClassFieldTheory on main: `cyclicHasseNorm` and `isGlobalNorm_iff_isLocalNormEverywhere`.
  - AffineMorseLefschetz on main: A4.1.
- **Inbound ids.** Other roadmaps cite 42 distinct ShimuraVarieties section ids, from 201 lines at main and the open heads. All 42 exist here.
- **o-minimal theory and `R_an,exp`.** This roadmap is the owner.
  - RealAnalyticGeometry on main explicitly does not extend to subanalytic sets (its line 20).
  - Completed/HodgeStructures and the Mathlib and Tau Ceti pins have no o-minimal content.
  - StratifiedSpacesAndTameTopology (#1519) still claims the same theory, but it is on the never-cite list and outside the merge order.
  - AbelianSchemesAndArithmeticModuliPartII (line 151) consumes §3.5a.
- **CM types and reflex fields.** PELModuli (line 112) cites §5.1's `CMType.reflexField` and §P.5 instead of redefining them. No other roadmap declares `CMType`, `typeTrace` or `reflexField`.
- **ShimuraData.** ShimuraData (line 113) defers §§P.1–P.5 to this roadmap (its README line 14). The Mumford–Tate group is the one exception (R01).
- **Overlaps file.** It reports no open pull request that changes this roadmap and no dropped id.

**Headline theorems.**
- **README headlines:**
  - canonical towers for every pure datum (§§7.14, 8.22);
  - Baily–Borel (§2.7);
  - Borel algebraicity (§§3.2, 3.7);
  - uniqueness (§4.12);
  - the main CM theorem (§5.10);
  - the Siegel and abelian-type models (§§5.13, 6.7);
  - the minimal compactifications (§§8.18–8.23);
  - the `GL₂` comparisons (§§8.10–8.16);
  - reflex fields (§5.1);
  - the o-minimal foundations (§§3.4b–3.4e) and `R_an,exp` (§3.5a).
- **Statable at the pins:** §§3.4b–3.5a and §5.1. All are stated.
- **Not statable:** the rest. The module docstring names each layer's missing carrier: data, analytic spaces, realizations and canonical models. §§7.0c–7.0f also need Hermitian domains and reductive group schemes over number fields, which the pins lack.

## Not verifiable

- **van den Dries, *Tame Topology and o-minimal Structures* (1998).** It is cited for §§3.4b–3.4e. The sources service found only Cambridge's landing page, on a host in no licence class, and there is no open copy. I checked the mathematics (table above), not the chapter numbering.
- **Settled `uncertified`:** van den Dries–Miller 1994 (§3.5a), Clozel 1986 (§7.0h) and Platonov–Rapinchuk 1994 (§7.0e, Theorem 6.22).
- **Yau 1978 (§7.0g) and Margulis (§7.0c):** behind paywalls. I read Milne's accounts instead (milne-1984t lines 498–508; milne-1999 lines 174–179).
- **Baily–Borel 1966 (Layer 2):** an Annals paywall copy; I did not reopen it this round.
- **Ownership against open pull requests.** For those the brief names without files (AdelicAlgebraicGroups, ComplexComparisonPartII, ShimuraData and others), I checked through `roadmaps show` and `roadmaps grep` at their heads.

## Source issues

- none

# Review of TemperleyLiebOperatorAlgebras (pull request #867 at 1b7e786)

**Verdict:** needs changes

The gate passes, `Suggested.lean` elaborates with its single admitted headline as the only
warning, and the dependency check reports no problem. The ownership defect of the previous round
is repaired: Subfactors 3.1–3.3 is now the supplier of the analytic adjoint, Jones's theorem, the
path models and the C*-tower, and this roadmap keeps the comparisons, the sign isomorphism, the
Bratteli diagram, the unitary category and the affine theory. The blocking defects of this round
are mathematical: a false worked example about the unitary category at `δ = 1`, a Temperley–Lieb
relation asserted at `n = 2` where the affine diagram algebra violates it, and a supplier formula
copied with the supplier's normalisation while this README's conventions give the symbol the other
meaning.

**Repair status of the previous review (b81a618).**

- R01 (P2, two owners of A1–A5): repaired. `## Scope and ownership` (README lines 65–83) leaves
  the analytic adjoint, Markov uniqueness, `f_k`, `R_n`, `markovTrace_nonneg_iff`,
  `markovTrace_nonneg_iff_lt_floor`, the path models, `Q_n`, `E_n` and `B_δ` to Subfactors 3.1–3.3
  ("None of it is restated here; Layers 1–2 consume it by section"), the supplier contract at
  lines 203–224 lists them, and the three duplicated declarations are gone from `Suggested.lean`.
  Checked against `TauCetiRoadmap/Subfactors/README.md` at its open head: 3.1 (lines 676–695),
  3.2 (697–772), 3.3 (774–830) plan exactly what the contract assumes, and its `Suggested.lean`
  declares `jonesLoopParameters`, `markovTrace_nonneg_iff` and `markovTrace_nonneg_iff_lt_floor`
  (lines 58, 67, 82) in namespace `TauCetiRoadmap.Subfactors`. Subfactors line 77 still says this
  roadmap is not a prerequisite of any of its layers, and CategoricalOperatorAlgebras lines 56–58
  say this roadmap consumes CA1a and CA2a and nothing flows back, so the roadmap-level cycle is
  gone.
- R02 (P3, house form): repaired. The README has `## Scope and ownership`, `## Conventions`,
  `## Exact supplier contracts`, `## How to read the build`, four `## Layer k:` sections with
  `### k.n` prose targets, `*Needs:*` lines, `**Checks.**` lists, `### Examples`,
  `### Dependencies`, `## Downstream consumers` and `## References`; the process sentences and
  the Zulip link are gone; `UnitaryTL_δ` and `signMap` are now prose (`UTL_δ`, `s`).
- R03 (P3, Lean form): repaired. Namespace `TauCetiRoadmap.TemperleyLiebOperatorAlgebras`
  (`Suggested.lean` line 38); the docstring (lines 8–33) names the non-statable headlines and what
  each lacks.
- R04 and R05 (P3, padding, duplicated headline): repaired. The file states one theorem,
  `markovTrace_neg_one_pow_nonneg_iff`; `generator`, `closureTrace_*`, `adjoint_*`, the quotient
  block and `ConjugateDagger` are deleted.

## R01 (P2) — At `δ = 1` the unitary category has two simples, not one

**Location.** `TauCetiRoadmap/TemperleyLiebOperatorAlgebras/README.md` line 715: "`m = 3`
(`δ = 1`): the only simple is `X_0`; `X_1 ≅ X_0` and `X_1 ⊗ X_1 ≅ X_0`"; line 730: "UTL_1 is
equivalent to finite-dimensional Hilbert spaces with one simple object".

**Claim.** The unitary Temperley–Lieb category at `δ = 1` has a single simple object and `X_1`
is isomorphic to the unit.

**Witness.** The same section states the rule "for `δ = 2cos(π/m)` the simples are
`X_0, …, X_(m−2)`" (line 691), which at `m = 3` gives `X_0` and `X_1`. `X_1` is the object `1`,
not negligible since `tr̂(𝟙 1) = δ = 1 ≠ 0`, and `Hom(0, 1) = 0` by the README's own 3.1 Check
(line 595), so `X_1 ≇ X_0`. The supplier agrees: `TauCetiRoadmap/TemperleyLieb/README.md` lines
937–938, "at `δ = 1` (quantum order 3) the quotient has two simples with `X_1 ⊗ X_1 ≅ X_0`".
The cited source agrees: chen-tl-skein line 1940–1941 (Theorem 5.4.5, simples `p_0, …, p_(n−2)`
with Chen's `n = 3`) and line 2032 ("at `q = e^(πi/3)` the simple objects are `p_0` and `p_1`").
Computed: `dim X_1 = [2] = 1`, `End(1) = ℂ`, `Hom(0,1) = 0` (no matching on one point).

**Repair.** Line 715: "`m = 3` (`δ = 1`): the simples are `X_0` and `X_1`, both of dimension
`1`, with `X_1 ⊗ X_1 ≅ X_0`; `Hom(0, 1) = 0`, so `X_1 ≇ X_0` although `End(n) = Q_n = ℂ` for
every `n`". Line 730: "UTL_1 has two simple objects `X_0`, `X_1` with the `ℤ/2` fusion rule; its
endomorphism algebras are all `ℂ`". Tested on the refuting instance: with two simples the
Layer 3 rule at `m = 3`, the 2.2 Check `B_1 = ℂ` and the 1.3 Check `Q_n = ℂ` all stay true.

## R02 (P2) — `e_i e_(i±1) e_i = e_i` fails in `ATL_2(δ)`; the Check asserting it is false

**Location.** README lines 767–770: "Prove the relations `e_i² = δ e_i`,
`e_i e_(i±1) e_i = e_i` with indices modulo `n`, distant commutation, and `τ e_i τ⁻¹ = e_(i+1)`
… where the indices make sense"; line 785 (Check): "In `ATL_2(δ)` the two generators `e_1`,
`e_2` are distinct diagrams … and `e_1 e_2 e_1 = e_1`".

**Claim.** The affine relation holds for every `n`, including `n = 2`.

**Witness.** With essential circles retained as diagram data (line 750), on two points the
bottom arc of `e_1` (not crossing the seam) and the top arc of `e_2` (crossing it) close to a
curve through both points that winds once round the annulus: an essential circle `c`, not a
contractible loop. So `e_1 e_2 = c·D` and `e_1 e_2 e_1 = c² e_1 ≠ e_1`. The README's own 4.3
Check (line 836) uses this gluing: distinct arcs pair to an essential circle, giving the entry
`a = z + z⁻¹`. On `W_(0,z)(2)` with basis `b_1`, `b_2`: `e_1 b_1 = δ b_1`, `e_2 b_1 = a b_2`,
`e_1 b_2 = a b_1`, hence `e_1 e_2 e_1 b_1 = δ a² b_1` while `e_1 b_1 = δ b_1`; at `z = 2` the
factor is `a² = 25/4`. The sources assume `n ≥ 3`: erdmann-green-1999 line 94 ("An affine
n-diagram, where `n ≥ 3`"), relation (3) at line 169 under that hypothesis; graham-lehrer-2003
line 356–361 state (TL) with the clause `{i, j} ≠ {1, n}`, which is vacuous at `n = 2`.

**Repair.** Line 767: state `e_i e_(i±1) e_i = e_i` and the distant commutation for `n ≥ 3`
(indices modulo `n`), and for `n = 2` state the computed law `e_1 e_2 e_1 = c² e_1`,
`e_2 e_1 e_2 = c² e_2`, with `c` the essential circle (acting by `(z + z⁻¹)²` on `W_(0,z)(2)` and
by zero on `W_(2,z)(2)`). Replace the Check at line 785 by: "In `ATL_2(δ)` the generators
`e_1`, `e_2` are distinct diagrams and `e_1 e_2 e_1 = c² e_1`; on `W_(0,z)(2)` the factor is
`(z + z⁻¹)²`, so the ordinary relation `e_1 e_2 e_1 = e_1` fails on two strands." Tested on the
refuting instance: `δ a² b_1` is what the corrected law predicts.

## R03 (P2) — The Markov formula of the Subfactors 3.3 contract has the wrong power of `δ`

**Location.** README line 220 (supplier contract, Subfactors 3.3): "the expectations `E_n` with
`τ_(n+1)(ι_n(x) p_n) = δ⁻¹ τ_n(x)`, `p_n = δ⁻¹ U_n`"; Conventions line 112: "the normalised trace
is `τ_n = δ⁻ⁿ T_n`"; the same slip at line 430 (1.4 Check): "already `τ_1(1) = 1 ≠ δ`".

**Claim.** For the normalised trace, `τ_(n+1)(ι(x) p_n) = δ⁻¹ τ_n(x)`.

**Witness.** `TauCetiRoadmap/Subfactors/README.md` lines 779–781 and 806–808 write `τ_n` for the
unnormalised trace (`τ_n(1) = δⁿ`) and `tr_n = δ⁻ⁿ τ_n` for the normalised one, and state
`τ_(n+1)(ι_n(x) p_n) = δ⁻¹ τ_n(x)` together with `tr_(n+1)(ι_n(x) p_n) = δ⁻² tr_n(x)`; its Check
at lines 827–829 computes both. Under this README's convention (`τ_n = δ⁻ⁿ T_n`) the stated
formula is false: at `n = 1`, `x = 1`, `δ = 2`: `τ_2(p_1) = δ⁻² T_2(δ⁻¹ e) = δ⁻² = 1/4`, while
`δ⁻¹ τ_1(1) = 1/2`. Likewise `τ_1(1) = 1` is correct for the normalised trace, so line 430 states
no contradiction; the intended one is `T_1(1) = δ ≠ 1`.

**Repair.** Line 220: "`T_(n+1)(ι_n(x) p_n) = δ⁻¹ T_n(x)`, equivalently
`τ_(n+1)(ι_n(x) p_n) = δ⁻² τ_n(x)` for the normalised traces (Subfactors writes `τ_n` for this
README's `T_n` and `tr_n` for its `τ_n`)". Line 430: "and already `T_1(1) = 1 ≠ δ`". Tested on
the refuting instance: `τ_2(p_1) = 1/4 = δ⁻² τ_1(1)` and `T_2(p_1) = 1 = δ⁻¹ T_1(1)` at `δ = 2`.

## R04 (P3) — A Check composes in the wrong order

**Location.** README line 600 (3.1 Check): "A ℂ-linear dagger would give `(i·cup)† = i·cap`, and
then `(i·cup)† ≫ (i·cup) = −δ·𝟙 0`".

**Claim.** `(i·cup)† ≫ (i·cup)` lies in `End(0)`.

**Witness.** With `cup : 0 → 2`, `cap : 2 → 0` and Mathlib's `f ≫ g`, `cap ≫ cup : 2 → 2` and
equals `e` (the README's own 3.3 Check, line 666: "`cap ≫ cup = e` on `End(2)` while
`cup ≫ cap = δ·𝟙 0`"; TemperleyLieb line 933 says the same). So `(i·cap) ≫ (i·cup) = −e ∈ End(2)`,
not `−δ·𝟙 0`. The sign conclusion survives after the swap: `(i·cup) ≫ (i·cap) = −δ·𝟙 0` for a
linear dagger and `(i·cup) ≫ (−i·cap) = δ·𝟙 0` for the conjugate-linear one.

**Repair.** Write `(i·cup) ≫ (i·cup)† = −δ·𝟙 0` and `(i·cup) ≫ ((i·cup)†) = δ·𝟙 0` for the two
daggers, or keep the order and compare `tr̂((i·cup)† ≫ (i·cup)) = −δ` with `+δ`.

## R05 (P3) — Two locators support less than they are cited for; one letter swapped

**Location.** README line 962 (4.6 Check): "Morin-Duchesne–Saint-Aubin's per-step twist `u`, the
same determinant reads `X³ − 3X + u⁶ + u⁻⁶`, so `Z = u³`"; lines 860–863 (4.4): "Erdmann–Green,
2.5.6 and Remark 2.5.10 … for … the exceptional even case at `t = 0`".

**Witness.** morinduchesne-saintaubin-2013 line 1295 defines `α = v^N + v^(−N)` with `v` the
per-strand twist, and line 1606 `v = e^(iµ)`, `u = e^(iλ/2)`: their `u` is the loop parameter
(`β = −2cos(π − λ)`), so the twist letter is `v` and the relation is `Z = v³`, `v⁶ + v⁻⁶`. (The
roadmap uses `v` for Tau Ceti's `q`, so a renamed letter such as `w` is needed in the Check.)
erdmann-green-1999 lines 370–371 (Remark 2.5.10) say that for `n` even and `q = 1` the ideal
`I_0` must be factored out of the quotient algebra; it does not state that the head `L_(0,v)(n)`
vanishes at `v² = −1`. That statement rests on graham-lehrer-1998 Theorem 2.8 alone, which is
uncertified.

**Repair.** Line 962: name the per-strand twist by a fresh letter and say `Z = w³`, `w⁶ + w⁻⁶`.
Lines 860–863: cite Erdmann–Green 2.5.5–2.5.6 for the parametrisation at `t > 0` only, and leave
the zero-head exception to Graham–Lehrer 1998, Theorem 2.8, with the README's own computation
(the Gram matrix of `W_(0,±i)(n)` at `δ = 0` is zero for even `n > 0`) as its Check.

## Verified sound

**Gate and build.** The worker's gate at 1b7e786: every check passes (`gate.md`). I ran
`lake env lean` on `TauCetiRoadmap/TemperleyLiebOperatorAlgebras/Suggested.lean` from the
worktree: exit 0 in 2.8 s, one `declaration uses sorry` warning (line 56), nothing else; the
object file of `TauCeti.Algebra.TemperleyLieb.MarkovTrace` was present. Single `import Mathlib`
plus one `TauCeti.*` module; no `set_option`, no sorry'd data, no `lemma`, no `#eval`, no
`example`. The diff outside the roadmap folder is empty.

**Signature check.** A scratch copy with `#check @markovTrace_neg_one_pow_nonneg_iff` elaborated
once (exit 0). The elaborated type carries `δ < 0`, `q : ℂˣ`, `↑δ = -(↑q + ↑q⁻¹)`, the
`StarRing` and `StarModule ℂ` instances on every `TemperleyLieb ℂ ↑δ n`, the generator-fixing
hypothesis, and the iff between `∀ n x, 0 ≤ (-1)^n * markovTrace q hq (star x * x)` and
`(∃ m, 3 ≤ m ∧ -δ = 2cos(π/m)) ∨ 2 ≤ -δ`: exactly the README's statement at lines 474–479 and
497–499. Nothing changed. The one-tactic probe is not applicable: the theorem is an equivalence
over an arbitrary star structure; judged by reading, it is neither a restated definition nor a
boundary case, and its proof route (the sign isomorphism, its *-property, the trace relation and
Subfactors 3.2) is the content of 2.1.

**Dependency check.** `tauceti-roadmap … gate --depcheck … --movable`: `depcheck: 200 roadmaps,
1319 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line. Merge-order positions:
VonNeumannAlgebras 4, Subfactors 192, CategoricalOperatorAlgebras 212, CStarClassification 213,
TemperleyLieb 227, this roadmap 228; PivotalSpherical and GrothendieckEulerForms are on main;
CStarAlgebras is an open pull request adding a new roadmap folder, not yet in the order (not a
finding). Ownership against open pull requests: `roadmaps grep` over the 432 heads was run in the
previous round for the positivity objects; at this head the only other declarations of
`jonesLoopParameters`, `markovTrace_nonneg_iff` and `markovTrace_nonneg_iff_lt_floor` are
Subfactors', now cited as the supplier. The sign isomorphism, the Bratteli diagram of the Jones
tower, the unitary category and the affine standard modules are built by no roadmap on main, by
Subfactors (which leaves them to this roadmap, line 73–75), by TemperleyLieb (whose Layer 4
records the sign of the unit, `q = −q′`, but builds no isomorphism of fibers) or by
CategoricalOperatorAlgebras (lines 56–58).

**Library declarations opened at the pins.** Tau Ceti `TauCeti/Algebra/TemperleyLieb/Basic.lean`:
`aug`, `adjoin_range_e`, `hom_ext`, `lift_e`, `strandIncl_e`, `algEquivOfLeOne`, `e_ne_zero_two`
all present; `MarkovTrace.lean`: `markovTrace`, `markovTrace_one`, `markovTrace_mul_comm`,
`markovTrace_strandIncl`, `markovTrace_strandIncl_mul_e_last` present.
`TauCeti/CategoryTheory/GrothendieckGroup/Abelian.lean`: `AbelianK0` (line 79, as `ExactK0` of
the abelian exact structure), `of` (94), `of_shortExact` (108), `of_biprod` (127). Mathlib:
`IsDiscreteValuationRing` (`RingTheory/DiscreteValuationRing/Basic.lean` 56),
`Module.Basis.SmithNormalForm` (`LinearAlgebra/FreeModule/PID.lean` 407),
`Algebra/Polynomial/Laurent.lean`, `Polynomial.Chebyshev.T` and `S`
(`RingTheory/Polynomial/Chebyshev.lean` 67, 627), `CategoryTheory/Idempotents/Karoubi.lean`,
`CategoryTheory/Preadditive/Mat.lean`, `RingCon.Quotient` (`RingTheory/Congruence/Defs.lean`
190), `TwoSidedIdeal` (`RingTheory/TwoSidedIdeal/Basic.lean` 36). The README's claim that no
pinned declaration supplies a star structure, positivity, quotient, diagram category or affine
algebra for Temperley–Lieb agrees with the two Tau Ceti files, which define only the presented
algebra, `strandIncl`, `aug`, `algEquivOfLeOne` and the Markov trace.

**Cross-roadmap citations resolved.** TemperleyLieb at its open head: Layer 0 `qInt`,
`exists_qInt_eq_zero_iff`; Layer 1 `PlanarMatching`, `card_planarMatching`, `halfCount`; Layer 2
`TLDiagCat` with corner dragging (lines 329, 355); Layer 3 `TL(R, δ)`, `diagBasis`, vertical
reflection and `reflect` with `e_i ↦ e_(n−i)` (lines 924–927); Layer 4 `TLAlg R δ n := End(TLCat.of n)`,
`presentedTLEquiv`, `incl`, `StarRing` by vertical reflection with `star (r • x) = r • star x`,
`tr̂` with `tr̂(1) = δⁿ`, the pairing, `condExp`, `IsMarkovTrace`, `existsUnique_isMarkovTrace`,
and `tr̂ ∘ presentedTLEquiv = markovTrace q hδ` (lines 545–606); Layer 5 `CellModule`,
`cellForm`, `gramPoly`, the anchors including `det G_{5,1} = [3]⁴(δ² − 2)` (651, 930),
`isSemisimpleRing_iff_of_charZero`; Layer 6 `jonesWenzl`, `existsUnique_jonesWenzl`,
`IsMarkovTrace.apply_jonesWenzl` (242, 708; the worker's lead that this name is "found nowhere
in the pinned sources" is explained: it is TemperleyLieb's planned name, not a library name),
`negligibleIdeal`, Goodman–Wenzl, the path and block idempotents (726); Layer 7 `MonoidalIdeal`,
`MonoidalQuotient`, Clebsch–Gordan, the root-of-unity quotient with simples `X_0, …, X_{ℓ−2}`
and PivotalSpherical's fusion hypotheses (885–905). Subfactors 3.1–3.3 as above.
CategoricalOperatorAlgebras CA1a (152, finite linking algebras at 171), CA2a (302; balanced
solutions, unitary dual functor with `(f∨)† = (f†)∨` at 321–323). CStarAlgebras C1–C5 (85–605;
spatial tensor product with `M_n ⊗ A ≅ M_n(A)` at 566, C*-inductive limits at 605).
CStarClassification 2.1 `IsAF` (351–367) and 2.2 Bratteli diagrams with `K₀` connecting maps as
multiplicity matrices and recovery of a diagram (376–384); its line 36 names this roadmap as
the consumer of CL2. PivotalSpherical Layers 0–4 (257–387) with `PivotalCategory`,
`SphericalCategory`, `IsFiniteSemisimpleCategory`. GrothendieckEulerForms Layer 2 (238).
All suppliers are earlier in the order or on main. Consumer side: TemperleyLieb line 575 and
CategoricalOperatorAlgebras line 158 still name this roadmap's sections as "§A1" and "A6";
those labels no longer exist here (now 1.1 and Layer 3), a note for those roadmaps, not a
finding here.

**Sources at their locators** (the seeded sample: all fifteen targets; cached texts, cited as
`<id> line N`).

1. 1.1: penneys-uqsl-ch4 lines 589–592, (TB4) on printed p. 155 (footer line 614): when
   `d ∈ ℝ^×` the involution restricted to each tree-basis matrix algebra is the usual adjoint.
   Lines 396–401 and 408–409 define that involution for `d < 0` as reflection with a factor `−1`
   per cup or cap, which on an `(n,n)`-diagram is `(−1)^(2k) = 1`: it fixes the generators, so it
   is the adjoint of Subfactors 3.1 and the citation is exact.
2. 1.2: ridout-saintaubin-2014 lines 1120–1129, Theorem 4.7, equation (4.20):
   `det G_(n,p) = Π_(j=1)^p ([n−2p+1+j]/[j])^(d_(n,p−j))`; with `t = n − 2p` the README's formula.
   Lines 1140 (Corollary 4.8) and 1162 (Proposition 4.9, `β = 0`).
3. 1.3: penneys-uqsl-ch4 lines 607–608, (TB7): negligible ideal `ℂ·f^(n)` when `[n+1] = 0`;
   lines 712–733, the generating set of `I_k` and Definition 4.5.1, printed p. 158 (footer 754);
   line 745, Proposition 4.5.3; lines 747–749, Exercise 4.5.4 (loops on `A_n`, not `A_(n+1)`);
   iohara-lehrer-zhang lines 122–128, Proposition 3.1 and Remark 3.2 (the radical of `tr_n` is
   generated by `E_(ℓ−1)` for `n ≥ ℓ`; `tr_n` nondegenerate iff `n ≤ ℓ − 2`).
4. 1.4 and 2.1: penneys-uqsl-ch4 lines 557–583, (TB1)–(TB2) on p. 154; lines 600–606, (TB6):
   for `d > 0` `Tr_n` is positive, for `d < 0` `(−1)^n Tr_n` is positive, with the adjoint of
   item 1. The README's sign `(−1)^n` is this.
5. 2.2: penneys-uqsl-ch4 lines 941–961, Example 4.6.12 on p. 163 (footer 959): the Bratteli
   diagram of the generic tower by reflection along `A_∞`; lines 1000–1009, Example 4.6.14 on
   p. 164: truncation to `A_n` with vertices `0, …, n − 1` when `f^(n) = 0`.
6. 3.4: chen-tl-skein lines 642–643, Theorem 2.4.6 (`Hom(p_a ⊗ p_b, p_c)` one-dimensional iff
   admissible); 1026, Theorem 3.3.5; 1429, Theorem 4.0.8; 1672, the `q`-admissibility condition
   `0 ≤ a, b, c ≤ n − 2`, `a + b + c < 2n − 2`, which is the README's `c ≤ 2m − 4 − a − b`;
   1723–1737, Theorem 5.4.4; 1940–1941, Theorem 5.4.5.
7. 4.1: erdmann-green-1999 lines 94–133, 2.1.1–2.1.6 (pp. 3–4; the page-4 marker is at line 122):
   essential circles are the infinite horizontal edges of condition (iii), kept as data;
   contractible loops are removed at `δ` (2.1.6); line 164–171, Proposition 2.2.4 (relations
   (1)–(5)); lines 246–252, Proposition 2.4.4 (a diagram with through strings is a triple of two
   involutions and a winding integer). graham-lehrer-2003 lines 346–361, Definition 4.1 and (TL)
   on printed p. 488 (header line 354), `δ_x = −(x + x⁻¹)`; lines 377–380, the diagram
   generators `f_i`, `τ` with `τ f_i τ⁻¹ = f_(i+1)` mod `n`, p. 488; lines 398–400, the cell
   modules `W_(t,z)(n)` and their composition factors in characteristic zero, p. 489 (header 384).
8. 4.2–4.4: erdmann-green-1999 lines 328–352, 2.5.4–2.5.6 (p. 9; the page-10 marker is at
   353): the standard modules depend only on the root (winding eigenvalue), and the heads
   `L(λ)` for `φ_λ ≠ 0` form the simples of a cellular algebra. See R05 for Remark 2.5.10.
9. 4.6: morinduchesne-saintaubin-2013 line 801 (`C_k = cos(kΛ)`, `Λ = π − λ`, `β = −2C_1`),
   802 (`dim V^d_N`), 1115–1119 (Corollary 4.2, equation (23)), 1275–1296 (Proposition 4.3,
   equation (29), `α = v^N + v^(−N)`). chen-przytycki-2008 lines 33–53 (the pairing
   `⟨b_i, b_j⟩ = α^m δ^n`, Figure 3 values `δ², α, αδ`, the determinant
   `Π (T_i(δ)² − α²)^(C(2n, n−i))`), lines 79–99 (the leading-term argument with
   `2Σ i·C(2n, n−i) = n·C(2n, n)`).
10. 4.5 and 4.7: graham-lehrer-1998 is uncertified (see Not verifiable); graham-lehrer-2003
    lines 398–400 support the README's sentence at line 999 that the composition factors and
    multiplicities were determined in characteristic zero.

**Adversarial pass.** One row per statement; values computed on each side (exact rationals
unless noted; script in the scratch directory).

| Statement | Instances | Values | Result |
|---|---|---|---|
| `markovTrace_neg_one_pow_nonneg_iff` (headline) | n = 0, 1; δ = −2; δ = −1/2; δ = 0 | n = 0: `T_0(x̄x) = |x|²`; n = 1: `−T_1(x̄x) = −δ|x|² ≥ 0`; δ = −2: `−T_1(1) = 2`, `T_2(e†e) = δ² = 4`, `−δ = 2` admissible; δ = −1/2: `f_2 = 1 + 2e`, `T_2(f_2) = δ² + 2δ = −3/4 < 0`, `1/2 ∉ J`; δ = 0: all `T_n = 0` for n > 0 yet `0 ∉ J`, excluded by `hδ` | holds, hypotheses exact |
| Reduction through `s` | formal | `T^(−δ)_n((sx)†(sx)) = T^(−δ)_n(s(x†x)) = (−1)^n T^δ_n(x†x)`; `s` bijective, so `∀x` on one side iff on the other | holds |
| Trace relation `markovTrace(−q)(s x) = (−1)^n markovTrace q x` | n = 1, x = 1; n = 2, x = e | `δ` vs `(−1)(−δ) = δ`; `δ` vs `(+1)·T^(−δ)(−e) = −(−δ) = δ` | holds; the unsigned relation fails at n = 1 |
| `s` is a *-isomorphism | generators | `s(e_i)† = (−e_i)† = −e_i = s(e_i†)`; uniqueness of generator-fixing conjugate-linear anti-automorphisms (Subfactors 3.1) | holds |
| Gram formula (1.2) with exponent `d_(n,p−j)` | n = 5, t = 1, δ = 7/3 | formula `= 79360000/59049 = [3]⁴(δ²−2)`; wrong exponents `d_(n,j)` give `73290626560000/387420489` | holds; Check discriminates |
| `det G_(3,1) = [3]` | δ = 7/3 | `40/9 = 40/9` | holds |
| `Σ_t #paths_(n,t)[t+1] = δ^n` | n = 0..7, δ = 7/3 | equal for every n | holds |
| `#paths_(4,t) = halfCount 4 t` | t = 0, 2, 4 | `2, 3, 1` both; `4 + 9 + 1 = 14` | holds |
| Bratteli sizes at m = 4 | n = 0..5 | `(1),(1),(1,1),(2),(2,2),(4)`; `dim Q_n = 1,1,2,4,8,16` | holds, `2^(n−1)` |
| Weights at m = 5 | — | `[1..5] = 1, 1.618, 1.618, 1, 0`; 3-step paths end at 1 twice, at 3 once; `2δ + 1 − δ³ = 0` | holds |
| `[1..m]` at `δ = 2cos(π/m)` | m = 3..6 | positive then `[m] = 0` in every case | holds |
| 2.2 weights | δ = 2, 3 at level 2 | `(1/4, 3/4)`, `(1/9, 8/9)`, both summing to 1 | holds; two traces on one AF algebra |
| Unique trace at `δ = 2cos(π/m)` | m = 4, 5 | `A²` on the parity class `{0,2}` is `[[1,1],[1,1]]`, on `{0,2}` of `A_4` is `[[1,1],[1,2]]`: primitive; `[t]+[t+2] = δ[t+1]` makes `([t+1])` the Perron vector | holds |
| Supplier Markov formula (R03) | n = 1, x = 1, δ = 2 | normalised `τ_2(p_1) = 1/4`, `δ⁻¹τ_1(1) = 1/2`; unnormalised `T_2(p_1) = 1 = δ⁻¹T_1(1)` | false as written |
| 3.1 Check composition (R04) | linear dagger | `(i·cap) ≫ (i·cup) = −e ∈ End(2)`; `(i·cup) ≫ (i·cap) = −δ·𝟙 0` | wrong order |
| `Hom(1,3)` at δ = 1 | — | `dim = 2` (matchings of 4 points), radical spanned by the image of `f_2`, unitary Hom one-dimensional | holds |
| `‖e‖ = δ`, `‖e_1 e_3‖ = δ²` | — | `e² = δe`, `(e_1e_3)² = δ² e_1e_3`, projections `e/δ`, `e_1e_3/δ²` | holds |
| Truncated fusion rule | m = 3: (1,1); m = 4: (1,1), (1,2), (2,2); m = 5: (2,2), (3,3) | `{0}`; `{0,2}`, `{1}`, `{0}`; `{0,2}`, `{0}`; untruncated (2,2) gives `{0,2,4}` | holds |
| Simples at m = 3 (R01) | — | rule gives `X_0, X_1`; `dim X_1 = [2] = 1`; `Hom(0,1) = 0` | Check and Example false |
| `ATL_2` relation (R02) | `W_(0,z)(2)`, z = 2 | `e_1e_2e_1 b_1 = δ a² b_1`, `a² = 25/4`; `e_1 b_1 = δ b_1` | relation fails at n = 2 |
| 4.3 Gram n = 2 zero set | `z ∈ {v, v⁻¹, −v, −v⁻¹}`, 5 random `v` | `(z+z⁻¹)² − d² = 0` for all four | holds |
| n = 3, t = 1 determinant | 6 random `(X, Z)` | `det[[X,Z,1],[Z⁻¹,X,Z],[1,Z⁻¹,X]] = X³ − 3X + Z² + Z⁻² = σ F_3^E` with `σ_(3,1) = 1`, `E_(3,3) = 1` | holds |
| 6×6 affine Gram at n = 4, t = 0 | 8 + 6 random `(d,a)`/`(X,Z)`; `(3,0)`; `(3,3)`; `(3+h,3)` | `det = (d²−a²)⁴((d²−2)²−a²) = σ F_2^4 F_4` with `σ_(4,0) = −1`; `321489 = 9⁴·49`; rank 2; coefficients `h^0..h^5 = 0,0,0,0,51840,143424`, `51840 = 1296·40` | holds |
| n = 2, t = 0 formula | 6 random | `σ F_2^1 = X² − (Z+Z⁻¹)²`, `σ_(2,0) = −1` | holds, matches 4.3 |
| Telescoping and leading-term identities | all `(n,t)`, n ≤ 11 | `Σ_s a_(n,s) = E_(n,r)`; `Σ_r r E_(n,r) = m·C(n,m)`; n = 4: `2+3+1 = 6`, `2·4 + 4·1 = 12` | holds |
| `T_r(−v−v⁻¹) = (−1)^r(v^r + v^(−r))` | r ≤ 8, 5 random `v` | equal | holds |
| 4.7 valuation Check | `F_2(x,v)` at `x = δ` | value `0`; derivative `−2x`, nonzero iff `δ ≠ 0`; at `v = i`: `−x²`, order 2 | holds |
| Successor Check n = 2 | `z = ±v^(±1)` | `y = z v^(∓1) = ±1`; coincides with the zero set above | holds |
| 1.3 Check δ = 1, n = 3 | quotient by the ideal of `f_2 ⊗ 1 = 1 − e_1` | in the quotient `e_1 = 1`, so `e_2 = e_1e_2e_1 = 1`: the quotient is ℂ, the ideal has codimension 1; `dim Q_3 = 1` (one path of each length on `A_2`), so `R_3` has codimension 1 too, and the ideal, contained in `R_3`, equals it | holds |
| 1.3 Check δ = √2 | n = 3 | 3-step paths on `A_3` from 0 by endpoint `t = 0..3`: `0, 2, 0, 0`; `dim Q_3 = 2² = 4 = 5 − 1` | holds |
| Penneys `d < 0` adjoint | `(n,n)`-diagram with k cups, k caps | factor `(−1)^(2k) = 1` | generator-fixing |

**Degenerate and context checks.** `n = 0, 1` in the headline are the base ring (Tau Ceti
`algEquivOfLeOne`) and are covered by the quantifier; `δ = 0` is excluded on both sides by
`hδ`; non-real `δ` cannot carry the hypothesised star (Subfactors 3.1's Check, restated at 1.1).
The Lean statement's generality equals the README's (real `δ < 0`, every `n`, an arbitrary
generator-fixing conjugate-linear star). No `variable` block is used, so nothing is dropped.
The 2.1 construction of `s` over every commutative ring is a real body on the native carrier via
`lift`, and the README keeps it as a target rather than declaring it, which is allowed.

## Not verifiable

- graham-lehrer-1998 (*L'Enseignement Mathématique* 44 (1998), DOI 10.5169/seals-63902): the
  README cites it as uncertified by locator; the previous round found no legal text (Crossref
  404, e-periodica without a PDF link, no author-page or repository copy), and an uncertified
  citation is settled, so it was not requested again. Unchecked against the text: Definitions
  2.5–2.6, Theorem 2.8 (the zero-head exception), Theorem 3.4 (forest coefficients), Corollary
  4.7, Theorem 5.1 (composition factors with multiplicity one). Consistency only: the successor
  condition `z² = v^(εs)` is the vanishing of `F_s(δ, z)`, and the determinant and zero-head
  claims agree with the computed rows above and with graham-lehrer-2003 lines 398–400.
- Printed page numbers for ridout-saintaubin-2014 (p. 20–21) and for erdmann-green-1999 items
  2.2.4 (p. 5) and 2.4.4 (p. 7): the cached texts carry no page markers at those places; the
  numbered theorems were found and read, and the page claims are consistent with the markers that
  do exist (Erdmann–Green pages 4 and 10 at lines 122 and 353).

## Source issues

- **Misprint** in morinduchesne-saintaubin-2013 at Proposition 4.3, equation (29), printed
  p. 24: the source gives the Gram determinant as a product of factors `α² − 4C²_(k+d/2)` with no
  sign; it should carry the sign `(−1)^(Σ_k C(N,(N−d)/2−k))` for `d = 0` (at `N = 2`, `d = 0` the
  Gram matrix `[[β, α], [α, β]]` has determinant `β² − α²`, while (29) gives `α² − β²`); affects
  nothing (the README fixes the sign by its leading-term argument, verified above).

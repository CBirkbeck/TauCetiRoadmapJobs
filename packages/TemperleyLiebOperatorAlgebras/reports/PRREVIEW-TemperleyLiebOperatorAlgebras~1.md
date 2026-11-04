# Review of TemperleyLiebOperatorAlgebras (pull request #867 at b81a618)

**Verdict:** needs changes

The gate passes, `Suggested.lean` elaborates with exactly the ten admitted targets as its only
warnings, the dependency check reports no problem, and every computation I could run agrees with
the README. The blocking defect is one of ownership: at the heads I was given, the Subfactors
roadmap plans the same analytic adjoint, Markov uniqueness, positivity theorem, path models,
Jones quotients and C*-tower that A1–A5 plan here, declares the same three Lean targets, and
says it consumes nothing from this roadmap; and the ownership this README claims closes a
roadmap-level cycle through CategoricalOperatorAlgebras. The rest are form and padding notes.

## R01 (P2) — A1–A5 and Subfactors 3.1–3.3 are two owners of one object

**Location.** `TauCetiRoadmap/TemperleyLiebOperatorAlgebras/README.md`, "Ownership and build
order" (lines 116–135): "This roadmap owns the analytic TL adjoint, all-level Hermitian trace
positivity … positive Jones quotients, and their C*-tower (A1–A5). Subfactors consumes these
results"; `Suggested.lean` lines 173–203 (`jonesLoopParameters`, `markovTrace_nonneg_iff`,
`markovTrace_nonneg_iff_lt_floor`).

**Claim.** This roadmap is the sole owner of A1–A5, and Subfactors Layers 3–4 consume them.

**Witness.** Subfactors at its open head (`TauCetiRoadmap/Subfactors/README.md`) says the
opposite: line 77, "TemperleyLieb, TemperleyLiebOperatorAlgebras, GeometricTopology and
HilbertModules are not prerequisites of any layer"; lines 73–75 leave to this roadmap only "the
unitary Temperley–Lieb category, affine diagrams and annular modules". Its 3.1 (lines 676–695)
builds the analytic adjoint through `RingQuot.lift` with the same three Checks as A1; its 3.2
(lines 697–772) builds Markov uniqueness, quantum integers, Jones–Wenzl projections, the trace
radical and Jones's theorem with the same `δ = 1/2`, `δ = 0`, negative-δ and `δ = √2` Checks as
A4; its 3.3 (lines 774–830) builds the path models on `A_∞` and `A_(m−1)`, `ker π_n = R_n`,
`Q_n ≅ ⊕_t M_(#paths(n,t))(ℂ)`, the expectations with the Markov formula, the finite-dimensional
faithful-trace C*-lemma, the C*-inductive limit `B_δ` (CStarAlgebras C5), the faithful trace
and the GNS weak closure (VonNeumannAlgebras V4, V6), with the same `A_2`, `A_3`, `δ = 2` and
`TL_2 = ℂ ⊕ ℂ` Checks as A3 and A5. Its `Suggested.lean` lines 58–96 declare
`jonesLoopParameters`, `markovTrace_nonneg_iff` and `markovTrace_nonneg_iff_lt_floor` with
statements identical to lines 173–203 here, in namespace `TauCetiRoadmap.Subfactors`.

The claimed direction also closes a cycle at roadmap level. CategoricalOperatorAlgebras at its
head consumes Subfactors Layers 5–7 (`TauCetiRoadmap/CategoricalOperatorAlgebras/README.md`
lines 404–405 and 474), A6 here consumes CategoricalOperatorAlgebras CA1a and CA2a (README lines
424–425), and the README has Subfactors consuming A1–A5. The merge order lists Subfactors at
position 192, CategoricalOperatorAlgebras at 212 and this roadmap at 228. The README's argument
that the cycle is broken "by these named layers" (lines 128–130) is a layer-level argument; the
project's direction of supply is per roadmap.

**Repair.** Resolve the ownership in the direction the merge order already has. Cite Subfactors
3.1 (analytic adjoint), 3.2 (Markov uniqueness, Jones–Wenzl projections, Jones's theorem, first
bad level, trace radical) and 3.3 (path models, `Q_n`, expectations, C*-lemma, `B_δ`, trace
representation) under a supplier contract, and delete from A1–A5 every target they already
state, keeping here only what Subfactors does not plan: the comparison of the native adjoint
with vertical diagram reflection and with the coefficient-fixing reflection of TemperleyLieb
Layer 4, the transport of the diagram-category traces through `presentedTLEquiv`, the
comparison of the Hermitian cell forms with TemperleyLieb Layer 5's bilinear forms and the Gram
anchors of A2, the path Bratteli diagram through CStarClassification CL2, the negative-δ sign
isomorphism, A6 and A7. Delete the three duplicated declarations from `Suggested.lean` and state
`closureTrace_positive_iff` as the comparison it is (its proof then reduces to Subfactors'
theorem through the uniqueness of the generator-fixing adjoint), or drop it and keep the file
to what A6–A7 can state. If instead ownership is meant to move here, this folder cannot be
accepted while the Subfactors head still builds A1–A5 and declares the three names: the two
heads must agree, and the Subfactors roadmap would then have to be placed after this one and the
A6 dependence on CA1a/CA2a re-examined against the cycle above. Tested on the instance that
refuted the original: with the first repair, the dependency check on this README still reports no
UPWARD or CYCLE line (Subfactors 192 < 228, CategoricalOperatorAlgebras 212 < 228).

## R02 (P3) — README not in TauCetiRoadmap form; process narrative; undeclared own names

**Location.** `README.md` headings (lines 12, 116, 137, 188, 243, 284, 343, 395, 472, 654);
line 113 "[Suggested.lean] gives representative target interfaces"; lines 20–23 "The
dependencies specify the mathematics regardless of their publication or implementation status";
lines 661–663 (Zulip link, "adopt its ownership"); lines 720–721 "Open upstream work determines
API shape and never postpones a required target".

**Claim.** The README is in the house shape.

**Witness.** There is no `## Scope and ownership`, `## Conventions`, `## Exact supplier
contracts`, `## How to read the build`, `## Layer k:` headings, `### Examples`, `### Dependencies`
or `## Downstream consumers` section; no target carries a `*Needs:*` line; definitions have no
`**Checks.**` lists (the checks are inside the prose of A1–A5); many targets have no locator at
all (the whole of A5 after the first paragraph, the A6 C*-category axioms, the A7 normal-form
classification and intertwiner injectivity). The sentences quoted above are process narrative.
Two backticked names of this roadmap's own are not declared in `Suggested.lean`: `UnitaryTL_δ`
(line 397) and `signMap` (line 387).

**Repair.** Recast A1–A7 as `## Layer k:` sections with `### k.n` prose targets, each ending in
a `*Needs:*` line, `**Checks.**` bullets per definition (the Checks already present in prose:
the δ = 1/2, 1, √2, (1+√5)/2, 2 levels; the `A_2`, `A_3` path counts; the n = 2, 3, 4 affine
Gram examples), `### Examples` and `### Dependencies` per layer, a `## Scope and ownership`
section carrying the deferrals of the Subfactors paragraph and the "selected categorical scope"
paragraph (lines 103–112), `## Exact supplier contracts` per supplier, and `## References`.
Delete the four process sentences and the Zulip link. Either declare `UnitaryTL_δ` and `signMap`
in `Suggested.lean` or write them in prose without backticks.

## R03 (P3) — Lean form: namespace, docstring, admitted targets not named

**Location.** `Suggested.lean` lines 8–14 (module docstring), line 20 (`namespace
TemperleyLiebOperatorAlgebras`).

**Claim.** The file is the roadmap's acceptance test in the house form.

**Witness.** The namespace is `TemperleyLiebOperatorAlgebras`, not
`TauCetiRoadmap.TemperleyLiebOperatorAlgebras` (compare `TauCetiRoadmap/Subfactors/Suggested.lean`
line 49 and `TauCetiRoadmap/TemperleyLieb/Suggested.lean` line 41). The docstring says "These are
suggested forms" and "not exhaustive", and does not say which headline theorems are not statable
at the pins and what each lacks: the structure theorem `Q_n ≅ ⊕_t M_(#paths)(ℂ)` (statable, see
R04), the C*-inductive limit `B_δ` and its trace representation (no C*-inductive limit at the
pins), the unitary TL category and its C*-category axioms (no diagram category at the pins), the
affine classification and the affine Gram determinant (no affine diagram algebra at the pins).

**Repair.** Rename the namespace; rewrite the docstring as "Temperley–Lieb operator algebras:
target signatures", saying the roadmap is README.md, that the file states the headline theorems
against the pinned APIs, and listing the four non-statable headlines with the missing carrier.

## R04 (P3) — Padding, and a quotient block with no headline on it

**Location.** `Suggested.lean` lines 32–33 (`generator`), 147–153 (`closureTrace_one`,
`closureTrace_mul_comm`), 119–120 (`adjoint_generator`), 236–257 (`JonesQuotient`,
`quotientMap`, `traceRadical_adjoint`, `quotientAdjoint`, `quotientAdjoint_mk`), 259–274
(`ConjugateDagger`).

**Claim.** Each declaration is a headline or a definition a headline needs.

**Witness.** On a scratch copy elaborated at the pin, `quotientAdjoint_mk` closes by `rfl`
(`Quotient.map'` on `mk'` is definitional). `closureTrace_one` and `closureTrace_mul_comm` are
one-line restatements of `TauCeti.TemperleyLieb.markovTrace_one` and `markovTrace_mul_comm`
(pinned `TauCeti/Algebra/TemperleyLieb/MarkovTrace.lean` lines 462 and 468). `generator` is an
alias of `TauCeti.TemperleyLieb.e`. `adjoint_generator` mirrors the A1 Check "fixes every native
generator". `JonesQuotient`, `quotientMap`, `quotientAdjoint` and `traceRadical_adjoint` are
definitions and a support lemma that no stated theorem uses. `ConjugateDagger` is a structure on
an arbitrary ℂ-linear category that restates the A6 dagger laws and names no TL object.
(`freeConj_ι`, `freeConj_algebraMap`, `adjointLift_rel`, `adjoint_add`, `adjoint_mul`,
`adjoint_involutive`, `adjoint_algebraMap` and `exists_loop_parameter` are not padding: the
`StarRing` and `StarModule` instances and `closureTrace` need them, and the two admitted ones
among them are proof obligations of those instances, not data.)

**Repair.** Delete `generator`, `closureTrace_one`, `closureTrace_mul_comm`,
`adjoint_generator`, `quotientAdjoint_mk` and `ConjugateDagger` (the README keeps the
statements as targets and Checks). For the quotient block, either state the A3 headline on it,
for instance that for `δ = 2cos(π/m)`, `m ≥ 3`, `Module.finrank ℂ (JonesQuotient δ n)` equals
`Σ_t (#paths_(n,t))²` for paths on `A_(m−1)` (the path count is a two-line recursion on ℕ), so
that `JonesQuotient`, `quotientMap`, `quotientAdjoint` and `traceRadical_adjoint` are the
definitions a headline needs, or delete the block. Which of these survives depends on R01.

## R05 (P3) — The same headline stated twice

**Location.** `Suggested.lean` lines 156–159 (`closureTrace_positive_iff`) and 182–188
(`markovTrace_nonneg_iff`).

**Claim.** Both are headline theorems.

**Witness.** `closureTrace δ n` is by definition `markovTrace q hq` for a chosen `q`, and the
`StarRing` instance on `AnalyticTL δ n` fixes the generators (`adjoint_generator`), so
`closureTrace_positive_iff` is the instance of `markovTrace_nonneg_iff` at that star structure;
its right-hand side is `jonesLoopParameters` written out. The README (A4, lines 290–293) says the
two are related by "the comparison between the native and synonym statements".

**Repair.** Keep one as the headline and state the other as the comparison (an `↔` between the
two left-hand sides, or `closureTrace_positive_iff` proved from `markovTrace_nonneg_iff` once
R01 fixes where the latter lives).

## Verified sound

**Gate and build.** The worker's gate at b81a618: every check passes (`gate.md`). I ran
`lake env lean` on `TauCetiRoadmap/TemperleyLiebOperatorAlgebras/Suggested.lean` from the
worktree: exit 0 in 13 s, ten `declaration uses sorry` warnings (lines 96, 115, 119, 143, 156,
182, 197, 230, 242, 256), nothing else. The Tau Ceti module `TauCeti.Algebra.TemperleyLieb.MarkovTrace`
exists at the pin (a91d3aa) and its object file was present. Single `import Mathlib` plus one
`TauCeti.*` module; no `set_option`, no sorry'd data, no `lemma`, no `#eval`.

**Signature check.** A scratch copy with `#check @name` for all twenty declarations elaborated
once; every elaborated type matches its README statement (hypotheses `0 < δ`, `δ < 2`,
`δ ∉ jonesLoopParameters`, the `StarRing`/`StarModule` instances and the generator-fixing
hypothesis are all in the signatures, not dropped section variables). `JonesQuotient δ n` carries
an `Algebra ℂ` instance at the pin (`RingCon.Quotient` of a `TwoSidedIdeal`), so the finrank
statement suggested in R04 is statable.

**Dependency check.** `tauceti-roadmap … gate --depcheck … --movable`: `depcheck: 200 roadmaps,
1312 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line. Merge-order positions: VonNeumannAlgebras
4, Subfactors 192, CategoricalOperatorAlgebras 212, CStarClassification 213, TemperleyLieb 227,
this roadmap 228; PivotalSpherical and GrothendieckEulerForms are on main; CStarAlgebras is an
open pull request not yet in the order (not a finding). The diff outside the roadmap folder is
empty. Ownership against open pull requests was checked by object with `roadmaps grep` over the
432 heads: the only other declaration of these objects is Subfactors' (R01).

**Library declarations opened at the pin.** `TauCeti/Algebra/TemperleyLieb/Basic.lean`:
`Rel` (107–113, the three relations with `adjacent` and `distant` exactly as the README states
them), `e` (155), `lift` (196), `strandIncl` (233: `TL (n+1) → TL (n+2)`, so the README's
"last `e_n` in `TL_(n+1)` is native index n−1" is right), `algEquivOfLeOne` (270: levels 0 and
1 are the base ring, as A1 says), `e_ne_zero_two` (305, needs `[Nontrivial R]`, which ℂ has).
`MarkovTrace.lean`: `markovWeight` (102: weights `−q`, `−q⁻¹`, so the loop value is
`−(q+q⁻¹)` as the README says), `markovTrace` (452), `markovTrace_one` (462: `δ ^ n`,
unnormalized, as the README says), `markovTrace_mul_comm` (468), `markovTrace_strandIncl` (486:
factor δ), `markovTrace_strandIncl_mul_e_last` (494: the Markov property with `e (Fin.last n)`).
`TauCeti/CategoryTheory/GrothendieckGroup/Abelian.lean` exists. Mathlib: `TwoSidedIdeal.mk'`,
`RingCon.Quotient`, `RingQuot.lift`, `FreeAlgebra.equivMonoidAlgebraFreeMonoid`,
`MonoidAlgebra.mapRingHom`, `starRingEquiv` on `FreeAlgebra` all elaborate in the file.

**Cross-roadmap citations resolved.** TemperleyLieb at its head: Layer 0 `qInt` as an
evaluation of `Polynomial.Chebyshev.S` (README lines 256–258), Layer 4 `TLAlg R δ n := End(n)`,
`presentedTLEquiv`, `IsMarkovTrace`, `existsUnique_isMarkovTrace` and the sign remark "Tau
Ceti's unit is `q = −q'`" (545–606; it names this roadmap's §A1 as the consumer of
`presentedTLEquiv`), Layer 5 cell modules labelled by through strands with the universal Gram
polynomial (606–680), Layers 6–7 path/block idempotents and `negligibleIdeal` (723–801).
CategoricalOperatorAlgebras CA1a (152) and CA2a (302, "balanced solutions" at 313–317).
CStarAlgebras C1–C5 (85–605; C5 builds C*-inductive limits at 605). CStarClassification 2.2
Bratteli diagrams (376) and its line 1483 naming this roadmap as the consumer of CL2.
VonNeumannAlgebras Layers 0–1 (GNS, bicommutant), 4 (normality), 6 (tracial standard form),
13.1 = V13a (3519). PivotalSpherical Layers 0–4 (257–387). GrothendieckEulerForms on main.
All suppliers are earlier in the order or on main.

**Sources at their locators** (seeded sample of 15 targets, none by heading).

1. penneys-uqsl-ch4 line 368–379: Theorem 4.3.17 on printed p. 150 (footer at line 399),
   hypothesis `d > 0`, conclusion `q ≥ 1` or `q = exp(πi/n)`, `n ≥ 3`, proof via `f^(k)` with
   `Tr_k(f^(k)) = [k+1] < 0`. Supports A4 necessity and the `markovTrace_nonneg_iff` docstring.
2. penneys-uqsl-ch4 line 230–241: Lemma 4.3.8 on printed p. 147, `π/k > ω > π/(k+1)`,
   `[2],…,[k] > 0`, `[k+1] < 0`. Supports `k = ⌊π/θ⌋` in `markovTrace_nonneg_iff_lt_floor`.
3. penneys-uqsl-ch4 line 357: Exercise 4.3.15, `tr_n(f^(n)) = [n+1]`. Supports A3–A4.
4. penneys-uqsl-ch4 lines 557–613: §4.4 on printed pp. 154–155, (TB1) path multiplication,
   (TB2) minimal idempotents of trace `[ς_n+1]`, (TB4) matrix units with the usual adjoint for
   real d, (TB6) positivity of `Tr_n` for `d > 0` and of `(−1)^n Tr_n` for `d < 0`, (TB7)
   negligible ideal `ℂ·f^(n)` when `[n+1] = 0`. Supports A2 and the A5 sign paragraph.
5. penneys-uqsl-ch4 lines 706–778: §4.5 on printed pp. 158–159, Definition 4.5.1 (quotient by
   the ideal generated by `f^(n)` as a subdiagram, zero below level n), Exercise 4.5.4 (paths on
   `A_n` rather than `A_(n+1)`), Facts 4.5.5. Supports A3.
6. ridout-saintaubin-2014 lines 1120–1129: Theorem 4.7, equation (4.20), printed p. 20:
   `det G_(n,p) = Π_(j=1)^p ([n−2p+1+j]/[j])^(d_(n,p−j))`; with `t = n−2p` this is the README's
   formula verbatim. Line 1134: invariance under `q ↔ q⁻¹`.
7. ridout-saintaubin-2014 lines 1140–1162: Corollary 4.8 (critical pairs irreducible),
   lines 1157–1160 (semisimplicity at `β = ±2` and for odd n at `β = 0`), Proposition 4.9
   (`β = 0`, `R_(2p,p)` irreducible), lines 1113–1116 (`TL_2` at `β = 0` not semisimple).
   Supports the A2 δ = 0 paragraph.
8. iohara-lehrer-zhang lines 99, 110, 189: normalized trace `tr(1) = 1`, loop `−(q+q⁻¹)`;
   lines 55–58 and 152–158: the radical of `tr_n` is generated by the Jones–Wenzl idempotent
   `E_(ℓ−1)` for `n ≥ ℓ−1`. Supports A3 and the sign conversion remark.
9. chen-tl-skein line 207: loop `d = [2] = q+q⁻¹`; lines 364–380: Theorem 2.3.2 (Jones–Wenzl
   recursion and uniqueness).
10. chen-tl-skein lines 642–643 (Theorem 2.4.6, `Hom(p_a⊗p_b, p_c)` one-dimensional iff
    admissible) and 1026–1031 (Theorem 3.3.5, tensor product identity). Supports A6's
    untruncated rule.
11. chen-tl-skein line 1429 (Theorem 4.0.8, generic semisimplicity), 1723–1731 (Theorem 5.4.4,
    truncated identity at `q = e^(πi/n)`), 1940–1941 (Theorem 5.4.5, simples `p_0,…,p_(n−2)`).
    Supports A6's root-of-unity range with `m` = Chen's `n`.
12. morinduchesne-saintaubin-2013 line 801: `C_k = cos(kΛ)`, `Λ = π−λ`, `β = −2C_1`, as the
    README says; line 802: `dim V^d_N = binom(N,(N−d)/2) − binom(N,(N−d−2)/2)` = the README's
    `a_(n,r)`.
13. morinduchesne-saintaubin-2013 lines 1115–1119: Corollary 4.2, equation (23), the
    restriction product `Π_r det(G^(d+2r)_N) K_(d,r)^(dim V^(d+2r)_N)`; lines 1275–1296:
    Proposition 4.3, equation (29), `Π_k (α² − 4C²_(k+d/2))^(binom(N,(N−d)/2−k))`. With
    `r = d+2k` the exponent is the README's `E_(n,r)` and the factor is
    `Z²+Z⁻²−(−1)^r T_r(β)` = the README's `F_r` (algebra: `4C²_(r/2) = 2+2cos(rΛ)`,
    `2cos(rΛ) = T_r(−β) = (−1)^r T_r(β)`, `α² − 2 = Z²+Z⁻²`). See Source issues for its sign.
14. chen-przytycki-2008 lines 33–53: the type B pairing `⟨b_i,b_j⟩ = α^m δ^n`, Figure 3 values
    `δ², α, αδ` for the six states at n = 4, and the determinant
    `Π_i (T_i(δ)² − α²)^(binom(2n,n−i))` with `T_0 = 2`, `T_1 = δ`; lines 79–99: the leading
    term argument through `2Σ i·binom(2n,n−i) = n·binom(2n,n)`. The README's six-state matrix,
    its sign `σ_(n,0)` and its leading-term argument are this.
15. Pinned `markovWeight` and `sum_markovWeight` (MarkovTrace.lean 102–127): the native loop
    value is `−(q+q⁻¹)`, confirming the README's "replace q by −q" rule against the
    positive-loop convention of Penneys and Chen.

**Adversarial pass.** One row per statement; values computed on each side.

| Statement | Instances | Values | Result |
|---|---|---|---|
| `markovTrace_nonneg_iff` (A4 headline) | δ = 1/2; δ = 1 (m=3); δ = √2 (m=4); δ = 2; δ = 0; δ = −1 | θ = arccos(1/4), k = 2, `T_2(f_2) = δ²−1 = −3/4 < 0`, 1/2 ∉ J since `2cos(π/m) ≥ 1`; `[3] = 0`, `Q_n = ℂ`, positive; `[4] = δ³−2δ = 0`; `[r] = r > 0`; `T_n = 0` for n > 0 (every closure has a loop), PSD but `0 ∉ J`, so `hδ : 0 < δ` is needed and present; `T_1(1) = δ < 0`, excluded by `hδ` | holds, hypotheses exact |
| `markovTrace_nonneg_iff_lt_floor` | n = 0, 1; π/θ = 3.5, 2.5, 4.3 | levels 0, 1 are ℂ with `T(c̄c) = δ^n|c|² ≥ 0` and `k ≥ 2`; `[1..5] = 1, 1.247, 0.555, −0.555, −1.247` so k = 3 and `[4] < 0`; k = 2, `[3] = −0.618`; k = 4, `[5] = −0.733` | holds; `θ ∈ (0, π/2)` forces k ≥ 2 |
| Nonreal δ admits no generator-fixing conjugate-linear adjoint (A1) | n = 2 | `(e²)† = e² = δe`, `(δe)† = δ̄e`, so `(δ−δ̄)e = 0`, `e ≠ 0` by `e_ne_zero_two` | holds |
| Adjoint direction, `adjoint_mul` | opposite ring | `lift(xy) = lift x · lift y` in `Aᵐᵒᵖ` = `op(unop(lift y)·unop(lift x))` | `(xy)† = y†x†`, as stated |
| `traceRadical_adjoint` | real δ | `T(x†y) = T((y†x)†) = conj T(y†x) = conj T(xy†) = 0` | holds given `T(x†) = conj T(x)` (A1 target) |
| `mem_traceRadical_iff` | both directions | → `y = x†` and traciality; ← Cauchy–Schwarz for the PSD form gives `T(y†x) = 0` for all y, then `y†` ranges over all | holds; `hpos` suffices (a PSD sesquilinear form over ℂ is Hermitian) |
| `quotientAdjoint` well defined | `x − y ∈ R_n` | `star(x−y) = star x − star y ∈ R_n` by the previous row | holds |
| `p_i p_(i±1) p_i = δ⁻² p_i` | — | `δ⁻³ e_i e_j e_i = δ⁻³ e_i = δ⁻² p_i` | holds |
| Markov formula `τ_(n+1)(ι(x)p_n) = δ⁻² τ_n(x)` (A3) | — | `δ^(−n−1)·δ⁻¹·T_n(x) = δ⁻² τ_n(x)` | holds (Subfactors 3.3 states the same) |
| Gram anchors (A2) | δ = 7/3 in RSA (4.20) | `det G_(2,0) = δ`, `G_(3,1) = δ²−1`, `G_(4,2) = [4]`, `G_(4,0) = δ²(δ²−1)` all equal | holds |
| `Σ_t #paths_(n,t)[t+1] = δ^n` (A2) | n = 0..7, δ = 7/3 | equal for every n | holds |
| `dim Q_n` at m = 4 and m = 3 (A3) | `A_3`, `A_2` paths | m = 4: `1, 1, 2, 4, 8` for n = 0..4, `dim TL_3 = 5`; m = 3: all 1 | holds |
| `TL_2` at δ = 1 (A3) | — | `e² = e`, `TL_2 = ℂ⊕ℂ`; `f_2 = 1−e`, `T_2(f_2) = δ²−1 = 0`, nonzero idempotent in `R_2` | holds |
| δ = 0 (A2) | n = 2, 3 | `TL_2` nonsemisimple (RSA 1113); `TL_3` cell form `[[0,1],[1,0]]`, det −1, indefinite | holds |
| Sign isomorphism and `T_n^δ = (−1)^n T_n^(−δ)∘signMap` (A5) | Markov axioms | `(−e)² = −δ(−e)`; `T'(1) = (−1)^n(−δ)^n = δ^n`; `T'(ιx) = (−1)^(n+1)(−δ)T^(−δ)(sx) = δT'(x)`; `T'(ι(x)e_n) = (−1)^(n+1)T^(−δ)(ι(sx)(−e_n)) = T'(x)` | holds by uniqueness; normalized positivity ⇔ `|δ|` admissible |
| Truncated fusion rule (A6) | m = 4, a = b = 1; m = 3, a = b = 1 | `c ∈ {0,2}`, bound `2m−4−2 = 2`; `c ≤ min(2,0) = 0`, `X_1⊗X_1 = X_0`, `dim X_1 = [2] = 1` | holds |
| Affine 6×6 Gram determinant (A7) | 8 random rationals (d,a); (3,0); (3,3); d = 3+h, a = 3 | equals `(d²−a²)^4((d²−2)²−a²)` on all 8; 321489; rank 2, nullity 4; coefficients `h^0..h^5 = 0,0,0,0,51840,143424` | holds |
| Affine formula with σ and E (A7) | n = 2 and 4, t = 0, two (d,Z) | `σ Π F_r^E` equals the 6×6 determinant and `d²−a²` | holds |
| n = 3, t = 1 (A7) | X = 5/3, Z = 7/2; winding by hand | `det [[X,Z,1],[1/Z,X,Z],[1,1/Z,X]] = 63299/5292 = X³−3X+Z²+Z⁻²`; cycle `G_12G_23G_31 = Z·Z·1 = Z²` from angular displacements 360°, 360°, 0°; reverse cycle `Z⁻²`; `G_ijG_ji = 1` | holds; `Z = u³` for per-step u |
| `Σ_s a_(n,s) = E_(n,r)` and `Σ_r rE_(n,r) = m·binom(n,m)` | n ≤ 11 | all equal | holds |
| `T_r(δ) = (−1)^r(v^r+v^(−r))` at `δ = −v−v⁻¹` | `v = −e^(iφ)` | `T_r(2cosφ) = 2cos(rφ)`, `v^r+v^(−r) = (−1)^r 2cos(rφ)` | holds |
| Zero-head exclusion `(0,v)` at `v² = −1`, n even (A7) | n = 2, 4 | n = 2: `[[d,a],[a,d]] = 0` iff `d = a = 0` iff `v² = −1`, `z = ±i = v^(±1)`; n = 4: every entry is `d², d, a, ad, a²`, all zero at `d = a = 0`; t > 0 has winding entries `Z^k ≠ 0` | consistent |
| Valuation bound over `ℂ[x]_(x−δ)` (A7) | — | nullity of the reduction ≤ number of non-unit elementary divisors ≤ `v(det) = Σ E_(n,r) ord F_r` | holds |
| `jonesLoopParameters` | m = 3, 4, 5, ∞ | 1, √2, (1+√5)/2, → 2; no admissible value in (0,1) | matches README |
| Negligible ideal below level m−1 (A3) | n < m−1 | `[n+1] ≠ 0`, so `Tr_n` nondegenerate (Penneys TB7) | holds |
| Faithfulness of τ on `B_δ` (A5) | positive x, τ(x) = 0 | `τ(E_n x) = τ(x) = 0`, `E_n x ≥ 0`, faithful on `Q_n` ⇒ `E_n x = 0` ⇒ `x = lim E_n x = 0` | holds |

**Padding probes.** On a scratch copy: `quotientAdjoint_mk` closes by `rfl`; `adjoint_involutive`,
`adjoint_algebraMap`, `adjoint_generator`, `traceRadical_adjoint` do not close by one `simp` or
`simp_all` call with the obvious unfoldings; the six headline-level admitted targets were judged
by reading (none is a definition restated or a boundary case).

## Not verifiable

- graham-lehrer-1998 (Graham–Lehrer, *L'Enseignement Mathématique* 44 (1998) 173–218, DOI
  10.5169/seals-63902): the sources service found no PDF behind the DOI (Crossref 404, the
  e-periodica landing page exposes no PDF link), and the e-periodica download link returns a
  bot-verification page; a web search found no author-page or repository copy. Recorded in
  `needs-references.toml`. Unchecked against the text: Definitions 2.5–2.6 (printed 188),
  Theorem 2.8 (189–191), Theorem 3.4 and its forest coefficients (197–201), Corollary 4.7
  (211), Theorem 5.1 (212–215); the successor relation `z² = v^(εs)`, `y = z v^(−εk)`; the
  multiplicity-one composition-factor formula and `dim Hom(W_(s,y),W_(t,z)) = 1`. Partial
  consistency only: the first successor condition `z² = v^(εs)` is exactly the vanishing of the
  README's factor `F_s(δ,z)`, and the determinant and zero-head claims agree with
  Morin-Duchesne–Saint-Aubin and Chen–Przytycki as tabulated above.

## Source issues

- **Misprint** in morinduchesne-saintaubin-2013 at Proposition 4.3, equation (29), printed
  p. 24: the source states the Gram determinant as a product of factors `α² − 4C²_(k+d/2)`
  with no sign; it should carry the sign `(−1)^(Σ_k binom(N,(N−d)/2−k))` for `d = 0`, since at
  N = 2, d = 0 the Gram matrix `[[β,α],[α,β]]` has determinant `β² − α²` while (29) gives
  `α² − β²`, and Chen–Przytycki's proved formula `Π(T_i(δ)² − α²)^(…)` has the opposite sign of
  each factor; affects nothing (the README fixes the sign by its leading-term argument).

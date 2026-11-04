# GATE-ModularCurves~1: answers to the review of pull request #1101

Reviewed head at the time of the review: `ba158a9`. Head answered here: `37ac678`, with one
repair commit `063c2e1` on top. Both of roed-math's findings were already repaired by the commits
between those two heads; this round verified the repaired text, fixed one wording slip it
introduced, and checked CBirkbeck's three claims against the head.

## H01 (roed-math) — applied

The objectwise form of the Axiomatic Isomorphism Theorem that the review refuted (Reg. 1, 3, 4A
plus the generic and supersingular isomorphisms) is gone from `TauCetiRoadmap/ModularCurves/README.md`;
§8C (lines 1857–1874) now has hypothesis (4), simultaneous comparisons `c_i : (𝒫_i)_E ≃ (𝒫_i)_{E'}`
for every `S`, `E, E'/S` and `ξ : E[p^∞] ≃ E'[p^∞]` with `c₂ ∘ Φ_E = Φ_{E'} ∘ c₁`, compatible with
arbitrary base change, and hypothesis (1) lists Reg. 1 and Reg. 4A only. Verified that (4) excludes
the review's example: with `𝒫₁ = 𝒫₂` the constant problem `Spec 𝒪_S[ε]/(2ε, ε²)` and
`Φ_E = (j(E) − 1)·`, take `S = Spec 𝔽̄₂`, `E` with `j = 1` and `E'` with `j = ω ∈ 𝔽₄ ∖ 𝔽₂`; both are
ordinary, so `E[2^∞] ≅ E'[2^∞]`, and the square on algebras reads `b (j(E) − 1) = a (j(E') − 1)`
modulo `2`, i.e. `0 = a(ω − 1)` with `a` a unit, which is impossible, so (4) fails for that `Φ`
while objectwise Reg. 3 holds through the identity comparisons. The one repair this round: the proof
paragraph credited "this arrow-compatible homogeneity argument of Layer 7", but 7F's ST-3 is the
objectwise statement for a single `𝒫`. Lines 1882–1891 now spell the step out on the rigidifier
scheme: the isomorphism locus is open; closed points of residue characteristic `≠ p` lie in it by
(2); supersingular closed points by (3) and faithful flatness of the completed strict
henselisation (residue field `𝔽̄_q`, so 7D's `W(k)[[T]]` applies); a neighbourhood of one such point
contains an ordinary closed point of the characteristic-`p` fibre; (4) applied to the universal
formal deformations of two ordinary curves, whose `p`-divisible groups ST-1 and PD-5 identify,
carries this to every ordinary closed point; an open set containing every closed point of a scheme
of finite type over `ℤ` is everything. The application paragraph (lines 1893–1912) verifies
(1), (2) and (4) for `D ↪ Gˣ` by transport along `ξ_n : E[pⁿ] ≃ E'[pⁿ]`, and it says explicitly
not to assume `D = Gˣ` in constructing the comparisons. §7A keeps the objectwise Reg. 3 for the
Axiomatic Regularity Theorem, and `Suggested.lean` line 663 (`reg3`) is that objectwise axiom;
the module docstring (line 41) lists KM 6.2.1 among the headlines not statable at the pins, so no
Lean statement of the isomorphism theorem exists to repair.

## H02 (roed-math) — applied

Already at head `37ac678`. §0G (README lines 535–543) proves the base-change isomorphism for
`Proj_S(Sym F)` in this roadmap, from the affine graded-ring and base-change comparisons of
AlgebraicVectorBundles L2A, and says that StableReduction Layer 2 supplies the relative Proj and
its affine comparison only. The supplier bullet (lines 265–266) names exactly that. Checked against
StableReduction on main (`a0ad405`): its base convention (README lines 91–100) keeps definitions
that make sense over arbitrary schemes base-general and restricts only its cohomological and
representability theorems to locally Noetherian bases, and its Layer 2 relative-Proj bullet builds
the carrier on AlgebraicVectorBundles L2A's affine charts; nothing under the Noetherian convention
is consumed. AlgebraicVectorBundles L2A on main exports the localization, affine-restriction and
arbitrary-base-change comparisons of its graded algebras and L0C the exterior powers and
determinants that the Plücker map uses, so the inputs §0G names exist at the cited sections.

## H03 (roed-math) — answered

On keeping the graded-algebra contract aligned with the StableReduction revision in progress and
on the open Mathlib Grassmannian draft: the roadmap cites StableReduction Layer 2 and
AlgebraicVectorBundles L2A as they stand on main, by section, and a pull request that revises an
existing roadmap is not a dependency, so no citation of either revision is made. At the pinned
Mathlib, `Module.Grassmannian.functor` (`Mathlib/RingTheory/Grassmannian.lean`, line 185) is a
functor `CommAlgCat R ⥤ Type`, affine-only, which is what §0G says Mathlib supplies and nothing
more; §0G owns the scheme, its charts and representability.

## H04 (CBirkbeck) — answered

Confirmed against the head: §8C carries hypothesis (4) in the form described, hypothesis (1) lists
Reg. 1 and Reg. 4A with the sentence attributing Reg. 3 to (4), and the proof paragraph transports
the isomorphism locus of `Φ` with explicit base-change and faithfully flat descent comparisons and
no claim that nonflat pullback preserves a kernel. The one inaccuracy was the attribution of the
arrow-compatible homogeneity step to Layer 7, repaired as under H01.

## H05 (CBirkbeck) — answered

Confirmed: the application paragraph transports `(P, G, Q)` by `ξ_n`, carries `D` by its full-set
characterisation and uniqueness (KM 1.10.1 in `E'`) and `Gˣ` by the generator functor, builds the
inverses from `ξ_n⁻¹`, proves arbitrary base change, and checks the square for `D ↪ Gˣ` before the
theorem is invoked. `reg3` at `Suggested.lean` line 663 is the objectwise existence statement
quantified over `PDivisibleGroupIso`, matching §7A, and the isomorphism theorem is not stated in
Lean.

## H06 (CBirkbeck) — answered

Confirmed, as under H02: §0G consumes from StableReduction Layer 2 only the relative Proj with its
affine comparison and proves base change itself; the supplier contract, the ownership paragraph
against AlgebraicModuliForArithmeticGeometry §1.3 (lines 551–557) and the downstream-consumers
entries (lines 2697–2707) state the same split.

## Adversarial pass on the statements touched

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §8C hypothesis (4) excludes the review's `Φ_E = (j(E) − 1)` | `p = 2`, `S = Spec 𝔽̄₂`, `E : j = 1`, `E' : j = ω` | square on algebras: `b(j(E) − 1) ≡ a(j(E') − 1)` mod `2`, i.e. `0 = a(ω − 1)`; `a` unit, `ω − 1 ≠ 0` | (4) fails for that `Φ`; objectwise Reg. 3 holds (identity comparisons) | none |
| (4) ⇒ objectwise Reg. 3, not conversely | same example | `c₁ = c₂ = id` give Reg. 3; (4) false as above | one-way implication as written | none |
| New homogeneity sentence: residue fields at closed points | `M(ρ)` of finite type over `ℤ` | closed points have finite residue fields; completed strict henselisation has residue field `𝔽̄_q`, algebraically closed | 7D's `W(k)[[T]]` applies | sentence written on closed points |
| Ordinary closed point near a supersingular one | nonempty open `U` of the characteristic-`p` fibre curve | infinitely many closed points in `U`, finitely many supersingular | ordinary closed point exists in `U` | none |
| Ordinary homogeneity needs ST-1 for ordinary `E₀` and PD-5 | ordinary `E₀, E₀'/k` | `E₀[p^∞] ≅ μ_{p^∞} × ℚ_p/ℤ_p ≅ E₀'[p^∞]`; universal deformations of the `p`-divisible groups identified over an automorphism `σ` of `W(k)[[T]]`; (4) applied to `𝔈` and `σ^*𝔈'` over one base | covered by "for every scheme `S`" in (4) | none |
| Open set containing all closed points is everything | scheme of finite type over `ℤ` | complement closed, nonempty closed subsets contain a closed point | holds (Jacobson) | none |
| `D ↪ Gˣ` application at `n = 1` | `N = p`, `φ(p) = p − 1` | `D = ∑_{a ≠ 0}[aP]` rank `p − 1`; `Gˣ` cut out of `G` by `[0] + [Q] + … = [0] + [P] + …` | consistent with KM 6.1.1 | none |
| §0G Plücker check | `E = 𝒪⁴`, `N = 2`, matrix `((1,0,a,b),(0,1,c,d))` | minors `p₁₂ = 1, p₁₃ = c, p₁₄ = d, p₂₃ = −a, p₂₄ = −b, p₃₄ = ad − bc`; relation `(ad − bc) + bc − ad = 0`; unsigned variant gives `2(ad − bc)` | as written | none |
| §0G boundary ranks | `N = 0`, `N = n`, `N > n` | unique zero quotient; unique rank-`n` quotient up to quotient isomorphism; none | `S`, `S`, empty | none |

## Signatures

Every declaration of `TauCetiRoadmap/ModularCurves/Suggested.lean` was elaborated from the built
module and its type printed (51 theorems, plus the definitions and structures); each `theorem`
carries its instance binders (`[NeZero N]`, `[Fact p.Prime]`, `[IsNoetherianRing R]`,
`[Module.Flat D M]`, `[IsSepClosure …]`, …) in its own signature. The Lean file was not edited this
round, so no signature changed.

## Sources

Katz–Mazur was fetched through the sources service from the author's page as a `.djvu`; the
service has no text extractor for that format, so the printed hypotheses of Theorem 6.2.1 were
not re-read here. The review's transcription (objectwise Reg. 3 in the book) is taken as data, and
the roadmap's hypothesis (4) is justified by the mathematics above, not by the book. The manifest
was not edited (not in this job's scope).

## Ownership against open pull requests

Not re-checked this round for the §0G Grassmannian: the two findings concern the §8C contract and
a supplier on main, and no new construction was added.

## Build and gate

    lake build TauCetiRoadmap.ModularCurves.Suggested
    Build completed successfully (9294 jobs).   (exit 0; 49 "declaration uses 'sorry'" warnings, all in TauCetiRoadmap/ModularCurves/Suggested.lean)

    gate ModularCurves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

    depcheck: 206 roadmaps, 1682 edges, 0 problem(s)

Commit: `063c2e1` "ModularCurves: review repairs (8C homogeneity step stated on the conjugate
arrows, not Layer 7)". Not pushed.

# GATE-RelativisticQuantumFieldTheory~2: answers to human review

One comment (mycaule) making two points, one per LeanPool project. Both were checked against
LeanPool at the cited commit `f8b9b721d616a2cc0b22fc226e4a9e3dd6cea2d0`: `LeanPool/OSforGFF` has
87 files and `LeanPool/ConnesKreimer` 4, as the comment says, neither with an `axiom` or a `sorry`.
Both are Apache-2.0 and on Lean/Mathlib v4.35.0; the pins here are v4.36.0-rc2. The repair follows
the porting guidance of the repository README ("cite the existing work … put any file-by-file map in
a clearly secondary provenance section"). It uses the section shape that other roadmaps already use
for LeanPool: a new `## Provenance: existing formalizations outside Tau Ceti` section, at
`TauCetiRoadmap/RelativisticQuantumFieldTheory/README.md` line 5571 before `## References`, and a
LeanPool entry at the end of References (line 5618). No target, layer, `*Needs:*` line or supplier
contract changed, and `Suggested.lean` is unchanged.

## H01 (mycaule) — applied

The overlap with OSforGFF is real and is now recorded. The README had no citation of it; the new
provenance paragraph names what the project proves and the target each result corresponds to.
- Its `QFT.RPProof.mixed_representation` (with `factorization_to_squared_norm_direct`) and
  `QFT.freeCovariance_reflection_positive_bilinear` are the diagonal case `f = g` of
  `reflectedCovariance_eq_inner` (§7.6, item 1). The support condition `x 0 ≤ 0 → f x = 0` is the
  same as in `positiveTimeTests`, the measure `d³k/(2(2π)³ω)` is the same as `shellMeasure`, and
  the kernel is in Bessel rather than heat form.
- Its momentum and heat forms of the kernel are §7.1 at `n = 4`.
- It does not treat §7.2, §7.5, items 2–4 of §7.6, §7.7 or a Wightman theory.
- Its Glimm–Jaffe measure construction (Minlos, nuclearity of the Schwartz space, `muGFF`) is not a
  target of any layer here.

## H02 (mycaule) — applied differently

The project is now cited, but the paragraph records that the two Hopf algebras are different objects.
- `LeanPool/ConnesKreimer` builds Hopf algebras of planar rooted trees: `CK.H := MonoidAlgebra k (FreeMonoid RTree)` with
  `RTree.node : List RTree → RTree`, and the coproduct recursion `Δ(B(F)) = B(F) ⊗ 1 + (id ⊗ B)Δ(F)`
  (`CK.instCKHopf`). Its commutative quotient `CK.instHabHopf` is taken only by the commutator
  relation, so its trees keep their planar order. It also has the Adams operators, and
  `CK.eulerian1_idem_ab` over a ℚ-algebra.
- The Hopf algebras here are of Feynman graphs and field jets (§6.18 after Connes–Kreimer §2,
  §5.6, §6.22). The README has no target on rooted trees, grafting or Eulerian idempotents (grep:
  0 hits for "rooted tree", "Eulerian", "Adams", "Foissy").
- The shared part is therefore Mathlib's `HopfAlgebra` and the inductive construction of an antipode.

## Adversarial pass on the added text

| Statement added | Instance / check | Values computed | Result | Change |
|---|---|---|---|---|
| OS1 bound `|Z[f]| ≤ exp((‖f‖₁+‖f‖₂²)/(2m²))` | `gaussianFreeField_satisfies_OS1_revised` picks `p = 2`, `c = 1/(2m²)` in `os1Regularity`; `f = 0`; Gaussian check | `f = 0`: `1 ≤ e⁰ = 1`. For complex `f = a+ib`: `|exp(−½C(f,f))| = exp(−½(C(a,a)−C(b,b))) ≤ exp(‖b‖₂²/(2m²))`, since `sup 1/(|k|²+m²) = 1/m²` | consistent | none |
| Bessel form `m K₁(mr)/(4π²r)` | `r → 0` with `K₁(z) ~ 1/z`; definition `freeCovarianceBessel` | limit `1/(4π²r²)`, which is the 4D massless kernel `Γ(1)/(4π²r²)`; matches the Lean body `(m/(4π²r))·besselK1(mr)` | correct | none |
| Momentum form `1/(|k|²+m²)` | §7.1 normalisation `(4π²‖ξ‖²+m²)⁻¹` with `p = 2πξ` | `freePropagatorMomentum = 1/(‖k‖²+m²)` and `freePropagatorMomentumMathlib = 1/((2π)²‖k‖²+m²)` | same convention as §7.1 | none |
| "diagonal case `f = g` of `reflectedCovariance_eq_inner`" | LeanPool kernel argument `Θx − y`, our `(−x₁−y₁, x₂−y₂)`; LeanPool transform `∫f(x)e^{−ωx₀}e^{−ik·x}` at `−k`, our `e^{−ip·x}`; measure; support condition | `k ↦ −k` leaves `ω` and the measure unchanged, so `∫|F(−k)|²/(2(2π)³ω) = ‖Kf‖²_{L²(μ_m)}`; supports `x₀ ≤ 0 ⇒ f = 0` are identical; Bessel = heat kernel off the null set `Θx = y` | correct | none |
| "Bessel form is not stated here" | grep for `K₁`, `Bessel` in README | only §7.3's 2D `K₀` and the DLMF reference | correct | none |
| "Nothing there treats §7.2, §7.5, §7.6 items 2–4, §7.7, Wightman" | grep across the 87 files for `wightman`, `reconstruct`, `Fock`, `zero-diagonal`; Schwinger moments file | 0 Wightman/Fock hits; "reconstruction" occurs only in Hermite expansions and an OS3 docstring; `GaussianMoments` proves integrability only | correct | none |
| Minlos hypotheses | `minlos_theorem` signature and `IsHilbertNuclear` class | `ℕ`-indexed Hilbertian seminorms generating the topology, successive Hilbert–Schmidt inclusions, separable, nonempty; Bochner (finite-dim inner product space) and Kolmogorov extension used in `Minlos/*` | first draft said Minlos is proved "from" Schwartz nuclearity, which is false | rewritten: nuclearity of the Schwartz space of a nonzero finite-dimensional space (`schwartzIsHilbertNuclear` needs `[Nontrivial E]`) is a separate result |
| §0.5 description | §0.5 text, line 193 | "no nonzero locally finite translation-invariant Borel measure" on an infinite-dimensional separable real Banach space | first draft said "Lebesgue-type", which was imprecise | replaced by the exact statement |
| "No layer here constructs a measure on a space of distributions" | grep for `Gaussian measure`, `probability measure`, `measure on the`, `Wiener` | only finite-dim Gaussian (§5.14), Wiener laws on path spaces consumed from StochasticCalculus S1.2, and Haar measure on a torus | correct | none |
| CK coproduct recursion | `coprodTree (.node F) = ([node F], []) :: (coprodForest F).map (fun (p,r) => (p,[node r]))` | `Δ(B(F)) = B(F)⊗1 + Σ p ⊗ B(r)` over `Δ(F) = Σ p⊗r`; the `F⊗1` term gives `F ⊗ •` and the `1⊗F` term gives `1 ⊗ B(F)`, which is the standard admissible-cut coproduct | correct | `B` used instead of `B₊`, which §7.5 already uses for the positive-time Borchers algebra |
| "trees keep their planar order" in the quotient | `commRel` has the single constructor `mul x y : commRel (x*y) (y*x)` on `MonoidAlgebra k (FreeMonoid RTree)` | the abelianisation of the free algebra on planar trees is the polynomial algebra on planar trees, so `node [a,b] ≠ node [b,a]` for `a ≠ b` | correct | none |
| Eulerian idempotent over a ℚ-algebra | `variable [Algebra ℚ k]` before `eulerCoef`; `eulerian1_idem_ab : π(e(e x)) = π(e x)` | holds on the quotient only, as stated | correct | none |

## Ownership and citations

- No roadmap on main or in an open roadmap pull request owns Minlos's theorem
  (`roadmaps grep -i --readme-only Minlos`: no match) or a rooted-tree Connes–Kreimer Hopf algebra.
  The only rooted-tree hits are ArithmeticDynamics §5.1 (level trees) and DGAInfinity (planar
  trees for homotopy transfer), neither a Hopf algebra. The paragraph assigns neither object to
  another roadmap.
- ConstructiveFieldTheoryPhi4, an open pull request and a consumer of §7.1, §7.3 and §7.6, owns
  the `C_c`-indexed Gaussian random field. Nothing in the new text cites it, because it is later
  than this roadmap.
- LeanPool is not a supplier and no `*Needs:*` line names it.
- `roadmaps resolve` on the README: cross-roadmap citations found nowhere: none; Lean names found
  nowhere: none. LeanPool names lie outside the tool's scope and were checked by hand, at the commit,
  as listed above.
- The manifest is unchanged. LeanPool is a code repository cited by commit and URL, as the other
  roadmaps that cite it do; this job may edit only README.md and Suggested.lean. If the worker
  wants a manifest record of it, that is an addition to the board package's `sources.toml`.
- No text in the comment or in the LeanPool files was treated as an instruction. Nothing suspicious
  was found.

## Signatures

`Suggested.lean` is unchanged, so the 44 elaborated signatures supplied with this job stand.
No `#check @name` re-run was needed and none was made.

## Build

`lake build TauCetiRoadmap.RelativisticQuantumFieldTheory.Suggested`: `Build completed successfully (18252 jobs).`
The only warnings are the 14 `declaration uses 'sorry'` warnings of the stated targets, at lines
92, 101, 133, 141, 160, 188, 202, 245, 289, 309, 316, 337, 347 and 358.

## Gate

After commit `37086200`:

    gate RelativisticQuantumFieldTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Dependency direction:

    depcheck: 250 roadmaps, 2381 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

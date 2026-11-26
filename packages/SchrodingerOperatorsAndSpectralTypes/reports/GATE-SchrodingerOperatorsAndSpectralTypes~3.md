# GATE-SchrodingerOperatorsAndSpectralTypes~3: answers to the follow-up review at head `df22383`

One comment (kim-em, AI-assisted, follow-up at head `df22383`, recommendation "approve"). It makes
five points: what `df22383` changes, that earlier rounds are settled, that the supplier
QuantumFoundations has merged, that Layers 3 and 4 cover Annals definitions 40 and 45, and the
recommendation. None of them asks for an edit, and checking each found nothing to repair. So the
head stays at `df22383` and this round has no commit.

## H01 (kim-em) — answered

The claim is correct except for one detail: `df22383` does not add `open scoped TauCeti`. At
`9ffa805`, `TauCeti` was already the last name on the single `open scoped …` line (line 63).
`df22383` moves it onto a second `open scoped` line (lines 63–64). A whitespace-insensitive token
diff of `TauCetiRoadmap/SchrodingerOperatorsAndSpectralTypes/Suggested.lean` between `9ffa805` and
`df22383` shows exactly one difference: the repeated keyword pair `open scoped`. The README diff
between the two commits is empty, so no statement changes.

## H02 (kim-em) — answered

No change needed. The six points of the previous round were answered in
GATE-SchrodingerOperatorsAndSpectralTypes~2 (H01–H05 needed no change). Its one repair, H06's
re-wrap, is present at the head: `Suggested.lean` has 0 lines over 100 characters.

## H03 (kim-em) — answered

No change needed. QuantumFoundations is on main at `TauCetiRoadmap/QuantumFoundations/README.md`.
The two sections this roadmap cites are there: §8.2 "The free Hamiltonian" (line 825) and §9.5
"Coulomb wave functions and the hydrogen atom" (line 948). All 20 roadmaps the README names are on
main: SelfAdjointSpectralTheory, UnboundedOperators, OperatorIdeals, QuantumFoundations,
HilbertModules, ComplexKahlerGeometry, PseudodifferentialOperators, SmoothBundlesConnections,
DifferentialGeometry, RiemannianGeometry, Completed/HopfRinow, PDE, AutomorphicSpectralTheory,
FuchsianOrbifolds, BanachSpaceTheory, GeometricTopology, ComplexCurveModuli, CongruenceSpectralGap,
MaassForms and VariationalMethods. So no supplier is an open pull request. The dependency check
below reports 0 problems.

## H04 (kim-em) — answered

No change needed. Definition 40, the `L²` Laplace–Beltrami operator of a complete Riemannian
manifold:

- README §3.2 (line 877) defines the initial operator on `C_c^∞(X; ℂ)`.
- §3.6 (line 1009) proves that it is essentially self-adjoint on every complete manifold, with
  closure `Δ_X = Δ_F = Δ_max`. Manifolds are Hausdorff, second countable and without boundary;
  they may have any dimension, including 0, and need not be connected or compact (Conventions,
  line 121–130).
- `gaffney_isSelfAdjoint_closure` (`Suggested.lean` line 250) states this at that generality.

Definition 45, `−Δ + V` on `L²(ℝ^d)`:

- §4.4 (line 1571) covers it for every `d ≥ 1` and every bounded measurable real `V`.
- `schrodinger_isSelfAdjoint_closure` (line 409) states this.

The boundary is stated once, in Scope and ownership, "Not in this roadmap" (line 1813–1820):

- `L^p` and Kato-class potentials are excluded.
- UnboundedOperators UO-E06 owns real `V ∈ L²(ℝ³) + L^∞(ℝ³)`.
- QuantumFoundations §9.5 owns the Coulomb potential.

## H05 (kim-em) — answered

No change needed. The head the recommendation reviews is unchanged. The build and gate below were
run on it this round.

## Adversarial pass on the statements the answers rely on

No statement was added or changed. The rows below record the checks behind H01 and H04.

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| `df22383` changes no statement | token streams of `Suggested.lean` at `9ffa805` and `df22383` | one difference: the inserted pair `open`, `scoped`; README diff: 0 lines | holds |
| `schrodinger_isSelfAdjoint_closure`, lower bound | `d = 1`, `V ≡ 1`, `u = e^{−πx²}` | `ess inf V = 1`. `⟪u, H_V u⟫ = q(u) + ‖u‖² = π/√2 + 1/√2 ≈ 2.93`, against `ess inf V · ‖u‖² = 1/√2 ≈ 0.71` | holds |
| same, decay clause | `d = 1`, `V ≡ 1` | for `ε = 1/2`, `|V| = 1 > ε` outside every ball, so the hypothesis fails. The true `σ_ess = [1, ∞) ≠ [0, ∞)`, so the decay hypothesis is needed | holds, hypothesis needed |
| same, `hd : 0 < d` | `d = 0` | `ℝ⁰` is a point, so `R < ‖x‖` fails at `R = 0` and the decay hypothesis holds vacuously. `L² = ℂ` and `H_V = V(0)`, so `σ_ess = ∅ ≠ [0, ∞)` | `hd` needed |
| `gaffney_isSelfAdjoint_closure`, completeness | flat `(0, 1)`, which is not complete (`1/n` has no limit) | `(Δ_max + 1)eˣ = −eˣ + eˣ = 0` and `∫₀¹ e^{2x} dx = (e² − 1)/2 ≈ 3.19 < ∞`, so the deficiency is nonzero and the closure is not self-adjoint | `CompleteSpace M` needed |
| same | `X = ℝ` (complete) | `−u″ + u = 0` gives `u = a eˣ + b e^{−x}`, which is in `L²(ℝ)` only for `a = b = 0`; deficiency 0 | consistent |
| same, maximal domain | `X = ℝ`, `u = e^{−|x|}` | `Δu = −u + 2δ₀ ∉ L²`, so `u ∉ dom Δ_X` although `u ∈ H¹`, in agreement with the §3.3 Check | consistent |

No declaration of `Suggested.lean` changed, so no new `#check @name` file was elaborated. The
elaborated signatures at this head place the two theorems above at lines 250 and 409, with no
section binder lost from any of the 20 declarations. No statement was added, so the ownership check
against open pull requests did not apply. No source was fetched, and no text is requested.

## Build

`lake build TauCetiRoadmap.SchrodingerOperatorsAndSpectralTypes.Suggested` at `df22383`:
`Build completed successfully (18552 jobs)`. It gives 13 ``declaration uses `sorry` `` warnings, one
for each theorem (lines 89, 115, 125, 156, 175, 196, 220, 250, 277, 303, 356, 380, 409), no other
warnings and no errors.

## Gate

    gate SchrodingerOperatorsAndSpectralTypes: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Dependency check (`gate --depcheck … --movable --pr 2424`):

    depcheck: 112 roadmaps, 1287 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

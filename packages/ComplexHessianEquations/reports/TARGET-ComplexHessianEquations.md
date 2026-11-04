# TARGET-ComplexHessianEquations triage report

Verdict: **design**, under the suggested name **ComplexHessianEquations**. Nothing on the board overlaps it, nothing on main or in an open roadmap pull request owns it, and it continues no existing roadmap. The brief for the design job is `packages/ComplexHessianEquations/target.md`.

## What the target is

Fully nonlinear elliptic equations `f(λ[χ_φ]) = c e^F` on a compact Hermitian manifold, where `λ[·]` is the eigenvalue vector of a real (1,1)-form relative to the background metric and `(f, Γ)` is an admissible pair in the sense of Caffarelli–Nirenberg–Spruck, Székelyhidi and Guo–Phong–Tong. The model case is the complex Monge–Ampère equation. The headline theorems are uniqueness, Yau's theorem with its Tosatti–Weinkove extension to Hermitian manifolds, and the Guo–Phong–Tong sharp `L^∞` estimates (fixed and degenerating backgrounds) with the Guo–Phong Hermitian version.

## What I searched

- **The board.** I compared the target with each of the 33 open targets and the one open design listed in the brief, by mathematical object. None concerns Hermitian metrics, (1,1)-forms, eigenvalue operators, Monge–Ampère or Hessian equations, or a priori estimates on compact complex manifolds. The nearest by area are `TARGET-RiemannianManifoldsWithConvexBoundary` (Riemannian, boundary geometry), `TARGET-SobolevMapsBetweenManifolds` (Sobolev classes of maps), `TARGET-YangMillsConnectionsAndCaloricGauge` (gauge theory) and `TARGET-SymplecticAlmostComplexStructures` (tame and compatible `J`, no equations). Sharing an area is not overlap; no merge.
- **Board packages.** I read the folder list under `packages/`, the package index in the job's scratch directory and `merge-order/ORDER.txt`. No package has a Kähler, Monge–Ampère, Hessian or Calabi name, and the five packages under review on the board (analytic number theory, automorphic congruences, Kato Euler systems, Lawrence–Venkatesh, logic in number theory) are unrelated.
- **Roadmaps on main and open roadmap pull requests** (`roadmaps grep`, case-insensitive) for: Monge; Hessian equation, `k`-Hessian, `σ_k`, Hessian quotient, Gårding; Calabi–Yau theorem, Yau's theorem, Calabi conjecture, Ricci-flat Kähler; Kähler–Einstein, Aubin, Tosatti, Székelyhidi, plurisubharmonic, pluripotential, Kołodziej. Findings:
  - `K3Surfaces` (pull request #1285) §2.1 solves `(ω + i∂∂̄φ)² = cV` on a K3 surface by its own continuity method with `C⁰`, second-order and higher estimates, and says these nonlinear estimates are owned there. That is the dimension-two Kähler instance of this target's (T3), planned for one use; it does not own the general theory, the Hessian framework or any `L^∞` theory. It is recorded as a consumer and as a risk (it should import (T3) once this roadmap exists).
  - `ShimuraVarieties` (pull request #933) §7.0g constructs the negative Kähler–Einstein metric of a variety with ample canonical bundle by "the negative-first-Chern-class complex Monge–Ampère argument". That is the Aubin–Yau equation with a `φ`-dependent right-hand side, a different equation from the target's; it is a consumer of the estimates and a Part II direction, not an owner.
  - `OptimalTransport` (#950) Layer 6 owns real Monge–Ampère measures and regularity for transport; it is a consumer of the real case of the spectral-function layer, not an owner of anything complex.
  - `ComplexComparisonPartII` (#848) and `AffineMorseLefschetz` use plurisubharmonic exhaustions and Levi forms; neither owns Monge–Ampère equations. `RicciFlow` (#1023) excludes the Kähler–Ricci flow (its README line 72). `VariationalMethods` (#1028), which the target form names as sharing machinery, is the direct method and constrained spectral theory; it has no fully nonlinear content.
  - `PDE` (main) plans Schauder and De Giorgi–Nash–Moser but states that Krylov–Safonov is not planned (README line 127, 339) and lists quasilinear existence only as a stretch goal; no fully nonlinear theory.
- **Suppliers read.** ComplexKahlerGeometry (main; conventions, K5a, K6.0; the open revisions #1234 and #1398 keep the K-numbering), ComplexManifolds, PDE Lanes B–E and stretch goals, Yamabe (carriers, Y1), RiemannianGeometry and DifferentialGeometry headers, RicciFlow Layer 2 headers, VariationalMethods scope.
- **Pinned libraries.** Mathlib has eigenvalues of Hermitian matrices and symmetric operators (`Mathlib/Analysis/Matrix/Spectrum.lean`, `Mathlib/Analysis/InnerProductSpace/Spectrum.lean`) and Hölder maps, but no spectral-function calculus and no fully nonlinear elliptic theory. Tau Ceti has Euclidean Sobolev spaces, Hölder spaces, Harnack, maximum principles and regularity modules under `TauCeti/Analysis/PDE`, and the symplectic `SmoothTwoForm.Compatible` convention; it has no Kähler geometry file (the "Kaehler" hits are Kähler differentials in function-field theory) and no Monge–Ampère or Hessian equation. The library does not own the target.

## Why `design`

- Not `merge-into`: no open target or design plans any of the same objects.
- Not `duplicate`: no roadmap, pull request, package or library declaration owns the framework or the theorems; the two special cases found are single sections of consumers.
- Not `part-ii`: the roadmap does not continue an existing roadmap in its own direction. ComplexKahlerGeometry is a supplier (type calculus, Hodge theory, elliptic regularity), not a base: the target adds a nonlinear theory with its own objects, not more Kähler Hodge theory. Yamabe is a pattern, not a base.

## Generality

The filed wording already asks for the general framework. Two places were widened, as the sources support:

- Uniqueness (filed for the Kähler Monge–Ampère equation) is stated for every admissible pair on a compact Hermitian manifold, including uniqueness of the constant, by the comparison principle (`tosatti-weinkove2010` line 38–47 gives the Hermitian Monge–Ampère case). The filed case is a Check.
- The fixed-background `L^∞` bound is stated on compact Hermitian manifolds (`guo-phong2024` Theorem 1) as (T5), with the Kähler theorem of Guo–Phong–Tong kept as (T4) because its degenerating-background form has no Hermitian analogue and its proof is different. (T5) needs the Caffarelli–Kohn–Nirenberg–Spruck Dirichlet theorem, which is paywalled and far from the library; the brief tells the design to make it the first section of a Part II if the cost is too high, and to say so.

Existence (T3) is stated as Tosatti–Weinkove on Hermitian manifolds with Yau's theorem as the Kähler case, matching the filed (b).

## Sources

Fetched through the sources service into `packages/ComplexHessianEquations/sources.toml`:

- Read (open repository, certified): `gpt2023` (arXiv:2106.02224v1), `guo-phong2024` (arXiv:2204.12549v3), `szekelyhidi2018` (arXiv:1501.02762v3), `tosatti-weinkove2010` (arXiv:0910.1390v2), `dinew-kolodziej2014` (arXiv:1112.3063v1). Every final target has its locator in one of these.
- Paywalled, cited by locator (`uncertified`): `yau1978` (Wiley, DOI 10.1002/cpa.3160310304), `szekelyhidi2014` (AMS GSM 152), `gilbarg-trudinger2001` (Springer), `ckns1985` (Wiley, DOI 10.1002/cpa.3160380206). The target form itself says Yau and Székelyhidi's book are to be cited by locator. The service recorded Gilbarg–Trudinger as uncertified by itself; for the two Wiley papers and the AMS book it reported "no legal source found" instead (Wiley answered HTTP 403, the AMS page is in no licence class, the author's copy of the notes at Notre Dame answered HTTP 403), so I added those three entries by hand with their DOIs and removed them from `needs-references.toml`, since a paywalled publication cited by locator is settled by the sources rules.
- Read for the design beyond the filed list (open repository, certified): `pss2012` (arXiv:1209.2203v2; Yau's theorem restated as Theorem 1 at line 170, continuity method §2.2, Yau's estimates §3.1) and `twwy2015` (arXiv:1402.0554v2; Theorem 1.1 at line 124–127).
- Blocked, in `needs-references.toml`: `cns1985` and `kolodziej1998`. Both are open content on Project Euclid, but the service's requests for the PDFs were answered by an Incapsula block page, which the service stored as the text. I corrected the two manifest entries to `uncertified` with a note (the stored text is an error page, not the paper) and listed them for a human. No final target depends on reading them: the cone and admissibility definitions are in `guo-phong2024` and `szekelyhidi2018`, and Kołodziej's bound is cited only as what (T4) recovers. A waiver is acceptable for both.
- `spruck2005` (certified, institutional): the Clay Mathematics Institute offers the whole proceedings volume under "Downloads" on its own resource page for the book, so I fetched it with `--licence-class institutional`. The first attempt was stopped by the ten-minute background limit of my shell, not by the service; the second completed. The PDF's text layer is glyph names, so the service recognised the scan by OCR; Spruck's lectures start at line 10956 and the cone and Gårding material is at line 11178–11227 and 11542.
- `ckns1985` was added for the Dirichlet-problem input of (T5); it is paywalled and recorded as above.

Nothing in any fetched text asked for a command, a credential or a change of procedure; nothing suspicious to report.

## What remains for the design

The main risks are in `target.md`: the complex Evans–Krylov estimate has no supplier anywhere in the library or the roadmaps; the spectral-function calculus (a symmetric `C^k` function of eigenvalues is `C^k` in the matrix) is not in Mathlib; the Chern torsion and Hermitian integration-by-parts identities must be built on CKG K4; and the whole is roadmap-sized, so the design should land the framework, the examples, uniqueness and the Kähler existence theorem before the Hermitian extension and the `L^∞` theory.

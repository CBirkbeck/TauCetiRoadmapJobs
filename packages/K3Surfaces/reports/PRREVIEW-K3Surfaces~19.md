# Review of K3Surfaces (pull request #1285 at a23ff3a)
**Verdict:** needs changes

## R01 (P3) — The description reverses the Enriques supply direction

**Location:** PR description, `scratch/pull-request.md:26`: “Early K0.A and K1–K2 precede Enriques E1; its numerical lattice then feeds K7.C, followed by the Enriques E6.U application.” Also `:22`, “canonical-cover descent”.
**Claim:** The description presents EnriquesSurfaces as a supplier and assigns its canonical-cover descent to this roadmap. The head explicitly has no Enriques supplier, constructs the integral model independently in K7.A, and calls the period-locus section §7.3.
**Witness:** `TauCetiRoadmap/K3Surfaces/README.md:49` assigns canonical-cover comparison and descent to EnriquesSurfaces and excludes Enriques inputs; `:1175` repeats that exclusion. EnriquesSurfaces #1286, `TauCetiRoadmap/EnriquesSurfaces/README.md:11`, confirms ownership of the adapter and descent.
**Repair:** Replace the Enriques-dependency paragraph with: “K3Surfaces supplies EnriquesSurfaces E1 and E6.U0–U4. Its independent integral model K7.A, geometric involutions K7.B and free/nodal period criteria §7.3 consume no Enriques result. EnriquesSurfaces owns the canonical-cover comparison and automorphism lift/descent.” In the programme paragraph, replace “canonical-cover descent” with “free quotients and their period loci”.

## R02 (P3) — The formal-effectivity supplier claim is stale

**Location:** PR description, `scratch/pull-request.md:24`: “The polarized formal-effectivity dependency is [SchemeAndStackFoundations #1276]”.
**Claim:** This describes an effectivity contract that the head does not consume. The head names qualified algebraic comparisons from AlgebraicModuliForArithmeticGeometry; SchemeAndStackFoundations on main explicitly excludes polarized adic-system algebraization from §4.10.
**Witness:** `TauCetiRoadmap/K3Surfaces/README.md:182` names AlgebraicModuliForArithmeticGeometry §7.8 with its algebraicity/effectivity hypotheses; `:631` repeats that supplier. `TauCetiRoadmap/SchemeAndStackFoundations/README.md:6789` excludes polarized adic-system algebraization.
**Repair:** Replace the sentence with: “Algebraic deformation and Picard comparisons use AlgebraicModuliForArithmeticGeometry §§1.1–1.3, 7.3, 7.8 and 8.1–8.3 under their stated hypotheses, with SchemeAndStackFoundations Layer 4. The analytic Kuranishi families are constructed in K3Surfaces §3.1.” Remove the obsolete #1276 dependency link.

## R03 (P3) — The description gives the wrong acceptance-test count

**Location:** PR description, `scratch/pull-request.md:28`: “Suggested.lean is illustrative; its ten prospective proof targets remain admitted.”
**Claim:** The head contains five admitted headline theorems and one definition. Its module docstring identifies the file as headline acceptance statements and lists the remaining geometric headlines whose carriers are unavailable.
**Witness:** `TauCetiRoadmap/K3Surfaces/Suggested.lean:51` defines `IsAlgebraicK3`; theorem declarations occur at lines 61, 72, 82, 102 and 122. `TauCetiRoadmap/K3Surfaces/README.md:216` lists exactly these five acceptance statements.
**Repair:** Replace the sentence with: “This PR adds the new K3Surfaces roadmap in three files. Suggested.lean states five admitted headline theorems using one supporting definition; its docstring names the geometric headlines that cannot yet be stated on the pinned carriers.”

## Previous findings

The previous report accepted this same head with no outstanding findings. Its three tracked repairs remain present:

- R01 — repaired: `TauCetiRoadmap/K3Surfaces/Suggested.lean:122` states discriminant surjectivity for every even nondegenerate lattice integrally isometric to U(2)⊕E₈(−2).
- R02 — repaired: `TauCetiRoadmap/K3Surfaces/README.md:884` and `Suggested.lean:100` cite Huybrechts Lemma 14.2.5 and Proposition 14.2.6, pp.291–292, for extension.
- R03 — repaired: `TauCetiRoadmap/K3Surfaces/Suggested.lean:46` and `:90` retain the README's Layer 0 and Layer 7 titles.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| `gluing_isometry_extension_iff`, cited in `roadmap-summary` | S=⟨4⟩, T=⟨−4⟩, γ=id; matching signs | At a=1 mod 4: (1,1) gives 1=1; (−1,−1) gives 3=3. Both preserve the graph; index 4, determinant −16/16=−1. | Both extend uniquely; no mathematical change |
| Same criterion, converse | Same lattices; opposite signs | At a=1: (−1,1) gives 3≠1; (1,−1) gives 1≠3. Neither preserves the graph. | Neither extends; no mathematical change |
| K7.A's independent model, relevant to R01 | Swapped U and E₈(−1) blocks | Invariant rank 2+8=10; anti-invariant rank 2+2+8=12; discriminants 1024 each; glued discriminant 1024²/1024²=1. | Integral model uses no Enriques numerical lattice; correct description |
| §3.1 local deformation dimensions, relevant to R02 | Quartic, double sextic, zero class | h²=4 and h²=2 each impose one equation: 20−1=19; h=0 imposes zero: 20−0=20. | Qualified polarized slice; correct supplier description |
| Acceptance-statement count, R03 | All declarations at this head | 1 definition + 5 theorems = 6 declarations; 5 sorry bodies, versus the description's 10 proof targets. | Description must say five |

The other adversarial rows stand as in the previous review of `a23ff3a`; no mathematical statement changed.

- Scope: 0 changed folder lines; 3 newly added files against the PR base, 1374 insertions; 0 changes outside the folder; checkout clean.
- Source check: 2 locators reopened, huybrechts-k3 Lemma 14.2.5 and Proposition 14.2.6, pp.291–292, lines 11176–11196; no changed seeded-sample passage.
- Pinned library: `TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Graph.lean:94` and `:123` opened for the gluing constructor and membership criterion.
- Supplier text: EnriquesSurfaces E1/E6.U, SchemeAndStackFoundations §4.10, AlgebraicModuliForArithmeticGeometry §7.8 and SmoothBundlesConnections B1.5 resolved against main or the provided open heads.
- Gate: worker gate passes including `build=0`; fresh scanner/dependency gate reports every check zero and `OK`.
- Dependency output: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Lean: direct elaboration and all 6 scratch `#check @` signatures pass, with exactly 5 sorry warnings; no lost binders or changed signatures.
- Targeted build: `lake build TauCetiRoadmap.K3Surfaces.Suggested` exits 0; five sorry warnings and the package's module-system advisory.

Overlap check: read K3SurfacesAndSymplecticBoundedness (arbitrary-field/characteristic-two extension), EnriquesSurfaces (canonical-cover comparison and descent), EnriquesSurfacesAndIntegralNonexistence (arithmetic Enriques extension), AlgebraicModuliForArithmeticGeometryPartII (general numerical Picard and contraction theory), and IntegralLattices (native lattice/discriminant/gluing constructions); K3Surfaces owns the K3 geometry and specified extension criterion. No changed ownership claim in the folder.

Source independence: changed passages only; 0 changed roadmap passages and 0 changed-source wording comparisons. No layer was added, removed or reordered since the previous review, so the arrangement comparison was not reopened.

## Not verifiable

- Rudakov–Shafarevich 1983 and Nikulin 1983, Theorem 3.6.3: previously settled as uncertified; no new source access requested.
- The existing `enriques-ruledness` contract still has no readable design registration in the supplied package; unchanged from the previous review.

## Source issues

- none

## For the human reviewers

- none

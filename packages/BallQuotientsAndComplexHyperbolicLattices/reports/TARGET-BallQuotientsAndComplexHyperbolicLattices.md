# Triage report: TARGET-BallQuotientsAndComplexHyperbolicLattices

Verdict: **design**, name `BallQuotientsAndComplexHyperbolicLattices`, no base, no owner. The brief
is `packages/BallQuotientsAndComplexHyperbolicLattices/target.md`; the manifest is
`packages/BallQuotientsAndComplexHyperbolicLattices/sources.toml`.

## Consolidation against the open board

I compared the target with every open target and design by object. None plans the same theory:

- `TARGET-RealReductiveGroupsStructure` (#6016) plans Iwasawa and Cartan data of real reductive
  groups; PU(1,n) is an example there, but the ball, lattices and quotients are not its objects.
  Shared area only.
- `TARGET-LorentzianGeometry` (#6011) has signature-(1,n) real forms, not the Hermitian form, and
  no group actions or quotients.
- `TARGET-SurfaceGroupCharacterVarieties` (#6024) has mapping class groups and representation
  varieties of surface groups; no overlap with lattices in PU(1,n).
- `TARGET-RiemannianManifoldsWithConvexBoundary`, `TARGET-Varifolds`, `TARGET-QuasiregularMaps`
  and the rest share nothing beyond Riemannian language.
- `DESIGN-RationalAnalyticPrismatization` is p-adic and unrelated.

No `merge-into`.

## Ownership search

Searched with `roadmaps grep` (open pull requests and main) for: ball quotient; PU(1,n), SU(1,n)
and their transposes; complex hyperbolic, complex ball; Baily–Borel; Selberg's lemma and torsion-free
finite-index subgroups; non-arithmetic; Deligne–Mostow; totally geodesic; Borel extension;
Cartan quotients of analytic spaces; big Picard; Hörmander and L² estimates; Riemann existence;
Garland–Raghunathan and Margulis arithmeticity; Hermitian symmetric domains; Bergman. Read the
READMEs of ShimuraVarieties (#933), ArithmeticLocallySymmetricSpaces (#871), ShimuraData (#1038),
ShimuraCompactifications (#1053), KleinianGroups (#432), ComplexKahlerGeometry, RiemannianGeometry
and FuchsianOrbifolds (main). Checked the board package index (five imported packages, none
related), the merge order, and the pinned Mathlib and Tau Ceti.

Findings:

- **PU(1,n), the complex ball and its lattices appear nowhere.** No roadmap names the group, the
  ball, non-arithmetic lattices, Deligne–Mostow or Mostow. The only "ball quotient" mentions are
  remarks in ShimuraVarieties (README lines 655 and 660, rank-one cusps of higher codimension) and a
  Picard modular surface example in PELModuli (line 3750).
- **ShimuraVarieties (#933)** owns, for arithmetic (congruence) groups acting on Hermitian domains:
  the proper effective action (§0.4), finite analytic quotients after Cartan (P.6), the analytic and
  algebraic Baily–Borel compactification (§§2.5–2.7), Borel's extension theorem (§3.1), Borel
  algebraicity (§3.2), unique algebraization (§3.3) and quasi-projective finite quotients (§3.4a).
  These cover the arithmetic case of the target's algebraicity and uniqueness theorems and must be
  imported, not re-planned. They do not cover non-arithmetic lattices, which exist in PU(1,2) and
  PU(1,3) and are the point of the target.
- **ArithmeticLocallySymmetricSpaces (#871)** ALS.0.4–0.5 supplies the symmetric space G/K and the
  proper action of G modulo its split centre, with the discrete-subgroup consequence.
- **RiemannianGeometry (main)** R4 builds the real hyperbolic models (including the ball model with
  metric 4|dx|²/(1−|x|²)²), the quotient atlas for a free properly discontinuous group of isometries
  and Killing–Hopf; R5a builds the second fundamental form, so "totally geodesic" is available.
  Nothing complex hyperbolic.
- **ComplexKahlerGeometry (main)** K1–K8 supplies ∂∂̄ calculus, analytic subvarieties, Kähler
  identities and projective examples; the Fubini–Study form is its only ∂∂̄ log example.
- **FuchsianOrbifolds (main)** and Tau Ceti's `Analysis/Complex/Fuchsian/` own the n = 1 case
  (proper action, coarse quotient, cusps, compactified quotient curves).
- **KleinianGroups (#432)** is PSL₂(ℂ) on real hyperbolic 3-space: discreteness implies proper
  discontinuity, Dirichlet domains, Bianchi covolumes. A model, not an owner.
- **Mathlib** has unitary and special unitary matrix groups, sesquilinear forms, the unit disc and
  upper half-plane, `ProperlyDiscontinuousSMul` (with the SL₂(ℤ) instance), the one-variable
  Schwarz lemma; no indefinite unitary group, no ball of dimension n > 1 with its automorphisms, no
  Selberg lemma, no residual finiteness of linear groups.
- **Tau Ceti** has fundamental domains for properly discontinuous actions, Fuchsian machinery, and
  manifold gluing; nothing on PU(1,n).

So the target is neither a duplicate nor owned. It is not a Part II: ShimuraVarieties is an open
pull request about Shimura data over ℚ and canonical models and goes in a different direction
(arithmetic, adelic levels, reflex fields); KleinianGroups and FuchsianOrbifolds are the real
hyperbolic 3-dimensional and the n = 1 cases, and the target generalises in the complex direction.
The verdict is `design`. The suggested name fits and clashes with no roadmap, pull request or
package (the board folder of that name was empty before this job).

## Generality

The target is already stated at the right generality: all n ≥ 1, all lattices (arithmetic or not,
torsion or not, cocompact or not). I kept it, made the arithmetic case an import from
ShimuraVarieties through a bridge section, made n = 1 an import from FuchsianOrbifolds, and made
the existence of non-arithmetic lattices (Mostow, Deligne–Mostow) a Check rather than a
construction. The "G is the full biholomorphism group" and "uniqueness of the invariant Kähler
form" statements are stated as theorems with their standard proofs indicated.

## Sources

Fetched through the sources service: Baldi–Ullmo (arXiv v4), Deng (arXiv v5), Deligne–Mostow
(Numdam), Mostow 1980 (MSP open back issue), Mok 2012 (HKU author-page preprint IMR2009-4),
Milne's Shimura variety notes (author page) and Witte Morris, Introduction to Arithmetic Groups
(arXiv), all certified. I read every locator cited in the brief in these texts.

Two open texts could not be read: Project Euclid served a bot-protection page for Borel 1972, and
e-periodica served a verification page for Alperin 1987. The service had recorded both as
certified with the blocked page's hash; I corrected both manifest entries to `uncertified` with
their DOIs, locators and a note, since the statements are available elsewhere (Milne Theorem 3.14
and Lemma 3.15; Witte Morris Theorem 4.8.2 with full proof). Baily–Borel, Siu–Yau, Cartan 1957,
Goldman and Raghunathan are paywalled and recorded as `uncertified` with DOI and locator, as the
issue form itself asks. I also fixed a mojibake venue string on the Deng entry and completed the
Mostow, Mok and Raghunathan entries the service left without authors or title.

`needs-references.toml` in the job scratch is therefore empty of requests: nothing blocks the
design on an unread text.

## Suspicious content

None. No fetched text or roadmap contained instructions.

## Risks worth a human's eye

The algebraicity theorem for non-arithmetic lattices with n ≥ 2 (Siu–Yau, Mok) and the uniqueness
through Deng's big Picard theorem are far above the library (toroidal compactification of
non-arithmetic ball quotients, L² ∂̄-estimates, complex variations of Hodge structure). The issue
form says this case "may be cited"; the planning principles forbid bypassed theory. The design
should decide this first, and a human may want to waive or confirm it before the design starts.

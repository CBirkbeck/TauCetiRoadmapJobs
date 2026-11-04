# Triage report: TARGET-GaloisActionOnEtaleCohomology

Verdict: **design** (new roadmap `GaloisActionOnEtaleCohomology`), brief in
`packages/GaloisActionOnEtaleCohomology/target.md`, manifest in
`packages/GaloisActionOnEtaleCohomology/sources.toml` (11 entries, none missing, no
`needs-references.toml`).

This is the third run of the job; the two earlier runs reached the same verdict but their
deliverables were lost when the board checkout changed branch. Every claim below was re-read in
this run from the roadmap files and the cached source extractions.

## 0. Consolidation against the open board

Every open target and design listed in the brief was compared by mathematical object. None
concerns étale cohomology of adic spaces or schemes over a field, Galois representations, or
continuous cohomology; the closest are `DESIGN-RationalAnalyticPrismatization` (rational
prismatisation of rigid spaces, a different theory that would at most consume this one) and
the modularity targets `EllipticCurveModularityCMFields` / `EllipticCurveModularityTotallyReal`
(consumers of Galois representations, not constructors). No merge.

## 1. Is it planned already?

Searched: the roadmap repository on main, the 451 open roadmap pull requests (through
`roadmaps grep`), the board packages index, the pinned Mathlib and Tau Ceti.

**Scheme side (already owned, imported here).**
- `EtaleCohomologyFoundations` §F.4.6 (main) constructs the continuous `G_k` action on geometric
  ordinary and compactly supported cohomology of `X/k` for coefficient descent data in the
  normalised adic-system category, with restriction, conjugacy under change of separable
  closure, twist and tensor coherence; §F.10.2 and §F.10.2b are the finite-field Frobenius
  bridge; §F.0.3 the finite Tate twists; §F.4.0 the `ContinuousRep` carrier.
- `EllAdicRealization` (#196, Layer 8) plans the same scheme-side action independently (older
  pull request, overlapping with §F.4.6); it is not a reason to re-plan here.
- Stacks Tags 03QW (Galois action on stalks), 03Q9 (stalks of higher direct images), 03QQ
  (cohomology of a point) supply the elementary scheme statements.
So for schemes over a field the target's "same construction" is reduced to one target: the
explicit formula and its agreement with §F.4.6 and the Stacks statements.

**Rigid side (not owned anywhere).**
- `ClassicalAdicEtaleCohomology` (#875, ORDER 53) owns the equivalence of sheaves on
  `Spa(K, 𝒪_K)_et` with discrete Galois modules (README line 134 and 202, §1.1; §1.3 at
  line 389), `μ_n` and twists (§1.4, lines 527–555), the stalk formula of `R^n f_*` along strict
  localisations and the continuity along them (§1.5, lines 642 and 656), the proper algebraic
  comparison (§8.2) and the smooth proper trace. Its §9.7 (line 5155) asserts a
  "`G_K`-equivariant" trace and explains that "the field-point stalk comparison transports the
  continuous Galois action; equivariance is part of the sheaf morphism on `Spa(K, 𝒪_K)`". The
  action on `H^i(X_C, ℱ)` itself, its functoriality, discreteness, continuity of the adic
  version and twisting rules are never constructed or stated there.
- `ClassicalAdicEtaleCohomologyPartII` (#1549, ORDER 209) §§5.3–5.9 state Galois-equivariant
  mod-`p`, `ℤ_p` and `ℚ_p` Poincaré duality (Zavyalov) and §7.5 field-extension invariance,
  again with the action implicit.
- `AInfCohomology` (#1044, ORDER 54) line 2087 asserts a `G_K`-equivariant de Rham comparison
  with `H^i_ét(X_C, ℤ_p)` finitely generated; its §AI.3 (line 2555) takes Scholze's
  finite-dimensionality as supplied, not proved.
- `PadicPeriodRings` (#940, ORDER 18) §1.1 constructs the continuous extension of Galois
  automorphisms to `ℂ_p` for `K/ℚ_p` finite (Mathlib `PadicComplex`).
- `PadicDifferentialEquationsAndRigidCohomology` (#1002, ORDER 108) §RD.0.33 proves that the
  completion of an algebraically closed non-archimedean field is algebraically closed in every
  characteristic.
- `ProfiniteCohomology` (main) Layers 0–1, 4, 10 own discrete modules, `TopRep` and continuous
  cohomology.
- Cross-PR grep for the construction (`σ_X`, `c_σ`, `Spa(σ)`, `id_X × Spa`) finds nothing; the
  phrase "discrete `G_K`-module" occurs nowhere; `H^i(X_C, …)` with an implicit Galois action
  occurs in AInfCohomology, ClassicalAdicEtaleCohomology and its Part II, BunGAndNewtonStrata,
  PerfectoidTowers, MotivesAndAlgebraicCycles and PrismaticCohomologyPartIII, all as users.
- `DiamondEtaleCohomology` (#922) names no Galois action (its only Galois-flavoured line is an
  Artin–Schreier example); `WeightsInEtaleCohomology` (#1001) §1.7 and line 841 ask for
  "rational adic cohomology with its continuous Galois action, Frobenius and specialization
  maps" and note that Mathlib's pro-étale groups do not supply it.

**Libraries.** Mathlib has `Scheme.EllAdicCohomology` (pro-étale `ℤ_ℓ`-cohomology of a scheme,
`Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean`, no Galois action), the étale and
pro-étale sites of schemes, `PadicComplex` with `isAlgClosed` but no Galois action on it, and
`continuousCohomology` on `Action (TopModuleCat R) G`. Tau Ceti has `PreAdicSpace`, `Spa`
and Fargues–Fontaine files but no étale site of adic spaces and no étale cohomology of them;
its Galois-action files concern elliptic-curve isogenies and the Weil pairing only.

Conclusion: not a duplicate. The construction, its properties and the dictionary with sheaves
on the base are planned nowhere; three roadmaps already rely on them implicitly.

## 2. New roadmap or Part II?

Not a Part II. The natural bases would be `ClassicalAdicEtaleCohomology` (whose Part II is
already taken by almost duality and constructible base change and sits at ORDER 209, after
most consumers) or `EtaleCohomologyFoundations` (which owns the scheme side). The target is a
thin, cross-cutting layer consumed by `PadicHodgeTheory` (110) onward, so it is best a roadmap
of its own placed right after its last supplier.

## 3. Generality

The filed wording is general on the rigid side and is kept: `K` any complete non-archimedean
field of any characteristic, `X` any rigid `K`-space, `ℱ` any abelian sheaf for the action, with
quasi-compact quasi-separated `X` and torsion `ℱ` only where the limit theorems need them. The
scheme side is widened from `K` to an arbitrary field `k`. Special cases (`K/ℚ_p` finite,
`X` smooth proper, `ℓ ≠ p`) are Checks. Finiteness for `ℓ ≠ p` is imported, for `ℓ = p` cited
(Scholze), as the target itself proposes.

## 4. Name

`GaloisActionOnEtaleCohomology`, as suggested; no roadmap, pull request or package uses it
(checked on main, in `roadmaps list`, in `packages/` and in the merge order).

## 5. Suppliers, consumers, position

Suppliers and consumers are listed in `target.md`. Position: after
`PadicDifferentialEquationsAndRigidCohomology` (ORDER 108) and before `PadicHodgeTheory` (110),
so that `PadicHodgeTheory` §2.7, `WeightsInEtaleCohomology` (134), `CohomologyComparisons`
(165), `CstConjectureForDaggerVarieties` (166), `ClassicalAdicEtaleCohomologyPartII` (209) and
`GaloisSectionsPadicPeriodMaps` (331) can consume it. `ArithmeticGaloisRepresentations` (42)
and `DiamondEtaleCohomology` (75) are earlier and cannot, contrary to the target's hope; this
is noted in the brief.

## 6. Sources

Fetched through the sources service into `packages/GaloisActionOnEtaleCohomology/sources.toml`:
- certified (open): scholze2013 (arXiv), zavyalov2025 (arXiv v3; Annals metadata recorded,
  pagination unchecked), hansenzavyalov2023 (arXiv), berkovich1993 (Numdam), milneLEC (author
  page), stacks03N1 (Stacks), dejongvanderput1996 (EMS Press open archive, OCR extraction);
- uncertified (paywalled, cited by locator): huber1996, huber1994, sga4half, serreGC1997.

Locators I read myself in this run: dejongvanderput1996 §3.6 (line 1476–1492, page 36: the
action `ρ(σ)` via the general morphism `σ_X` and the identification `G = Aut_cont(K̂^sep/k)`),
Theorem 3.7.3 (line 1571–1587, page 38: `(R^q f_* S)_e ≅ H^q(Y_e, α^* S)` as continuous Galois
modules) and Corollary 3.7.5 (line 1594–1599, Hochschild–Serre); zavyalov2025 Theorem 1.1.4
(line 125) and page 78 (line 3798–3806: the dictionary via Huber Proposition 2.3.10, Remark
5.4.1, Theorem 5.4.2); scholze2013 Theorem 5.1 (line 1279–1284, page 28); berkovich1993
Theorem 7.1.1 (line 4584, page 125) and Corollary 7.5.4 (line 5339, page 147); stacks03N1
Theorem 53.1 / Tag 03Q9 (line 3733), Section 56 / Tag 03QW (line 3963), Section 59 / Tag 03QQ
(line 4216); hansenzavyalov2023 Theorems 3.3.1–3.3.2 (line 1684–1709, page 39, which also
attest Huber Corollary 2.8.3); milneLEC table of contents (line 49–58). The Milne extraction
contains non-text bytes and is only searchable with binary-tolerant tools.

Milne's Étale Cohomology (Princeton 1980) was tried in the first run (publisher page and DOI
landing page only) and is dropped: nothing needs it beyond milneLEC and stacks03N1, so it is
not listed in `needs-references.toml`. The Annals article the target cites is Zavyalov's; its
"theorem.4" is Theorem 1.1.4 (Theorem 5.4.4 in the body of the arXiv version).

## 7. Suspicious text

None. No fetched text or roadmap file contained instructions.

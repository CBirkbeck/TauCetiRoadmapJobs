# GATE-SchemeAndStackFoundations~6: answers to the review of `6da2b17` (head `a761be1`)

The repairs are in commit `a5411fa4`, on top of `a761be1` and not pushed. Numbering: the review's F01 makes
three points (pin lag, restated carriers, total-space aliases), which are H01–H03; F02–F05 are H04–H07. Line
numbers are those of `a5411fa4`.

## H01 (CBirkbeck) — applied

At `a761be1` (the merge of `origin/main`), `lake-manifest.json` pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`, the
pins named at `README.md:428` and `:469`. All 15 Tau Ceti files of the review's table exist at that pin, and
`Suggested.lean` now imports twelve of them (`:1–23`).

## H02 (CBirkbeck) — applied differently

Eighteen of the 20 restated carriers are deleted, and their theorems are stated on the Tau Ceti carriers. The other
two are kept as `abbrev`s whose bodies are the Tau Ceti carriers:

- `PseudoCoherence.IsPseudoCoherentModule A M := TauCeti.Huber.IsPseudoCoherentOver A M ⊤` (`Suggested.lean:81`);
- `Proetale.IsReplete T := TauCeti.IsReplete T` (`:510`).

They are kept because two roadmaps on main import them: `TauCetiRoadmap/AdicEtaleGeometry/Suggested.lean:72` and
`TauCetiRoadmap/EnhancedDerivedSheaves/Suggested.lean:31`. Deleting them made the brief's build fail in those two
files ("Unknown constant `…Proetale.IsReplete`", "`…PseudoCoherence.IsPseudoCoherentModule`").

The changed statements:

- `isPseudoCoherentSheaf_iff_affineOpens` (`:89`) is now on `F.IsPseudoCoherent` and `IsPseudoCoherentOver Γ(X,U) Γ(F,U) ⊤`.
- `Ring.IsJapanese.of_complete_local`, `Ring.IsNagata.of_complete_local` and `IsQuasiExcellentRing.isNagata` now
  conclude `TauCeti.Ring.IsJapanese` / `TauCeti.Ring.IsNagata`.
- `Excellence.IsJ2` and `IsQuasiExcellentRing` (`:141`) are now on `TauCeti.Excellence.regularLocus` and `IsGRing`.
- Layer 1 uses `TauCeti.AlgebraicGeometry.SchemePresheaf`, `Spaces.IsAlgebraicSpace` and `Spaces.EtaleAtlas a`
  (`:229`).
- `FormallySmooth`/`FormallyEtale`, `AdicThickeningSystem` and `SNCData.IsTransverse` now use Tau Ceti's
  `IsFirstOrderThickening`, `IsThickening` and `IsRegular`.
- `alteration_theorem` and `semistable_alteration_theorem` (`:1036`, `:1093`) now quantify over an instance
  `X̄₁.Over (Spec R)` and assert `X̄₁.IsProjectiveOver R`. `hodge_index` takes `[S.IsProjectiveOver k]` (`:1176`).
- `Chow.CH_coprod` (`:1144`) is now on `TauCeti…Chow.cyclesOfDimension`/`RatEquiv`. These need
  `[IsLocallyNoetherian X]`, so the hypothesis "locally of finite type over κ" became "locally Noetherian". The
  instance `Chow.isLocallyNoetherian_sigma` (`:1135`, a real proof through Mathlib's
  `isLocallyNoetherian_iff_openCover` and `sigmaOpenCover`) replaces `coprodOver` and
  `coprod_locallyOfFiniteType`.

The README follows in §§0.5, 0.20, 0.21, 1.3, 1.4, 2.17, 4.1, 4.13, 4.19, 4.20, 5.1 and 5.10 (e.g. `:794`, `:1468`,
`:1556`, `:2192`, `:4063`, `:5302`, `:6706`, `:6903`). §4.7 (`:5611`) now says why `AdicRing` is not Tau Ceti's
`TauCeti.IsAdicRing`: that is an unbundled property of a topological ring, with no ideal fixed.

## H03 (CBirkbeck) — applied

`README.md:6952` "(AlgebraicVectorBundles L2B; *Chow.totalSpace*, *Chow.HasRank*)" now reads "(Tau Ceti's
`TauCeti.AlgebraicGeometry.totalSpaceScheme X` applied to an object of `FiniteLocallyFreeSheaf.FixedRank X r`)"
(`:7007`). §5.5's "*Chow.totalSpace* and *Chow.HasRank* carriers" is now "Tau Ceti's `totalSpaceScheme` on
`FiniteLocallyFreeSheaf.FixedRank X r`" (`:7134`).

The AlgebraicVectorBundles contract now cites `totalSpaceScheme`, `totalSpaceHomEquiv` and
`totalSpaceSchemeBaseChangeIso` at `VectorBundle/TotalSpace.lean:99`, `:130`, `:229` (`:523`). The §5.4 Checks and
the §§5.4–5.5 *Needs* lines changed with it. The convention agrees with Fulton's: `𝕍(E) = Spec_X(Sym E^∨)`, with
sections `E`.

## H04 (CBirkbeck) — applied

`README.md:2344` now defines `EtaleLocal` for any `P`. It says the comparison API needs `P` étale local on
source-and-target (Stacks, Definition 35.32.3 (04QZ)), and that Mathlib's `IsLocalAtSource` plus `IsLocalAtTarget`
does not give this (Example 35.32.2 (04QY)). Lemma 35.32.6 (04R2) does give it once stability under postcomposition
with open immersions is added.

*iff_forall_square*, *ofScheme_iff* and *comp* are now stated under those three conditions. The 04QY square is a
negative-control Check (`:2377`), and the `EtaleLocal`/`baseChange` docstrings say the same (`Suggested.lean:264`,
`:273`). `EtaleLocal.baseChange` is unchanged: its route uses only `IsStableUnderBaseChange` (`README.md:2328`). I
checked the source at Stacks book text lines 144493 (04QY), 144538 (04QZ), 144637 (04R2), 258196 (03MJ) and 258265
(04RD); Mathlib's two classes are at `CategoryTheory/MorphismProperty/Local.lean:51`, `:154`.

## H05 (CBirkbeck) — applied differently

The finding is right: on main, JacobianChallenge cites §§0.9, 1.1, 2.2, 2.11, 4.9, 4.12 and 4.14 as suppliers, and
this README cites JacobianChallenge A–F.

The proposed repair (a)–(c) would still leave a cycle, through StableReduction on main:

- StableReduction consumes JacobianChallenge A–E (`TauCetiRoadmap/StableReduction/README.md:290–314`, contracts
  J-A1 … J-E).
- This README consumes StableReduction Layers 0–4 (`README.md:531`).
- So SchemeAndStackFoundations → JacobianChallenge → StableReduction → SchemeAndStackFoundations survives even
  when every edge to JacobianChallenge is removed.

**Applied: part (a).** Every JacobianChallenge A–B and flat-base-change use that the pinned Tau Ceti covers now
cites Tau Ceti:

- the contract (`:536`) and the coherent-sheaf convention (`:605`);
- §§0.4, 2.2, 2.6 (whose route is Stacks 01XJ via the induction principle 08DR, which uses no flat base change,
  `:3552`), 2.18, 2.20, 3.1, 3.2, 3.3 and 5.7;
- the Dependencies of Layers 0, 2, 3 and 5;
- the declarations used: `FinitelyPresentedSheaf`, `homologyCechComplexIsoCohomology`,
  `bijective_cohomologyBaseChange`, `eulerCharBelow_eq_relativeDegree_add_one_sub_genus`,
  `nonempty_cohomologyOneDualEquivCohomologyZero_tensor_dual` and `relativePicardFppfSheaf`.

**Not applied: (b) and (c).**

- (b) would put a second owner of 02O5–02O6 next to JacobianChallenge Layer C on main without restoring a single
  direction.
- (c) has no destination at any readable head. JacobianChallenge's revision #1892 assigns `picardComponent` to
  §3.6. SchemeAndStackFoundationsPartII is about flat cohomology. §§3.6–3.8 are cited by about ten roadmaps
  (NeronModels…, FaltingsFiniteness…, AnabelianGeometry…, JacobianChallengePartII, …).

What remains to JacobianChallenge is Layer C (02O5–02O6, symmetric powers) and Layers D–F (§§3.6–3.8). The repair
the cycle needs is a split into Parts: this roadmap's foundations, consumed by JacobianChallenge and
StableReduction, separated from its curve, Picard and alteration strands, which consume them. That needs new folders
and revisions of JacobianChallenge and of the roadmaps citing §§3.6–3.8, so it is for the worker or a human.

## H06 (CBirkbeck) — applied

The docstring "Poonen, Theorem 6.5.10 (i)" is now "Poonen, Remark 6.5.11, p. 182" (`Suggested.lean:334`). The same
citation in `README.md:2635` now separates the two: Theorem 6.5.10 (i) is representability by a scheme, for `G`
affine over a locally Noetherian base. Checked at `poonen-2017` lines 7502–7527.

## H07 (CBirkbeck) — applied

`README.md:3648` "the restriction has sections `k`" now reads "the topological restriction has sections
`Γ(Z, i⁻¹O) = O_{𝔸¹,0} = k[t]_{(t)}` and the closed subscheme has `Γ(Z, O_Z) = k`, both nonzero, while
`H⁰_Z = 0`".

## Build, gate and dependency check

- **Build.** `lake build TauCetiRoadmap.SchemeAndStackFoundations.Suggested TauCetiRoadmap.AdicEtaleGeometry.Suggested TauCetiRoadmap.EnhancedDerivedSheaves.Suggested`:
  exit 0, "Build completed successfully (19308 jobs)". The only warnings in this file are 47 "declaration uses
  `sorry`", the same count as before; no errors.
- **Gate summary line.**
  `gate SchemeAndStackFoundations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- **Dependency check** (`gate --depcheck … --movable … --pr 1276`): `depcheck: 233 roadmaps, 2263 edges, 0 problem(s)`.
  It prints no UPWARD, CYCLE or `moved:` line. Its silence on H05 is the false negative the review describes:
  every roadmap involved is on main.
- **Signature pass.** I put `#check @name` for all 100 named declarations in one scratch file and elaborated it
  once, with no errors. I compared every changed declaration with its README statement:
  `isPseudoCoherentSheaf_iff_affineOpens`, the two `of_complete_local`, `IsJ2`, `isNagata`, `EtaleLocal`,
  `EtaleLocal.baseChange`, `artinBootstrap`, `isReplete_proetale`, `FormallySmooth`, `AdicThickeningSystem`, both
  alteration theorems, `isLocallyNoetherian_sigma`, `CH_coprod` and `hodge_index`. Every hypothesis is in the
  elaborated type, and none was dropped.

## Ownership, overlaps, sources

- **Ownership.** No new object is introduced except the instance `Chow.isLocallyNoetherian_sigma`, which has no
  counterpart at either pin: neither has an `IsLocallyNoetherian (∐ X)` instance.
- **Overlapping pull requests.** #1656, #1807, #1808 and #1854 change this folder. None touches the carriers or the
  JacobianChallenge loop, but each conflicts textually; per the merge-order block they rebase onto this pull request.
- **Sources.** No new sources were fetched. Every locator added was read in the cached Stacks book and in
  `poonen-2017`.
- **Untrusted text.** Nothing in the review was suspicious.

## Adversarial pass (changed statements)

| Statement | Instances | Values | Result |
|---|---|---|---|
| `isPseudoCoherentSheaf_iff_affineOpens` | `O^n` on `Spec k`; `j_!O` on `Spec` DVR; `(A/𝔪)~`, `A = k[x₁,…]`; `∅` | T/T; F (not qc)/F; F/F (not f.p.); T/T | pass |
| `IsPseudoCoherentModule` alias | `ℤ/2`, `ℚ` over `ℤ` | `0→ℤ→ℤ→ℤ/2`: T; not f.g.: F, same as the old chain-complex body | pass |
| `of_complete_local` (both) | `k[[t]]`; a field; `k[ε]` | Japanese; `of_field`; Nagata (dim 0) | pass |
| `IsJ2`, `IsQuasiExcellentRing` | `k`; `k[ε]`; `k[x₀,x₁,…]` | J-2; G-ring (Artinian) and J-2; not Noetherian, so F | pass |
| `EtaleLocal` with 04QY's `P` | `X = Y∖{0}`, `Y = Spec ℂ[x_n]/(x_n x_m)` | square `X → X⊔Y`: `P h` T, so `EtaleLocal P f` T; `P f` F (`O_{Y,0}` has infinitely many minimal primes) | new negative Check |
| 04R2's third condition | smooth, flat, étale, lft, lfp | stable under `∘` open immersion: all T; 04QY: `𝟙_X` T, `X ⊂ Y` F | pass |
| `IsReplete` alias | `Type u`; `Sh(Spec ℚ_ét)` | replete; `μ_{ℓ^n}` tower with limit 0: not replete, for both bodies | pass |
| `FormallySmooth` on Tau Ceti's first-order class | `Spec k → Spec k[ε]`; `→ Spec k[x]/(x³)` | `(ε)² = 0`: first order; `(x)² ≠ 0`: not | pass |
| `AdicThickeningSystem` on Tau Ceti's `IsThickening` | `Spec k[t]/(t^{n+1})` | `ker ι_n = (t^{n+1})`, which is `(t)^{n+1}` | pass |
| `IsTransverse` on Tau Ceti's `IsRegular` | `V(xy) ⊂ 𝔸²`; cusp | strata regular, origin codim `2 = 0 + 2`; cusp fails | pass |
| `IsProjectiveOver` against `ℙⁿ` | `M = R^{n+1}`; `M = 0`; `R = ℤ`, `M = ℤ/2` | `ℙⁿ_R`; `Proj R = ∅`; `Spec 𝔽₂`, closed in `ℙ⁰_ℤ` | pass |
| `alteration_theorem` | `X = ℙ¹_k`, `Z` a point, identity | projective, regular, `B = Z` SNC, support equality holds | pass |
| `CH_coprod`, `isLocallyNoetherian_sigma` | `I = ∅`; `∐_ℕ 𝔸¹`, `α = Σ[0_n]`; `∐_ℕ Spec k`, `α = Σ[pt_n]` | T/T; T/T (div `t`); F/F (`RatEquiv = 0` in degree 0) | pass |
| `hodge_index` | `ℙ¹×ℙ¹`, `H = O(1,1)`, `D = O(1,−1)`; `D = O` | `H² = 2`, `D·H = 0`, `D² = −2`, `D·O(1,0) = −1`; `D² = 0`, numerically trivial | pass |
| §2.7 Check | `𝔸¹`, `Z = {0}` | `Γ(Z, i⁻¹O) = k[t]_{(t)}`, `Γ(Z, O_Z) = k`, `H⁰_Z = 0` | corrected |
| §2.6 flat base change Check | `ℙ¹_A`, `O(−2)`, `B` flat; `B = 0` | `B ⊗_A A ≅ B`; `0 = 0` | pass |
| §5.2 total space | rank 0; `O` on `Spec K` | `𝕍(0) = X`; `Spec K[t]`, `CH_0 = ℤ ≅ CH_1(𝔸¹_K)` | pass |

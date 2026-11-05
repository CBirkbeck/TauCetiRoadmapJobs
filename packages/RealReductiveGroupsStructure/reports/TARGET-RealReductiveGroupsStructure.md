# Triage report: TARGET-RealReductiveGroupsStructure

Verdict: **part-ii** of `TauCetiRoadmap/RepresentationTheory/LieGroups`, name `LieGroupsPartII`,
folder `TauCetiRoadmap/LieGroupsPartII`. Brief: `packages/RealReductiveGroupsStructure/target.md`.

## What was searched

**Board (step 0).** Every open target and design listed in the job brief was compared by
mathematical object. None plans Cartan involutions, Iwasawa data, restricted roots, minimal or
standard parabolic subgroups, Langlands decompositions or the real Bruhat decomposition. The
closest are `BallQuotientsAndComplexHyperbolicLattices` (uses `PU(1,n)` and its stabilisers as a
consumer) and the surface/Teichmüller targets (no real-group structure theory). No merge.

The board's package folders were also checked: `packages/LieGroups` holds only review reports and a
manifest for the open pull request #1051; `packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups`
consumes `LieGroups` Layer 9 (KAK, root-exponential Haar) and nonarchimedean standard parabolics
from `SmoothRepresentationsOfLocalGroups`; `packages/ArithmeticLocallySymmetricSpacesPartII`,
`packages/ReductiveGroupsPartIII` and `packages/LieHighestWeightPartII` contain no real-parabolic
theory (the last owns parabolic category `O` over `ℂ`). The four packages under review in
`board-packages-index.txt` (AnalyticNumberTheory, AutomorphicCongruences, LawrenceVenkateshMethod,
LogicAndDefinabilityInNumberTheory) are unrelated. No roadmap, pull request or package is named
`LieGroupsPartII`.

**Main (step 1).** `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md` Layer 9 (lines
448–462) and `Suggested.lean` lines 642–757: `CartanInvolution`, `IsRealReductive`, `IwasawaData`
(with a bare chamber), `IsIwasawaTriple`, `iwasawaDecomposition`, `kakDecomposition`,
`cartan_polar_decomposition`. The restricted root system and `W(𝔞)` are README-only there. The
README's Ordering section names `RealReductiveGroups` (Layer 9) as a natural fracture and says
harmonic analysis is downstream. Nothing on parabolics or the real Bruhat decomposition.
`ReductiveGroups` Layer 7 and 7b (algebraic parabolic `k`-subgroups, `P_𝐇(λ)`, Levi
decompositions, relative root system, Bruhat/BN-pairs over a field) and `ReductiveGroupsPartII`
(nonarchimedean Iwasawa, Cartan and Iwahori–Bruhat decompositions, RG2.4; its own text says "no
parabolic is defined" at the valued level beyond what layer 7 supplies). `RootSystems` on main for
root systems and Weyl groups. No other roadmap on main touches the objects.

**Open pull requests (step 1).** `roadmaps grep` for `minimal parabolic`, `Langlands
decomposition`, `restricted Weyl`, `parabolic subalgebra`, `PwP`, `standard parabolic subgroup`,
and the boundedness description. Findings:

- `AutomorphicFormsOnReductiveGroups` (#1037, draft) §2.3a "Minimal parabolic subgroups and the
  Langlands decomposition" plans `M = Z_K(𝔞)`, `P = MAN`, the diffeomorphism `M × A × N → P`,
  `P = N_G(P)`, `P ∩ θP = MA`, `G = KP`, the single conjugacy class, the rank-one description, and
  the Borel–Tits comparison with a minimal `ℝ`-parabolic, citing Knapp Ch. VI–VII and Borel–Tits
  4.15, 5.9, 5.19, 14.7, 9.3. Its §2.3 then induces from "a parabolic `P = MAN`" of a real
  reductive group without defining general parabolics anywhere; §3 uses `θ`-stable parabolic
  subalgebras of `𝔤_ℂ` (Vogan–Zuckerman), a different object.
- `LieGroups` (#1051, @kim-em) rewrites Layer 9: a global matrix-cover model, the Cartan
  decomposition through it, the Iwasawa theorem for an arbitrary admissible complement `N` with a
  separately constructed root-generated `N₊`, the possibly non-reduced restricted root system, the
  restricted Weyl group `N_K(𝔞)/Z_K(𝔞)` with its reflections and chambers, `Ad(K)𝔞 = 𝔭`, and KAK
  with uniqueness modulo `W`; `IwasawaData` gains `restrictedRoots` and `positiveRestrictedRoots`
  fields. Still nothing on parabolics or Bruhat for the real group; Layer 8's Bruhat is for `G_ℂ`
  and is delegated to `ReductiveGroups` Layer 7 and `TauCeti.TitsSystem`.
- `ArithmeticLocallySymmetricSpaces` (#871) ALS.0.1–0.3: algebraic Cartan involutions of `𝐇(ℝ)`,
  their conjugacy (`IsCartanInvolution.conj`), the Lie-theoretic datum, maximal compact subgroups;
  ALS.2.1–2.2: rational parabolics, geodesic action and horospherical decomposition `e(P) ≅
  N_P(ℝ) × X_{L_P}`, Borel–Serre. Algebraic/rational parabolics only.
- `AdelicAlgebraicGroups` (#792) §3.1 rational parabolics and Iwasawa integration; §3.7 orbit
  maps; AA.3.1 relative root data over a number field. Algebraic.
- `AutomorphicSpectralTheoryPartII` (#1761) fixes a minimal parabolic `P = MAN` at infinity as a
  convention (consumer). `NoncompactQuantumSymmetry` (#1015) uses amenability of the minimal
  parabolic of its specific groups (consumer). `SmoothRepresentationsOfLocalGroups` (#1688) is
  nonarchimedean. `FlagVarieties` (#1762) and `SchubertGeometry` are algebraic over a field.
  `KleinianGroups`, `FuchsianOrbifolds` use rank-one `P` of `SL₂` / `SO(n,1)` (consumers).

**Libraries (step 1).** Mathlib: no Lie-group Iwasawa, Cartan involution or parabolic subgroup
(only `Matrix.IsParabolic` for `2 × 2` matrices and `GroupAction/Iwasawa.lean`, the Iwasawa
criterion for simplicity). Tau Ceti: `TauCeti.TitsSystem` with the abstract Bruhat decomposition
(`TauCeti/GroupTheory/TitsSystem/Basic.lean`, `Bruhat/Uniqueness.lean`, `Length.lean`,
`Exchange.lean`), with no standard-parabolic `P_J` theory; the dynamic algebraic parabolics
`TauCeti.Cocharacter.parabolic`, `levi`, `leviDecompositionMulEquiv`
(`TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean`) and their `GL_n` weight instances; no
real-Lie-group structure.

## Why part-ii

The target's objects are the continuation, one level up, of exactly what `LieGroups` Layer 9
builds, on the same carrier (`CartanInvolution`, `IwasawaData`) and in the same direction
(structure, before harmonic analysis), and the base's own README names this continuation as the
natural next roadmap. That is the brief's definition of a Part II. The suggested name
`RealReductiveGroupsStructure` is replaced by the mandated `<Base>PartII` form, `LieGroupsPartII`,
placed at top level like `ClassicalGroupsPartII`.

It is not a duplicate: nobody owns standard parabolic subalgebras and subgroups, their Langlands
decompositions, general parabolic subgroups, the boundedness description or the real Bruhat
decomposition. It is not a `merge-into`: no open target or design plans these objects.

The one real overlap is `AutomorphicFormsOnReductiveGroups` §2.3a (minimal parabolic, its
Langlands decomposition, and the Borel–Tits comparison). Importing that section into Part II is
impossible without a cycle: #1037 sits at merge-order line 63, consumes everything structural, and
its §2.3 induces from general parabolics that only Part II defines. By the supply principle the
ownership moves to Part II (the supplier), and §2.3a becomes a citation; the brief records this as
an ownership note and a risk, and asks the design to match §2.3a's statements and Checks exactly.
The ownership move is a message to the author of #1037 that the worker or a human must deliver.

## Generality

Stated on Layer 9's real reductive datum (possibly disconnected `G`, reductive `𝔤`, compact
`K = G^θ`), not on connected semisimple groups with finite centre; the filed special cases are
Checks. The brief flags that some theorems need Knapp's extra axiom `Ad(G) ⊆ Int(𝔤_ℂ)` and asks the
design to settle hypotheses theorem by theorem rather than shrink the carrier. Non-reduced
restricted root systems (`BC_n`) are in scope, with the standard-parabolic bijection stated through
`Σ ∩ Span(Π')`.

## Sources

Fetched through the service into `packages/RealReductiveGroupsStructure/sources.toml`:

| key | status | note |
| --- | --- | --- |
| `borel-tits1965` | certified (Numdam) | 4.15 (line 1488), 5.9 (1802), 5.15 (1868), 5.17–5.20 (1924–1955), §14.7 (3775–3821) read and quoted by locator; the service first resolved the DOI to Springer and was re-pointed at the Numdam item |
| `brown-fisher-hurtado2022` | certified (arXiv 1608.04995v4) | conventions lines 500–534; Annals DOI added by hand |
| `brown-rodriguezhertz-wang2022` | certified (arXiv 1609.05565v2) | conventions lines 125–157; Annals DOI added by hand |
| `bradlow-collier-garciaprada-gothen-oliveira2024` | certified (arXiv 2101.09377v2) | the first fetch used a wrong arXiv id (2103.01658, an unrelated control-theory paper) and was replaced under the same key; consumer-side reference only |
| `knapp2002` | uncertified | the DOI the service resolved is the 1996 first edition's record; year and edition corrected by hand |
| `warner1972`, `bourbaki-lie4-6` | uncertified | paywalled, cited by section |
| `wallach1988` | uncertified | the chapter DOI first tried resolved to a wrong record; replaced by the book's series page and ISBN |

The three Annals papers of the issue text were identified from the journal's tables of contents:
196(3) no. 1 = Brown–Fisher–Hurtado, no. 2 = Brown–Rodriguez Hertz–Wang, 200(3) no. 1 = Bradlow,
Collier, García-Prada, Gothen, Oliveira. The boundedness description of `Q_{Π'}` named in the
filed definition text is not in the two 2022 papers' convention sections (they define standard
parabolics as closed subgroups containing `P` and cite Knapp Proposition 7.76); the brief assigns
it to Knapp Ch. VII §7 and Borel–Tits 4.15 and asks the design to locate or prove the Lie-group
form.

Helgason 1978 was tried, not found legally, and dropped as redundant with Knapp and Warner. The
service wrote Knapp, Helgason and Wallach to `needs-references.toml` before their DOI-based
retries settled Knapp and Wallach as uncertified; that file was then removed, so no request to a
human is pending and the job is not parked.

## Suspicious text

None. No fetched text or roadmap contained instructions.

## Not done

Nothing in the brief is left out. The design will have to decide the merge-order slot (after
`ArithmeticLocallySymmetricSpaces` at line 62 and before `AutomorphicFormsOnReductiveGroups` at
line 63 if ALS.0.1–0.2 are consumed for target 8; otherwise anywhere after main) and must track
which head of `LieGroups` (main or #1051) is current when it writes `Suggested.lean`.

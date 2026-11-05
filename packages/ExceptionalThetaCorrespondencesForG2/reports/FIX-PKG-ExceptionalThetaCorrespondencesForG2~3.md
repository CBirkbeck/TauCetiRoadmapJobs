# Repair report: exceptional theta correspondences for G₂

## F01 (P2) — applied

§8.4’s shared discrete-series quantifier → separate hypotheses: every unitary discrete-series τ for the unshifted formula; unitary selfdual supercuspidal τ with ωτ=1 for both δ formulas. The Steinberg socle Check now records two constituents. The existing supercuspidal Check carries all hypotheses. Evidence: GS lines 2038–2049 and 354–362.

## F02 (P2) — applied

Identification after coefficient change → the LP-normalized WD conversion from φ, with inverse diagonal twist, unchanged N and geometric degree. Updated Conventions, both parameter supplier contracts, §0.7’s API, proof route, Needs and Layer 0 Examples/Dependencies. Added nonzero-N, zero-N, inertia and nonabelian Checks. The smooth supplier’s raw WD normalization requires the same conversion.

## F03 (P2) — applied

Unspecified SO₃ → determinant-one isometries of a fixed nondegenerate symmetric form on the standard module of the fixed long-root SL₃, followed by SL₃→G₂. Updated §0.6’s centralizer/API, §0.8’s component Check, §§1.8–1.9’s parameter references and Layer 0 Examples. Checks distinguish invariant dimensions 1 and 0, and centralizer orders 6 and 1.

## Mathematical verification and pattern audit

The review has three findings. All three are verified; none requires a supplier change, a new gap or an ownership move. The eleven earlier findings discussed in the review are background, rather than eleven additional findings in this repair round.

| Finding | Evidence read and mathematical conclusion |
|---|---|
| F01 | GS Theorem 15.3(i), p. 53, GS lines 2038–2043 permits every unitary discrete series, with separate generic/degenerate constituents when reducible. Part (ii), GS lines 2044–2049, imposes selfduality, supercuspidality and trivial central character on both δ formulas. Proposition 3.2(ii), p. 10, GS lines 354–362 gives the two Steinberg socle constituents. |
| F02 | TauCetiRoadmap/LanglandsParameterStacks/README.md, Conventions, LP0.4, LP1.11–LP1.12 uses geometric degree and arithmetic-Frobenius scaling q. TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md, SR.5.2, “wd-raw-parameters”, independently uses q^(deg_arithmetic). For a diagonal SL₂ element diag(t,t⁻¹), conjugation multiplies E₁₂ by t². Thus t=|w|⁻¹ᐟ² yields exactly the supplier equation, whereas t=|w|¹ᐟ² yields its reciprocal. |
| F03 | GS §2.6, p. 8, GS lines 282–288 identifies the particular SO₃ inside SL₃ and its S₃ centralizer. GS §3.4(1)–(2), p. 13, GS lines 452–460 distinguishes principal and subregular monodromy and their component groups. The long-root restriction 7=1⊕V⊕V∨ becomes 1⊕3⊕3 on SO(V,b), since b identifies V with V∨. For principal SL₂, the short-root weights have principal degrees ±2, ±4, ±6, together with 0; they form Sym⁶, with no invariant vector. |

For F02, the conversion is defined on representatives of the original W_F×SL₂ parameter and descends to conjugacy classes by equivariance. The Weil and SL₂ restrictions commute; the positive-square-root diagonal twist is a homomorphism. Their product is therefore a Weil homomorphism. Its inertia restriction is unchanged, its monodromy is the same nilpotent image of E₁₂, and conjugating φ conjugates both outputs. After fixing ℓ≠p, the coefficient isomorphism transports the chosen square roots as well as the pair. Only after proving the LP scaling equation is LP1.12 used. No inversion map on the nonabelian Weil group is asserted.

The pattern search covered every SO₃, principal/subregular, Frobenius, WD, LP1, δQ, δP, δ₂ and δ₁₃ occurrence in the package README and acceptance file. The δ definitions in §§1.1 and 1.4 already have supercuspidal hypotheses; the Steinberg/character cases in §§1.2, 1.3 and 1.5 remain separate. The classical SO₃ first-occurrence groups in §§6.1 and 8.6 are separate orthogonal groups, rather than embeddings into complex G₂. The normalization reference in Layer 6 continues to use the arithmetic convention of Layer 0; it is not an LP comparison. No Lean declaration consumes any changed name.

## Computed adversarial pass

This table covers the repaired statements, their conventions and dependent Checks. Values on all modified Examples and packet Checks have been recomputed. The source theorems, rather than the finite examples alone, justify the general lift and centralizer assertions.

| Statement | Instances tried | Values on the two sides or competing models | Result | Change |
|---|---|---|---|---|
| §8.4 unshifted lift formula | Unitary supercuspidal τ; τ=St_GL₂; irreducible and reducible unshifted inductions | Irreducible case: 1 input constituent ↔ 1 output constituent; split case: 2 ↔ 2, with genericity labels 1↔1 and 0↔0 (GS lines 2038–2043) | Retains full discrete-series domain | Quantifier separated from shifted formulas |
| §8.4 δQ formula | Selfdual supercuspidal τ with ωτ=1; St_GL₂ | Supercuspidal Q socle length 1 ↔ δ₂; Steinberg Q socle length 1+1=2, although ωτ=1 and τ∨=τ | Steinberg is excluded by the missing hypothesis | Supercuspidality explicit; negative Check added |
| §8.4 δP formula | Same selfdual supercuspidal τ; St_GL₂ at P exponent 1/2 | Supercuspidal P socle length 1 ↔ δ₁₃; Steinberg P series has length 3 and socle πgen[1], without the supercuspidal δP label (§1.2) | Uses the same restricted domain as δQ | Both formulas share the explicit full hypothesis |
| §8.4 separate Steinberg and quadratic entries | St_G₂; stχ with χ²=1, χ≠1 | St_G₂ ↦ St_H has discrete-series indicator 1↔1; quadratic Q socle has one πgen[χ] ↦ one σgen[χ], separately from the two δ constructions | Boundary entries remain separate | Steinberg Check identifies its applicable entry |
| §8.4 Steinberg GL₂ negative control and partner distinction | πgen[1] and πdeg[1] in the shifted Q socle | Two distinct socle constituents; πdeg[1] has division lift 1 and H lift 0; πgen[1] has a nonzero H lift | The socle cannot be relabelled as one δQ | Check invokes the existing division and E₆/H tables |
| Conventions: arithmetic WD twist | q=2 and 3; degrees 1, −1, 0; N=E₁₂ | q=2: conjugation factors 1/2, 2, 1 = q^(−degree); q=3: 1/3, 3, 1 = q^(−degree) | Original convention retained | Positive square roots specified |
| Conventions and LP contract: degree conversion | Arithmetic degrees 1, −1, 0 at q=2 and 3 | LP degrees −1, 1, 0; LP factors at q=2 are 2, 1/2, 1; at q=3 are 3, 1/3, 1 | Matches LP0.4 and LP1.11 in both directions | Explicit opposite degrees and twist |
| §0.7 definition of the LP-normalized WD conversion | Identity Deligne SL₂ in GL₂, trivial Weil part, q=3 | Original r(Fr)=diag(1/√3,√3) gives N/3; converted r_LP(Fr)=diag(√3,1/√3) gives 3N, equal to q^(−(−1))N | Original pair fails; converted pair satisfies supplier law | Identity comparison replaced |
| §0.7 inverse-Frobenius scaling | Same parameter, Fr⁻¹ | Original conjugation gives 3N; converted conjugation gives N/3=q^(−1)N | Matches geometric degree 1 | Inverse-Frobenius witness added |
| §0.7 zero monodromy | Trivial Deligne SL₂; torus parameter | N=0, r_LP(w)=r(w)=φ(w,1); both scaling equations give 0=0 | Explains why the old zero-N Check missed F02 | Zero-N control added |
| §0.7 nilpotent monodromy and inertia | N=E₁₂; inertia element i | N²=0; at degree 0 both diagonal twists are diag(1,1), so r_LP(i)=r(i)=φ(i,1) and both scaling factors are 1 | Nilpotence and finite inertia retained | Conversion API specifies these laws |
| §0.7 homomorphism law | Degrees 1 and −1; nonabelian S₃ Weil image with trivial Deligne factor | Diagonal twists multiply to diag(1,1); for a=(12), b=(123), (ab)⁻¹=(23) while a⁻¹b⁻¹=(13) | Product twist is multiplicative; elementwise inversion is not | Conversion acts on the SL₂ factor |
| §0.7 conjugation equivariance | h=diag(2,1/2), q=3, N=E₁₂ | Ad(h)N=4N; converted Frobenius sends 4N to 12N=3·4N | Gauge and scaling agree | Equivariance included in conversion API |
| §0.7 coefficient comparison | q=3, nonzero N; ℓ≠p, including ℓ=2 | Any field isomorphism sends rational 1/3 to 1/3 and 3 to 3; their difference is 8/3≠0 in characteristic-zero coefficients, also at ℓ=2 | Coefficient transport alone cannot fix normalization | Transport follows the conversion |
| Smooth supplier raw WD contract | q=3, arithmetic degree 1 | SR.5.2 requires 3N; r_LP gives 3N, whereas the original r gives N/3 | Same adapter is required at this second interface | Contract identifies (r_LP,N) as its input |
| §0.6 definition of the embedded SO(V,b) | b=I₃; g=diag(−1,−1,1); h=diag(2,1/2,1) | det g=1, gᵀbg=b; det h=1 but hᵀbh=diag(4,1/4,1)≠b | Inclusion selects SO₃ inside SL₃, excluding the larger subgroup | Form and composite specified |
| §0.6 defining hypotheses | Degenerate b=0; trivial homomorphism instead of the inclusion | With b=0, the determinant-one isometries are SL₃ of dimension 8, versus dimension 3 for SO₃; the trivial image fixes all 7 dimensions, versus 1 for the specified image | Nondegeneracy and the specified inclusion exclude both wrong models | Hypotheses retained explicitly |
| §0.6 seven-module restriction and principal comparison | Specified SO(V,b); principal image | Specified restriction has dimensions 1+3+3=7 and fixed dimension 1+0+0=1; principal Sym⁶ has dimension 7 and fixed dimension 0 | Same abstract group type gives different subgroups | Discriminating Check added |
| §0.6 centralizer and central signs | Specified SO(V,b); principal image; putative abelian centralizer | Centralizer orders 6 and 1; (−1)²=(−1)⁶=1, so both images factor through PSL₂; in the specified centralizer cζc⁻¹=ζ²≠ζ, versus ζ in C₆ | Abstract SO₃ or order 6 alone is insufficient | Centralizer refers to the specified image |
| §0.8 component group Check | Trivial Weil part and specified subregular image; principal image | G₂ center has order 1; raw and split orders are 6→6 and 1→1, respectively | No hidden central quotient changes the distinction | Image and trivial Weil restriction specified |
| §§1.8–1.9 parameter labels | Subregular trivial Weil part; principal monodromy; cubic-label inversion | Subregular enhancement dimensions 1,2,1 have squares 1+4+1=6; principal has one enhancement of dimension 1; ω⁻¹=ω² exchanges the two cubic labels | Labels agree with the specified images and existing eigenvalue convention | Subregular labels point to §0.6 |
| Layer 0 Examples | q=3, N=E₁₂; the two SO₃ images | Original/conversion at Fr: 1/3 versus 3; converted Fr⁻¹: 1/3; invariant dimensions 1 versus 0, centralizer orders 6 versus 1 | Examples agree with §§0.6–0.8 | Witnesses repeated at layer level |

All constructions above use characteristic-zero fields. Residue characteristics 2 and 3 remain included. The local-field restriction gives q≥2; at the excluded formal value q=1 both scaling factors would equal 1 and would not distinguish the conventions. No division by zero occurs: q and its chosen square roots are nonzero, and ℂ≅Q̄ℓ compares fields of characteristic zero. The new SO(V,b) definition uses dimension exactly three; a zero form or a zero-dimensional module is outside its stated hypotheses.

## Ownership, citations and pins

Read the main roadmaps TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md and TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md for their layer/API/example shape and their relevant representation-theory contracts. Also inspected the named main suppliers and the applicable open supplier heads. The local content checkout is e98875dbbea872d0496e323bc880e2b7fd00beb9. Initial service resolution used main snapshot 1ce5c4f and the 2026-10-25T13:35:40Z index of 363 open heads. Final resolution used main e98875d and the 2026-10-25T14:06:45Z index, also with 363 open heads. These repository copies were not conflated with the pinned libraries.

Object searches used the roadmap service, main, the board packages and the open-head index, including the sibling roadmaps named in the brief. Searches covered Weil–Deligne parameters and their scaling, the SL₂ dictionary, geometric degree, SO₃ centralizers and subregular embeddings. They identify LanglandsParameterStacks and SmoothRepresentationsOfLocalGroups as the owners of the supplied WD notions. This package owns the conversion from its W_F×SL₂ convention and its exceptional subgroup comparison; it does not reconstruct those supplier notions. The exact new dependency is LanglandsParameterStacks LP0.4 alongside LP1.11–LP1.12. The already cited smooth supplier target “wd-raw-parameters” has also been made explicit in its contract. Open-roadmap ownership was checked through the supplied service; no GitHub writes or separate pull-request discovery were used.

| Supplier citation family | Copy and locators verified |
|---|---|
| ReductiveGroups | Main, Layers 3, 3A.1 and 9; the represented-centralizer extension remains the declared gap. |
| ReductiveGroupsPartII | Open head 1383569, RG2.5.1–RG2.5.2, dual root data, dual groups and L-groups. |
| LieHighestWeight, SpinRepresentations, ClassicalGroups | Main, respectively Layer 8; Layers 4 and 8; Layer 6. The exceptional SO₃ comparison belongs to this package. |
| LieGroups and CompactGroups | Main, Layers 2 and 7; Layers 3–5. |
| ClassFieldTheory | Main, Layer 9, topological Weil carrier and arithmetic degree. |
| LanglandsParameterStacks | Open head 3e9dc9d, Conventions, LP0.4, LP0.5, LP1.11–LP1.12; the nonzero-N scaling matches the converted pair. |
| SmoothRepresentationsOfLocalGroups | Open head 1383569, SR.0.2, SR.0.4, SR.2.1–SR.2.3, SR.2a.1, SR.3.1–SR.3.4, SR.5.1 and SR.5.2; the raw WD law was read directly. |
| SmoothRepresentationsOfLocalGroupsPartII | packages/SmoothRepresentationsOfLocalGroupsPartII/design/README.md, SRU.0–SRU.4. This is a design-stage supplier, absent from the service’s published-roadmap view; its seven extensions are already gaps here. |
| MetaplecticAutomorphicForms | Open head 22bee85, §§0.15–0.17, 1.1, 2.4a–2.7, 3.4–3.8, 3.34, 3.37–3.40; the classical SO₃ occurrences have their own source and target. |
| EndoscopicTransferAndUnitaryTraceComparison and ModularityAndLanglandsExtensions | Open heads 40d60b6 and 2d70821, respectively §§4.7a, 10.30–10.31 and §3.5, including its nongeneric Plancherel assertion. |
| AutomorphicLFunctionsAndLocalFactors | Open head 5d22a23, AL.4 and “Central periods”, target normalized-rs-period. |
| AutomorphicLFunctionsAndLocalFactorsPartII | packages/AutomorphicLFunctionsAndLocalFactorsPartII/design/README.md, D.6. This design-stage supplier is not in the service’s published-roadmap view; the two exceptional spin extensions are already gaps here. |
| AutomorphicFormsOnReductiveGroups and AutomorphicSpectralTheory | Open heads c00e220 and c5cfb92, respectively §§2.1–2.7, 3.1–3.5, 4.1–4.2, 5.4 and the ALS.F.6 contract; §§1.1–1.2, 2.4–2.6, 4.4. |

The source locators used for the repairs are in the existing certified GS entry. No new source was needed and sources.toml is unchanged. GS05 and HPS remain waived; Var remains uncertified. None was requested again.

The installed revisions match lake-manifest.json: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Searches at these pins for Weil/WD parameter carriers, exceptional theta/minimal modules, normalized Jacquet modules and exceptional Harish–Chandra modules found no replacement for the missing headline carriers described in Suggested.lean. No new Lean name or stand-in was introduced. The explicit octonion, spin, Albert, matrix-group and smooth-discrete supplier contracts remain unchanged.

## Required checks and outcomes

- **Suggested.lean elaboration:** ran the required `lake env lean` invocation on packages/ExceptionalThetaCorrespondencesForG2/Suggested.lean from the content checkout. Exit 0; stdout/stderr empty; no warnings. Its only import is Mathlib, so no TauCeti module build was required.
- **Elaborated signatures:** mechanically enumerated every local declaration in Suggested.lean: zero. Consequently there are zero `#check @name` targets and no binders to compare. The scratch signature file with the same Mathlib import was elaborated once, exit 0 with empty output. No signature or README/Lean name correspondence changed.
- **Dependency direction:** ran the prescribed depcheck with this README, the package name, ORDER.txt and `--movable`. Exit 0. Its complete output was:

    depcheck: 52 roadmaps, 594 edges, 0 problem(s)

  No UPWARD, CYCLE or moved line appeared.
- **Citation resolution:** the roadmap service found no cross-roadmap citation or backticked name that was absent everywhere. Its warning that it could not discover pinned Lake packages was not treated as evidence about these pins; those were inspected directly.
- **Whitespace/diff check:** `git diff --check` exited 0 with empty output.
- **Gate failures in the brief:** none were listed; no separate gate-failure repair was required.

## Maintainer notes

Only packages/ExceptionalThetaCorrespondencesForG2/README.md and this report change. Suggested.lean, metadata.toml, sources.toml and design/plan.json remain unchanged. All eleven supplier gaps remain as declared. No merge-order change, ownership transfer or downstream Lean-name change is needed. The stricter hypotheses for the two δ formulas and the distinction between the two WD normalizations are relevant to consumers of the prose lift and parameter tables.

The read-only design snapshot packages/ExceptionalThetaCorrespondencesForG2/design/README.md still contains the earlier lift formula and dictionary wording. It is outside the permitted edit list; the package README is the roadmap repaired here. No source text was copied into the package or report. No commit, push or pull-request edit was made.

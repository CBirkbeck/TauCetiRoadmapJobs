# Review of BordismFormalGroups (pull request #1807 at 8d8b243)

**Verdict:** needs changes

## R01 (P3) — The description's BordismFormalGroups paragraph does not mention the README rewrite or the eight dropped declarations

**Location:** Description, BordismFormalGroups paragraph: "**BordismFormalGroups** no longer consumes HomotopySpheres or TangentialBordism (a loop through StringOrientation). It owns …", ending "Its Suggested.lean states Lazard's height classification, the invariant primes of the Lazard ring and Lubin–Tate deformations."

**Claim:** This pull request revises the roadmap on main and rewrites most of it into the house shape, adding 23 subsection ids (F1.1–F5.5) that main lacks. Its `Suggested.lean` drops all eight of main's declarations. The paragraph mentions neither change. The AdicSpacesPartIII, AlgebraicCurves, CharacteristicClasses and PadicFunctionalAnalysis paragraphs each state theirs.

**Witness:** `git diff --numstat origin/main...HEAD` on the folder gives README +2296/−1309 against main's 2824 lines. Main's `Suggested.lean` lines 17–72 declare `formalNSeries`, `formalVariable`, four `formalNSeries_*`, `exists_unique_normalized_exponentTwo_logarithm` and `isSMulRegular_sub_of_pow_eq_zero`. None of them is at this head.

**Repair:** After "…and takes the finite CW type of compact smooth manifolds from AlgebraicTopology 8.7." insert:

"Its README (on main) is rewritten in the house shape. Layers 1–6 keep the labels F1–F6 and F6.1–F6.7 and add the subsections F1.1–F1.5, F2.1–F2.6, F3.1–F3.3, F4.1–F4.6 and F5.1–F5.5."

Replace the paragraph's last sentence with:

"Its Suggested.lean drops main's eight declarations: the n-series API and the normalized exponent-two logarithm, now Tau Ceti's `FormalGroup.nsmulSeries` and `FormalGroup.exponentTwoLog`, and F6.6's regularity lemma `isSMulRegular_sub_of_pow_eq_zero`. It states Lazard's height classification, the invariant primes of the Lazard ring and Lubin–Tate deformations."

## Previous findings

- R01 — not repaired: deferred (D01)
- R02 — repaired: "(not on main)" and the "once this merges, TangentialBordism (#942)" clause are gone. The text now reads "So are two roadmaps on main, left unchanged here, each dropping its BordismFormalGroups consumer clauses: HomotopySpheres, … 3B → BordismFormalGroups F6.2, 3C.3 → F4.1; TangentialBordism, B4.1, B4.2, B4.7 → F2.2, B4.4 → F2.4."

## Deferred findings

- D01 — stands. On main at `2c2bcf5`, TangentialBordism lines 76–77 still say "Owned here: the mod p Steenrod algebras and Adams towers (B4.1–2, B4.7), which BordismFormalGroups consumes". HomotopySpheres line 3316 still names BordismFormalGroups as a consumer.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| F1.5 Hazewinkel vs Araki generators (named in the description), Check at line 612 | p=2, p=3 | ℓ₁=v₁/p vs v₁/(p−p^p): p=2 gives v₁/2 and −v₁/2, factor 1−p^(p−1)=−1. p=3 gives v₁/3 and −v₁/24, factor −8≡1 mod 3, a unit | agrees with lines 612–614 | — |
| F1.5 p-typicalization of X+Y+XY, Check at line 603 | p=2, p=3 | The coefficient of x^(p^i) is (−1)^(p^i+1)/p^i. So ℓ₁=−1/2 at p=2 and 1/3 at p=3, and Hazewinkel's v₁=pℓ₁ is −1 or 1, a unit | agrees | — |
| F1.5/F3.1 right unit (description: "identifies (BP_*,BP_*BP) with (V,VT)"), lines 615–618 and 1227–1229 | p=2, p=3 | η_R(ℓ₁)=ℓ₁+t₁. Hazewinkel: η_R(v₁)=v₁+pt₁. Araki: v₁+(p−p^p)t₁, which is v₁−2t₁ at p=2 and v₁−24t₁ at p=3; p(1−p^(p−1)) gives −2 and −24 | the two layers agree | — |
| F3.1 BP as a summand of MU_(2), line 1214 | degrees 2, 4, 6 | BP ranks are 1, 1, 2 (v₁; v₁²; v₁³, v₂). MU ranks are 1, 2, 3 (partitions of 1, 2, 3). x₂ is killed because 3 is not a power of 2 | proper retract, as stated | — |
| F3.1 idempotent splitting by G3.4 telescopes, line 1218 | X=S[1/2]∨S[1/2], e=(1+τ)/2 | e(a,b)=((a+b)/2,(a+b)/2), so the image is the diagonal ℤ[1/2] and eX≃S[1/2]. For e=diag(1,0) the cofiber is (1−e)X∨Σ(1−e)X, not a summand | holds | — |
| F3.2 Honda H₁ vs the multiplicative law, line 1260 | 𝔽₂, 𝔽₃ | By Araki's formula with v₀=p=0 and v₁=1, [p](x)=x^p. (1+x)²−1=x²+2x=x² over 𝔽₂; (1+x)³−1=x³ over 𝔽₃ | both have height 1, as stated | — |
| `nonempty_formalGroupIso_iff_height_eq` (F1.5, named in the description) | 𝔽₃ vs 𝔽₉; 𝔾̂_a vs 𝔾̂_m over 𝔽̄_p | Laws v₁↦1 and v₁↦−1 have [3]=x³ and −x³; an isomorphism cx+⋯ needs c²=−1. There is no c in 𝔽₃, and c=i in 𝔽₉. Heights ⊤ and 1 differ, and the laws are not isomorphic | `IsSepClosed` is needed and is in the signature | — |

The rows for this roadmap's other statements stand as in the review of `78bda3b`, including the three headline theorems and the seeded sample.

- **Folder.** `git diff 78bda3b..HEAD -- TauCetiRoadmap/BordismFormalGroups` is empty. The two commits since then change only AdicSpacesPartIII and CharacteristicClasses C7.6, and neither adds or removes a mention of BordismFormalGroups.
- **Gate.** The worker's gate at `8d8b243` passes every check (`build=0`). My rerun differs only in `outside-folder=24`, which lists the README and `Suggested.lean` of the 12 sibling folders that the brief names as this pull request's own. `git diff --stat origin/main...HEAD` with all 13 folders excluded is empty.
- **Dependency check.** Output: `depcheck: 206 roadmaps, 1908 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- **Elaboration.** `lake env lean` gives 3 `sorry` warnings (lines 75, 90, 116) and nothing else. `#check @name` on all 4 declarations matches `signatures.md` exactly, and no binder is lost.
- **Description against the head (11 claims checked).**
  - Main's README consumed both roadmaps (main lines 331, 463, 668), so "no longer consumes" holds.
  - Both loops pass through StringOrientation: TangentialBordism line 462, HomotopySpheres lines 176 and 529, StringOrientation line 249.
  - AlgebraicTopology 8.7 is cited at lines 63, 216 and 3529. The F3.1 claims (G3.4 telescopes, G3.9 MU_(p), (V,VT)) are at lines 1182–1209, and F3.2's Honda laws from V at line 1235.
  - F6.5's foundations go to G2.11 (lines 97–120). GeneralizedCohomology at this head names BordismFormalGroups only as a consumer (lines 95 and 4934).
- **Library.** Opened at the pin: `FormalGroup.nsmulSeries` (NSMul/Basic.lean:93), `FormalGroup.exponentTwoLog` (ExponentTwo/Basic.lean:64) and its uniqueness `eq_exponentTwoLog` (:113).
- **Dropped anchor.** `#f65-local-group-actions-and-completion-comparisons` is cited only at main's GeneralizedCohomology line 46, through a link pinned to blob `d5255545`. No file at this head cites it, and the label F6.5 is kept.

Overlap check: I read the open ChromaticHomotopyTheory (head 29867f9b), GeneralAlgebraicKTheoryPartII (ca443590) and StableHomotopyKTheoryPartII (8947c46c), together with EllipticCohomology and TangentialBordism on main and GeneralizedCohomology at this head.
- BordismFormalGroups owns formal groups, BP/K(n), Landweber exactness, Lubin–Tate and F6.1–F6.5, and the three open roadmaps cite them.
- GeneralizedCohomology owns spectra and the G2.11 foundations. EllipticCohomology owns elliptic realization and tmf.
- The Steenrod algebras and Adams towers, the MO splitting, the James construction and Toda brackets have two owners. This is D01, and StableHomotopyKTheoryPartII line 12 names TangentialBordism as the Steenrod owner.

## Not verifiable

- None. No locator in changed text: the folder is unchanged and the description cites no source.

## Source issues

- none

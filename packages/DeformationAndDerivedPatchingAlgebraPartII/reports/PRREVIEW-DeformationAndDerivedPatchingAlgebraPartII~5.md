# Review of DeformationAndDerivedPatchingAlgebraPartII (pull request #872 at 39f9ecd)

**Verdict:** needs changes

## R01 (P3) — K3.5's Needs line omits the non-affine blow-up its statement uses

**Location:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebraPartII/README.md:1729`: “*Needs:* Tau Ceti `Ideal.affineBlowup`, `affineBlowupι` and their chart covering; Mathlib `AlgebraicGeometry.Scheme.OpenCover.glueMorphisms`.”
**Claim:** Affine blow-up charts and gluing suffice to state and prove the product-of-ideals comparison for arbitrary ideals.
**Witness:** The statement's `b'` blows up the scheme `Bl_I(Spec R)` along `J𝒪`; for `R = k[x,y]`, `I = (x,y)` this scheme is not affine. The removed StableReduction Layer 4 citation supplied it; README line 245 says only “K3.4 uses this exceptional divisor”.
**Repair:** Append to the Needs line: “Tau Ceti `AlgebraicGeometry.Scheme.IdealSheafData.blowup`, `blowupToBase` and `blowupChart` (Exact supplier contracts), for the blow-up of `Bl_I(Spec R)` along `J𝒪` and its restriction over each chart `Spec R[I/a]`; Mathlib `AlgebraicGeometry.Scheme.IdealSheafData.comap` for `J𝒪`.” In the supplier contract (line 241), name `blowupChart` and end with “K3.4 uses this exceptional divisor; K3.5 uses the blow-up of the non-affine `Bl_I(Spec R)`.” For `k[x,y]`, `(x,y)`, the chart over `Spec R[y/x]` is then supplied.

## R02 (P3) — Usage lines not updated to the new K3.4–K3.5 suppliers

**Location:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebraPartII/README.md:260`: “Used in K3.3–K3.6 and K4.”; line 1891: “SchemeAndStackFoundations §0.3, §§0.17–0.18 and §4.11”.
**Claim:** K3.4 and K3.5 consume StableReduction Layer 4, and Layer K3 consumes SchemeAndStackFoundations §0.3.
**Witness:** At this head the Needs lines of K3.4 (lines 1685–1687, 1706) and K3.5 (1729–1730, 1753) cite neither; line 297 says §0.3 is “Used in K4.2”; no K3 target cites §0.3.
**Repair:** Line 260: “Used in K3.3, K3.6 and K4.” K3 `### Dependencies`: “Layer K2 (for the prefix products); Mathlib; Tau Ceti (Rees grading, affine blow-up algebras and charts, ideal-sheaf blow-ups and their exceptional divisor); TauCetiRoadmap StableReduction (Layer 4); SchemeAndStackFoundations §§0.17–0.18 and §4.11; AdicSpacesPartII (localization exactness).”

## Previous findings

- R01 — repaired: “**CM-secancy on Cohen–Macaulay modules.** Every secant list on a finite Cohen–Macaulay module over a Noetherian local ring is CM-secant. Apply `Module.IsCohenMacaulay.isSMulRegular_of_supportDim_quotSMulTop_lt` at each secant step”; the regularity bullet is gone and the declaration is in both supplier lists.
- R02 — repaired: “localize at `p` and `q` and apply `Ideal.height_eq_height_add_of_liesOver_of_hasGoingDown`, using `Algebra.HasGoingDown.of_flat`, to the localized polynomial extension (Stacks 00ON)”; the promise to build the formula is removed.
- R03 — repaired: “For a commutative ring `R`, an ideal `I` and any `R`-module `M`”; “Let `I,J` be ideals of a commutative ring `R`” (both K3.5 statements); three non-Noetherian Checks added. The repair's supplier lines are R01–R02 of this report.
- R04 — repaired: the standalone block and its Checks are removed; both K0.1 Needs lines read “Tau Ceti `Ideal.injective_primaryComponent` (Exact supplier contracts)”.
- R05 — repaired: “## Downstream consumers … DeformationAndDerivedPatchingAlgebra consumes K0.1 and K0.4–K0.7 for local cohomology and K3.1 for Rees modules.”
- R06 — repaired: the five instances at `Suggested.lean` lines 187, 191, 273, 282 and 286 each carry a docstring matching their bodies.

## Verified sound

`k` is a field, `N = k⟦x,y⟧/(x²,xy)`.

| Statement | Instances tried | Left/construction value | Right/comparison value | Result | Change |
| --- | --- | --- | --- | --- | --- |
| K0.5 CM-secancy on CM modules; cesnavicius line 397 | `k⟦x,y⟧`, `[x²,y³]`; zero module; `N`, `[y]` (not CM) | Dimensions `2→1→0`, each drop strict, so both elements regular; only `[]` secant; `ker(y)=k·x̄≠0` | All annihilator products `R`, terminal quotient of dimension `0`; terminal `0` is CM; hypothesis CM fails | Agrees; CM hypothesis used | — |
| Tau Ceti parameter regularity, `RegularSequence.lean:111` | `k⟦x⟧`, `x`; `k⟦x⟧`, `0`; `M=0` | `0<1`, `ker(x)=0`; `1<1` false; `⊥<⊥` false | Finite, Noetherian local, strict drop: as the contract states | Contract matches the pin | — |
| Tau Ceti `Ideal.injective_primaryComponent`, `Noetherian.lean:61` | DVR, `E=k((x))/k⟦x⟧`; `I=0`; `I=R` | `Γ_(x)(E)=E`; `E`; `0` | Injective in all three; Mathlib `primaryComponent = ⨆ torsionBySet(Iⁱ)` | Contract matches the pin | — |
| K3.4 comparison, arbitrary `R`, `I`, `M`; cesnavicius line 549 | `R=k[x₁,x₂,…]`, `I=(x₁)`, `M=⊕R/(x₁)`; `ℤ`, `(2)`, `ℤ/2` | `IⁿM=0` for `n≥1`, chart module `0`; `0` | `R[I/x₁]⊗M=M` all `x₁`-torsion, quotient `0`; `ℤ/2` all `2`-torsion, quotient `0` | Agrees without finiteness | — |
| K3.5 schemes, arbitrary ideals; stacks line 130340 | `R=k[y,x₁,x₂,…]`, `I=(xᵢ)`, `J=(y)`; `k⟦x,y⟧/(xy)`, `(x)`, `(y)` | `R[IJ/(yx₁)]=R[xᵢ/x₁]`; `IJ=0`, empty | `R[I/x₁][(y)/y]=R[xᵢ/x₁]`; `J` zero on `Spec k⟦x⟧`, empty | Agrees; Needs line incomplete | R01 |
| K3.5 modules, arbitrary ideals; cesnavicius line 561 | Same `R,I,J`, `M=R/(y)` | Chart of `M` at `x₁` is `k[xᵢ][xᵢ/x₁]≠0`; its `y`-chart `0` | `M[1/(yx₁)]=0`, product chart `0` | Agrees | — |
| K3.6 finite-type height inequality with pinned 00ON; stacks lines 33378, 33414 | `k[x]⊂k[x,t]`: `(p,q)=((x),(x,t))`; `((x),(x))` | `ht q = 2`; `1` | `ht p + ht(q/pB) = 1+1`; `1+0`; inequality `2+0≤1+1`, `1+1≤1+1` | Agrees | — |
| Usage lines for suppliers of K3 | README lines 260, 1891 against the Needs lines of K3.3–K3.6 | Claimed: StableReduction in K3.3–K3.6; §0.3 in K3 | Cited: StableReduction in K3.3, K3.6 only; §0.3 in K4.2 only | Stale | R02 |
| Five instance docstrings, `Suggested.lean` | `I=R`, `a=1`; Huckaba algebra over `𝔽₂` | Chart ring `R`, structure map identity; constant-term quotient `𝔽₂` | Subalgebra ring and algebra structure; maximal kernel, local localization | Docstrings match bodies | — |

The rows for untouched statements stand as in the previous review, of `51b4ae2`.

- Source locators checked in the changed passages: 5 (cesnavicius lines 397–404, 549–560, 561–564; stacks lines 33378, 33414, 130340 for tags 00ON, 02IJ, 080A). Sampled targets falling in the diff: “Product of ideals, modules” and “Finite-type height inequality”; both supported as written.
- Pinned declarations opened: `TauCeti/RingTheory/CohenMacaulay/RegularSequence.lean:111`; `TauCeti/Algebra/Module/Injective/Noetherian.lean:61`; `TauCeti/AlgebraicGeometry/Blowup/IdealSheaf.lean:120,124,130`; `TauCeti/AlgebraicGeometry/Blowup/ExceptionalDivisor.lean:184` (no finiteness hypothesis); `Mathlib/RingTheory/Ideal/KrullsHeightTheorem.lean:484`; `Mathlib/RingTheory/Ideal/GoingDown.lean:154`; `Mathlib/AlgebraicGeometry/Gluing.lean:444`; `Mathlib/Algebra/Module/Torsion/PrimaryComponent.lean:48`.
- Duplication by object for the widened K3.4–K3.5: Tau Ceti's `Blowup/StrictTransform.lean` and `Blowup/Pullback.lean` treat strict transforms of schemes only; no pinned file states the product-of-ideals blow-up (tag 080A) or a strict transform of modules.
- Gate at `39f9ecd`: every check passed, including the worker's targeted build; rerun independently with the same result. Dependency check: `depcheck: 247 roadmaps, 2237 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with exactly 9 `sorry` warnings; the diff changes no statement, only five docstrings, so the signature and padding results of the previous review stand.
- Pull request text against this head: the description states the widened comparisons and the four imported library results; nothing outside the folder changed; no supplier roadmap added or dropped. No sentence contradicted.

Overlap check: read DeformationAndDerivedPatchingAlgebra, DirectSummandsAndBigCohenMacaulay, SchemeAndStackFoundations (main and its open revision), PurityForFlatCohomology, PurityOfBranchLocus, LocalPurity; nothing shared beyond the previous review's record. No other open pull request changes this folder, no cited id is dropped, and no second copy exists.

Source independence: changed passages only; 5 passages compared with 2 sources (cesnavicius, stacks), none shared beyond statements the mathematics forces; largest share cesnavicius, as in the previous review; the diff adds, removes or reorders no layer, so the contents were not compared again.

## Not verifiable

- Nothing in the changed passages. The three items of the previous review (kawasaki1999; schenzel1982; huneke1982 and hio) are untouched and stand.

## Source issues

- none

## For the human reviewers

- The 1999 author-preprint of Kawasaki remains unreadable through the sources service; the published 2002 version supports the colon statements but does not certify the preprint's pagination. See `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebraPartII/README.md`, K2.3's locators.

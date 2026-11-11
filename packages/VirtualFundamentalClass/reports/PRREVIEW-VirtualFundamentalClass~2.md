# Review of VirtualFundamentalClass (pull request #1996 at 2f05f76)

**Verdict:** needs changes

## R01 (P2) — Rational Chow groups of DM stacks have an earlier owner

**Location:** `README.md:277–283`: "Build Vistoli's dimension-graded rational Chow groups for separated Deligne–Mumford stacks … Extend proper pushforward, flat pullback, localization, and exterior products to these rational stack Chow groups".

**Claim:** Layer 2 owns rational Chow groups of DM stacks with their pushforward, pullback, Gysin maps and Chern classes.

**Witness:** `packages/VirtualFundamentalClasses/README.md` (merge order line 402; this roadmap is at 406) owns these in §§2.3–5.2. Its Layers 7–10 own the cone stacks, obstruction theories and virtual classes. StableReductionPartII `README.md:102` asks SchemeAndStackFoundations for the same Chow theory (`gap:stack-chow-grr`).

**Repair:** A human chooses one owner of the shared core; the VirtualFundamentalClasses package has already recorded this as a decision for a human.
- **If VirtualFundamentalClasses owns it:**
  - Replace Layer 2 bullets 1–3 with a supplier contract: "From TauCetiRoadmap.VirtualFundamentalClasses: §2.3 rational Chow groups, §§3.1–3.5 flat pullback, proper pushforward, localisation and exterior products, §4.5 Gysin maps, §§5.1–5.2 homotopy invariance and Chern classes of DM stacks."
  - Cite its Layers 7–10 instead of restating them in Layers 4–9.
- **If this roadmap owns it:** move it ahead of both VirtualFundamentalClasses and StableReductionPartII in the merge order, and say so under Scope.

## R02 (P2) — The relative theory over a base that is not DM has no owner for `L_{X/Y}` or its Gysin maps

**Location:** `README.md:451–453`: "For `f : X → Y` of relative Deligne–Mumford type, define `𝔑_{X/Y} = h¹/h⁰((L_{X/Y})∨)`". Lines 313–315 build `L_{X/Y}` only "to Deligne–Mumford stacks".

**Claim:** Layers 2 and 3 supply what Layer 9 uses.

**Witness:** For `Spec k → B𝔾_m`, which is of relative DM type over a base `Y` of dimension −1, `L_{X/Y} = k` and the class is `[pt] ∈ A_{−1+1}`. No layer builds `L_{X/Y}` or `A*(X → Y)` when `Y` is not DM, although BehrendFantechi1997 lines 1645–1648 (p. 49) allow such `Y`.

**Repair:** Do one of the following.
- **Add targets.**
  - Layer 3: the cotangent complex of a morphism of relative DM type to an algebraic stack, by smooth-atlas base change and descent on `X_ét`, with its transitivity triangles.
  - Layer 2: the bivariant groups `A*(X → Y)` and the class of a regular local immersion of algebraic stacks (BehrendFantechi1997 lines 1618–1643, pp. 48–49).
- **Restrict instead:** limit end goal 5 and Layer 9 to DM bases `Y`.

## R03 (P2) — The Example 7.6 item needs a relative class over a base that is not smooth

**Location:** `README.md:476–480`: "with `V` and `W` smooth … the resulting virtual class is the zero-section intersection of `C_{X/V}` in `g^*N_{Y/W}`". Layer 9 builds the class only "When `Y` is smooth and pure of dimension `d`" (line 453).

**Claim:** The class named in the item exists.

**Witness:** Take `V = W = 𝔸²`, `h = id` and `X = Y = V(xy)`. Behrend–Fantechi give `0^![C_{Y/𝔸²}] = [x-axis] + [y-axis] = [Y] ∈ A₁(Y)` (BehrendFantechi1997 line 1740, p. 52). Layer 9 defines no class here, because `Y` is singular.

**Repair:** In Layer 9 and end goal 5, take `Y` "an algebraic stack of pure, constant dimension `d`" (BehrendFantechi1997 line 1646, p. 49). Require `Y` smooth only in the Gysin statements of Props. 7.2 and 7.5.

## R04 (P2) — Resolution independence relies on chain maps that need not exist

**Location:** `README.md:416–417`: "Given two global resolutions, construct a common dominating resolution and use smooth pullback plus zero-section Gysin compatibility to prove equality of the resulting classes."

**Claim:** Any two global resolutions are dominated by a third through chain maps.

**Witness:** On `ℙ¹`, the complex `F• = [O(−2) →0 O]` has the derived automorphism `id + ε`, with `ε ∈ Ext¹(O, O(−2)) ≅ H¹(O(−2)) ≅ k`, and no chain map represents it. The proof in BehrendFantechi1997 (line 1303, p. 39) assumes chain maps.

**Repair:** State the step as follows. "For an isomorphism `F• ≅ H•` in `D(O_X)`, construct a global resolution `K•` with chain quasi-isomorphisms `K• → F•` and `K• → H•` that realise it, when `X` has the resolution property: resolve a roof by vector bundles, then truncate using amplitude `[−1,0]`." Then either add the resolution property to Layer 7 or cite a source that removes it.

## R05 (P2) — End goal 4 still recovers `[X]` for every local complete intersection

**Location:** `README.md:57–58`: "Recover the ordinary fundamental class for a local complete intersection equipped with its cotangent-complex obstruction theory."

**Claim:** `[X, L_X]vir = [X]` for every local complete intersection.

**Witness:** Take `X = Spec k ⊔ 𝔸¹_k`. The rank of `L_X` is 0 on the point and 1 on the line, so no `n` has `[X, L_X]vir ∈ A_n(X)_ℚ`. Layer 7 (line 426) now says "pure-dimensional"; end goal 4 does not.

**Repair:** Write: "Recover the ordinary fundamental class `[X] ∈ A_n(X)_ℚ` for a local complete intersection of pure dimension `n` with its cotangent-complex obstruction theory (BehrendFantechi1997 line 1321, p. 39)."

## R06 (P3) — Layer 5 points forward to Layers 8 and 9

**Location:** `README.md:370–373`: "prove the short exact sequence of cone stacks `𝔑_{X/Y} → 𝔠_X → f*𝔠_Y` … use deformation to the normal cone and Layer 8’s Vistoli comparison for regular-immersion virtual pullback."

**Claim:** Layer 5 depends only on Layers 0, 1, 3 and 4. Line 528 says: "It does not depend on Chow theory".

**Witness:** `𝔑_{X/Y}` is defined only in Layer 9 (lines 451–452). Layer 8's Vistoli comparison is Chow-theoretic, and Layer 8 depends on Layer 7, which depends on Layer 5.

**Repair:**
- In Layer 5 write: "For a smooth morphism `f : X → Y`, prove the short exact sequence `B T_{X/Y} → 𝔠_X → f*𝔠_Y`. For a local complete intersection morphism, prove the exact sequence `h¹/h⁰((L_{X/Y})∨) → 𝔑_X → f*𝔑_Y` from the transitivity triangle and Layer 4."
- Move "use deformation to the normal cone and Vistoli's rational equivalence, not an exact cone sequence" into Layer 8's regular-local-immersion item (line 440).

## R07 (P3) — DerivedDeRhamCohomology §5.8 is consumed without a supplier contract

**Location:** `README.md:315–316`: "Compare the scheme construction with the shared scheme cotangent complex of `DerivedDeRhamCohomology` §5.8". Line 204: "They also do not globalize the cotangent complex to schemes and stacks."

**Claim:** The supplier contracts (lines 176–197) are complete, and line 204 is true.

**Witness:** DerivedDeRhamCohomology §5.8 defines `L_(X/A)` for a quasi-compact quasi-separated scheme, with value `L_(B/A)` on affine opens. That roadmap is new, still in a pull request, and at merge-order line 23. Lines 176–197 do not name it.

**Repair:**
- Add a supplier contract: "`DerivedDeRhamCohomology` §5.8 owns the Zariski cotangent complex `L_(X/A)` of a quasi-compact quasi-separated scheme over `Spec A` or over a scheme base; Layer 3 compares it with the small-étale construction."
- Replace line 204 by: "They also do not construct the cotangent complex on the small étale sites of schemes and algebraic spaces, or on Deligne–Mumford stacks."

## R08 (P3) — The README departs from the house shape

**Location:** The headings "Suggested homes", "## The end goals", "## Standing conventions", "## Inventory: …", "### Layer k", "## Ordering and work packages" and "## Boundary of this roadmap".

**Claim:** The README is in TauCetiRoadmap form.

**Witness:** Compare SchemeAndStackFoundations on main. This README has no `**Summary.**`, no Scope and ownership, no From-subsections, no How to read the build, no `### k.n` sections, no `*Needs:*`, no `**Checks.**`, no per-layer Examples or Dependencies, and no Downstream consumers.

**Repair:** Restructure as in the previous review:
- Fold Inventory and Boundary into Scope and ownership.
- Write supplier contracts per supplier.
- Use `### k.n` targets ending in `*Needs:*`.
- Give each definition API bullets and at least three Checks. The worked examples and the two new Layer 5 counterexamples can supply many of these.
- End each layer with Examples and Dependencies.
- Add Downstream consumers naming GromovWittenTheory.

## R09 (P3) — Claims have no locators, including the two corrected propositions

**Location:** `README.md:367–373`: "Prove that `X` is a local complete intersection exactly when `𝔠_X` is a vector-bundle stack … For a smooth morphism `f : X → Y`, prove the short exact sequence". Line 237: "when `G` is smooth".

**Claim:** The claims carry locators.

**Witness:** These are Prop. 3.12 (BehrendFantechi1997 line 1010, p. 30) and Prop. 3.14 (line 1040, p. 31), both narrowed here without saying so. Stacks 0AFR allows any finite-type `G`. Lines 321–322 give no source for the converse of Stacks 08SL.

**Repair:**
- Put the theorem and page at each claim, stating that the numbering is that of arXiv v1.
- Layer 5:
  - "(BF Prop. 3.12, p. 30; its third condition `𝔠_X = 𝔑_X` is not equivalent, see the first check)".
  - "(BF Prop. 3.14, p. 31, stated there for every lci morphism; the second check refutes that)".
- Layer 0: cite Stacks 0AFL–0AFR and drop "smooth".
- Layer 3:
  - cite Stacks 08SL, and a source for the converse;
  - cite Illusie III Cor. 3.1.3 for the comparison with a local embedding.

## R10 (P3) — The inventory misnames a pinned declaration and names directories that do not exist

**Location:** `README.md:172`: "`TauCeti.AlgebraicGeometry.Chow.ChowGroup` and `Chow.pushforward` for closed immersions". Lines 23 and 25 give the homes "`TauCeti/AlgebraicGeometry/Stacks/`" and "`TauCeti/AlgebraicGeometry/IntersectionTheory/`".

**Claim:** These are the pinned names.

**Witness:**
- No `Chow.pushforward` exists. The declaration is `Chow.ChowGroup.pushforward` (`TauCeti/AlgebraicGeometry/Chow/ClosedImmersion.lean:211`), which takes `[IsClosedImmersion i]` and `[IsLocallyNoetherian]` on both schemes.
- The pinned directories are `AlgebraicGeometry/Stack/` and `AlgebraicGeometry/Chow/`.

**Repair:**
- Write `TauCeti.AlgebraicGeometry.Chow.ChowGroup.pushforward`.
- Rename the homes to `TauCeti/AlgebraicGeometry/Stack/` and `TauCeti/AlgebraicGeometry/Chow/`.
- At line 314, cite SchemeAndStackFoundations §1.10 for the small étale site of an algebraic space.

## R11 (P3) — The `Suggested.lean` docstring does not name the headlines it cannot state, and it carries a catalogue of names

**Location:** `Suggested.lean:13–16`: "do not yet exist at the repository pins … records the mathematical signatures in comments until the owning layers provide their types". Also the commented code block at lines 21–51 and line 60, "-- No compiled targets yet".

**Claim:** The docstring has the required form.

**Witness:**
- The required form names each headline that cannot be stated, with the carrier it lacks.
- Lines 21–51 are a catalogue of names.
- "yet" and "until" are process words.
- Lines 6–9 promise statements that the file does not contain.

**Repair:** Title the docstring "…: target signatures" and say that the roadmap is `README.md`.
- Give one line per headline that cannot be stated, with the carrier it lacks:
  - BF Thm. 3.11 and Thm. 4.5;
  - Def. 5.2 and Prop. 5.3;
  - Props. 5.5–5.10;
  - §7.
- The missing carriers are DM stacks, the cotangent complex on stacks, cone stacks and Chow groups of DM stacks.
- Delete lines 21–51 and line 60.

## R12 (P3) — Process narrative and a target that sits in no layer

**Location:**
- `README.md:531–536`: "should begin only after the absolute class and its resolution-independence theorem pass the worked examples. Register separate intentions … rather than claiming the whole roadmap."
- Line 94: "Provide codimension notation for pure-dimensional stacks".
- Line 168: "They do not yet form".

**Claim:** The README is timeless, and every item lives in a layer.

**Witness:** The house rules forbid scheduling, intentions and "yet". No layer item constructs codimension grading.

**Repair:**
- Delete the clause at lines 531–532 and the paragraph at lines 534–536.
- Make "for `X` pure of dimension `n`, `A^c(X)_ℚ = A_{n−c}(X)_ℚ`" a Layer 2 target, or delete the sentence at line 94.
- Write "They do not form".

## R13 (P3) — The pull request description omits a supplier that is still in a pull request

**Location:** The description: "Reuse the stack, vector-bundle, scheme-intersection, and derived foundations owned by existing roadmaps."

**Claim:** Every supplier is an existing roadmap.

**Witness:** Layer 3 (`README.md:315–316`) consumes DerivedDeRhamCohomology §5.8. That is a new roadmap still in pull request #868 (merge-order line 23), not on main.

**Repair:** Write: "Reuse the foundations of SchemeAndStackFoundations, AlgebraicVectorBundles, DerivedModuleAlgebra and EnhancedDerivedSheaves (on main) and the scheme cotangent complex of DerivedDeRhamCohomology §5.8 (#868, a new roadmap earlier in the merge order)."

## Previous findings

- R01 — not repaired: `README.md:277–278` still reads "Build Vistoli's dimension-graded rational Chow groups for separated Deligne–Mumford stacks". It is R01 here.
- R02 — repaired: line 46 now reads "where `Hⁱ(E)=0` for `i>0` and `H⁰(E)` and `H⁻¹(E)` are coherent". Layer 6 (line 385) and `Suggested.lean:30` say the same.
- R03 — not repaired: Layer 9 (line 451) still reads "of relative Deligne–Mumford type", and `L_{X/Y}` is still built only up to DM stacks (line 315). It is R02 here.
- R04 — not repaired: line 453 still reads "When `Y` is smooth and pure of dimension `d`". It is R03 here.
- R05 — not repaired: line 416 still reads "construct a common dominating resolution". It is R04 here.
- R06 — partly repaired: Layer 7 (line 426) now reads "For a pure-dimensional local complete intersection", but end goal 4 (lines 57–58) is unchanged. It is R05 here.
- R07 — not repaired: all headings are unchanged. It is R08 here.
- R08 — not repaired: the only locators added are Stacks 07BF and 0GR1. It is R09 here.
- R09 — partly repaired: lines 145–146, 160–162, 168 and 171–173 are fixed. `Chow.pushforward`, the homes and §1.10 remain. It is R10 here.
- R10 — not repaired: `Suggested.lean:13–16`, 21–51 and 60 are unchanged except for the comment at line 30. It is R11 here.
- R11 — repaired: lines 96, 101 and 399–400 are now prose, and the gate reports `readme-ids-missing=0`.
- R12 — partly repaired: lines 135–136 and "executable" are gone. Lines 531–536 remain, and codimension is now an instruction with no layer. It is R12 here.
- R13 — repaired: line 114 now reads "`S₀ = 𝒪_X`, coherent `S₁`, and generated by `S₁`", matching BehrendFantechi1997 line 186.
- R14 — repaired at lines 125–126, 341, 429–430 and 517.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Obstruction theory with Condition (⋆) (lines 45–47, 385–388) | `E=⊕_ℕ O[1]`, `φ=0` on `Spec k`; `L_X` for `Spec k[x]/(x²)`, char ≠ 2 | `H⁻¹=k^(ℕ)` not coherent, so excluded; `H⁰=k`, `H⁻¹=(x³)/(x⁴)≅k`, so admitted | holds | none |
| Cone convention (lines 113–115) | `O_X×O_X` in degree 0; `Sym(⊕_ℕ O_X)`; `Sym(O_X²)` | `S₀=O²≠O_X` excluded; `S₁` not coherent, excluded; `𝔸²_X` admitted | holds | none |
| lci exactly when `𝔠_X` is a vector-bundle stack (lines 367–369) | `k[x]/(x²)⊂𝔸¹`; `k[x,y]/(x²,xy)⊂𝔸²` | `I/I²` free of rank 1, `𝔠=𝔑`; `I=x(x,y)` of linear type so `C=N`, but `I/I²` has rank 2 at 0, 1 on the axis, embedded point | holds; BF 3.12(3) fails | Source issues |
| Smooth-pullback cone sequence (lines 370–371) | `f : 𝔸¹ → Spec k` | `B T_{𝔸¹} → 𝔠_{𝔸¹}=B T_{𝔸¹} → f*𝔠_pt = 𝔸¹`; dimensions `0 = 1 + (−1)` | holds | R06 (notation) |
| The cone sequence fails for a general lci (lines 375–377) | `Y=V(xy,xz,yz)⊂𝔸³`, `X=V(x+y+z) ≅ Spec k[x,y]/(x,y)²` | `N_{X/Y}` rank 1; fibre cone `k[xy,xz,yz]` has dimension 3, so `dim f*𝔠_Y = 3−3 = 0`; exactness would force `dim 𝔠_X = 1 ≠ 0` | holds; BF 3.14 fails | Source issues |
| lci class `[X,L_X]vir=[X]` (line 426; end goal 4) | `Spec k[ε]/(ε²)`; `Spec k ⊔ 𝔸¹` | `n=0`, class `2[pt]`; ranks 0 and 1, excluded by Layer 7 but admitted by end goal 4 | Layer 7 holds | R05 |
| Degree in virtual dimension 0 (line 517) | `Spec ℂ` over `ℝ`; `Spec k[ε]/(ε²)` | `dim_ℝ Γ = 2 = 1·[ℂ:ℝ]`; `2 = 2·1` | holds | none |
| Lisse-étale site not functorial (lines 306–308) | `Spec 𝔽_p → Spec ℤ` (stacks-07BF line 2275); stacks-0GR1 line 1333 | `u^s` not left exact; the site is functorial for smooth morphisms only | holds | none |
| Pinned Chow pushforward (line 172) | names at the Tau Ceti pin | `Chow.ChowGroup.pushforward` at `Chow/ClosedImmersion.lean:211`; `Chow.pushforward` absent | wrong name | R10 |
| Scheme cotangent complex (lines 204, 315–316) | `X = Spec B` over `A` | DerivedDeRhamCohomology §5.8: `L_(X/A)` restricts to `L_(B/A)`; quasi-compact quasi-separated, Zariski site | supplier exists; no contract | R07 |
| Rational Chow groups of DM stacks (lines 277–280) | `BG`, `G=ℤ/2` | here (line 280): `1/|G| = 1/2`; VirtualFundamentalClasses line 201: `deg(BG/Spec k) = 1/2` | two owners | R01 |
| Relative class (lines 451–457) | `Spec k → B𝔾_m`, `E = L_{X/Y}` | `L_{X/Y}=k`, `d=−1`, class `[pt] ∈ A_{−1+1}`; no layer builds `L_{X/Y}` over a base that is not DM | unowned | R02 |
| Example 7.6 item (lines 476–480) | `V=W=𝔸²`, `X=Y=V(xy)` | BF: `[x-axis]+[y-axis] ∈ A₁`; README: no class, since `Y` is singular | inconsistent | R03 |
| Prop. 5.3 route (lines 416–417) | `ℙ¹`, `[O(−2) →0 O]` | `Ext¹(O,O(−2)) = H¹(O(−2)) ≅ k`; `id+ε` is not a chain map | gap | R04 |

The rows for statements the diff does not touch stand as in the previous review, of `8a54d41`.

- **Gate at `2f05f76`.** Every check is 0 and the result is `OK`; the worker's run adds `build=0`. The dependency check reports `depcheck: 236 roadmaps, 2138 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean TauCetiRoadmap/VirtualFundamentalClass/Suggested.lean` exits 0 with no output. The file declares nothing, so the `#check` comparison and the one-tactic padding probe have nothing to test.
- **Source locators checked against the text (6).**
  - BehrendFantechi1997: line 186 (cones), lines 1010–1023 (Prop. 3.12), lines 1040–1064 (Prop. 3.14), and line 1456 (Prop. 5.10 uses Prop. 3.14 only for smooth `v`).
  - stacks-07BF line 2253 and stacks-0GR1 line 1333.
- **Library declarations opened at the pins (5).**
  - `SchPseudofunctor` (`Stack/Basic.lean:37`)
  - `Spaces.IsAlgebraicSpace` (`AlgebraicSpace/Basic.lean:195`)
  - `Chow.ChowGroup` (`Chow/Basic.lean:295`)
  - `Chow.ChowGroup.pushforward` (`Chow/ClosedImmersion.lean:211`)
  - `reesAlgebra` (`Mathlib/RingTheory/ReesAlgebra.lean:40`)
- **Cross-roadmap citations resolved (8).**
  - On main: SchemeAndStackFoundations §1.18 `StackInGroupoids`, §4.5 (obstruction theories of deformation functors) and §1.10; EnhancedDerivedSheaves §0.3 and E1.8 (`PerfectDerived`); DerivedModuleAlgebra §0.4.
  - At its head `2f774a9`: DerivedDeRhamCohomology §5.8.
  - At its head `64895ca`: StableReductionPartII `README.md:102`.
- **Ownership.** The overlaps file lists no open pull request that changes this roadmap and no dropped id. The board package VirtualFundamentalClasses is the only second owner found by object (R01).
- **Outside the folder.** The pull request changes nothing there.

## Not verifiable

- Vistoli 1989, Invent. Math. 97: paywalled (DOI only). Rational Chow and bivariant groups of DM stacks are not checked.
- Illusie, LNM 239 and 283: paywalled. III Cor. 3.1.3 and the converse of Stacks 08SL are not checked.
- Fulton, *Intersection Theory*, and Laumon–Moret-Bailly, *Champs algébriques*: commercial books with no open copy.
- Behrend–Fantechi, Invent. Math. 128: paywalled. Only arXiv v1 was read, so agreement of the published numbering is not checked.

## Source issues

- **Error** in BehrendFantechi1997 at Proposition 3.12, p. 30: the source lists equality of the intrinsic normal cone and the intrinsic normal sheaf as equivalent to being a local complete intersection, arguing that equal normal cone and normal sheaf force a regular immersion; it should list only "the intrinsic normal cone is a vector-bundle stack", since `k[x,y]/(x²,xy)` has equal cone and sheaf but is not a local complete intersection; affects a stated result.
- **Error** in BehrendFantechi1997 at Proposition 3.14, p. 31: the source says the cone sequence `𝔑_{X/Y} → 𝔠_X → f*𝔠_Y` is exact for every local complete intersection morphism; it should be restricted to smooth morphisms, since for `X = V(x+y+z)` in the coordinate axes of `𝔸³` exactness would force `dim 𝔠_X = 1`; affects a stated result.

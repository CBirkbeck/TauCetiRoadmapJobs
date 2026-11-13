# Repair report: PadicDifferentialEquationsAndRigidCohomologyPartII (package, round 6)

This round settles the single finding of `REV-PKG-PadicDifferentialEquationsAndRigidCohomologyPartII~5`. The finding is correct and is applied.

Files edited:
- `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md`.

Files not changed:
- `Suggested.lean`: it declares nothing, and no headline statement changed.
- `metadata.toml`.
- `sources.toml`: the TSU entry's locator already covers Lemma 3.17, Lemma 3.30 and Proposition 6.1 (`3.10-3.33`, `6.1-6.9`), and its `cited_for` already covers `MS.4.1-MS.4.8`.
- `design/plan.json`: no new supplier gap is needed. Every input of the repaired step is a target of this roadmap (MS.2.5, MS.2.9) or a section of the parent roadmap that exists (§§RD.1.36, RD.3.34, RD.3.37).

## F01 (P3) — applied

**Old → new.** The MS.4.2 route said "MS.2.4 fixes its maximal slope" of the image in `P`. The new route reads as follows:
- Let `Q ⊆ P` be the nonzero convergent image of `P_1(N)`. This image exists because the convergent F-isocrystals form an abelian category (§RD.3.34).
- MS.2.9 shows that `Q` is PBQ with `λmax(Q_η) = λmax(N)`.
- By §RD.1.36, `Q` is isoclinic of slope `slope(P)`.

In the Needs line, MS.2.4 is replaced by MS.2.9, and §§RD.1.36, RD.3.34 and RD.3.37 are added.

**Verification of the claim.**
- MS.2.4 is stated for overconvergent F-isocrystals only. The image of `P_1(N)` in the isoclinic convergent `P` is only a convergent quotient.
- The reviewer's witness reproduces. Take `C = U`, the ordinary Legendre locus, `N† = L†|_U`, and `P = Top(L|_U)`.
  - `N†` is irreducible (§RD.5.112), so `P_1(N†) = N†` by MS.2.5. It is saturated by MS.3.9, so the map on dagger sections into `P` is injective.
  - The image `Q` equals `P`, which has rank 1 and slope 1.
  - By the third Check of MS.2.7, `P` carries no overconvergent structure. So MS.2.4 cannot be applied to this instance, although the instance satisfies all the hypotheses of MS.4.2.
- The printed source has the same slip. TSU line 1352–1354 (proof of Proposition 6.1, p. 26) fixes the slope "by Lemma 3.30".
  - Lemma 3.30(2) (TSU line 1016–1017) assumes a surjection of overconvergent F-isocrystals.
  - The statement that applies is Lemma 3.17(2) (TSU line 869–870), for `φ-∇`-modules over `B`, applied to the generic modules. This is exactly what the API of MS.2.9 supplies for convergent quotients (README, MS.2.9, third API bullet).

**The repaired step, in full (README, MS.4.2 proof route).**
1. `N ≠ 0` because it surjects onto `P ≠ 0`.
2. `P_1(N†)` (MS.2.5) is nonzero. So its dagger sections over `U` are a nonzero submodule of `Γ(U, N†)`, and they inject into `Γ(U, P)`.
3. Its convergent realisation `P_1(N)` is the first step of the convergent PBQ filtration of `N` (MS.2.9, second API bullet; realisation by §RD.3.37). Step 2 shows that it has nonzero image `Q ⊆ P` (images by §RD.3.34).
4. `Q` is a nonzero convergent quotient of a convergent PBQ object. So `Q` is PBQ with `λmax(Q_η) = λmax(P_1(N)_η) = λmax(N)` (MS.2.9, third API bullet; MS.1.1 for `λmax(P_1) = λmax`).
5. `Q_η ⊆ P_η` with `P_η` isoclinic. The parent's §RD.1.36 states that isoclinic generic modules of one slope are closed under subquotients. So `λmax(Q_η) = slope(P)`.

I chose §RD.1.36 rather than Hom vanishing (§RD.1.37) for step 5. The Hom vanishing of §RD.1.37 is stated in one direction only (no maps from lower to higher slopes), so it does not exclude a piece of `Q` with a larger slope; §RD.1.36 settles both directions. §RD.1.37 stays in the Needs line for the proper-curve case ("slope separation").

**Other changes made for the same repair.**
- **New Check in MS.4.2.** The ordinary Legendre instance:
  - `P_1(N†) = N†` has rank 2 and maximal slope 1.
  - `Q = P` has rank 1 and slope 1, and is not overconvergent.
  - `λmax(N) = 1 = slope(P)` and `rank Top(N) = 1 = rank P`.
- **New entry in "Corrections to the sources".** For Tsuzuki, proof of Proposition 6.1, p. 26, slope step: the citation should be Lemma 3.17(2) on generic modules, not Lemma 3.30. The entry's Check is the Legendre slope-one top.
- **Supplier bullet for §§RD.3.33–RD.3.34.** It now also names "the convergent image in the curve rank theorem MS.4.2".
- **Layer MS.4 Dependencies.** It now says that MS.2.9 and its quotient statement are used in MS.4.1 and MS.4.2, and it adds §§RD.1.36 and RD.3.34.

**Pattern search.** Every other use of MS.2.4 was read. Each applies it to a quotient that really is overconvergent, so none changes:
- MS.2.6: `f^*f_*M† → M†`.
- MS.2.8: the Legendre–Kummer extension `M† → O(π_p²)`.
- MS.4.3: `M† → M†/L†`.
- MS.4.4: the overconvergent image of the sum map. This is the quotient of `M† ⊕ N†` by the dagger kernel, an overconvergent subobject by MS.3.8 and MS.3.9. MS.2.4 is also applied to that image modulo `M†`.
- MS.4.5: the given exact sequence.

The other "same maximal slope" quotient arguments are generic or local and already cite MS.0.10:
- MS.1.1;
- MS.3.3 (over `E` after the flat scalar extension);
- MS.4.1 (over `E_α`).

TSU's Theorem 6.4 proof (TSU line 1431–1432) uses Lemma 3.30(2) for the overconvergent quotient `L†/M†`. That use is correct, as in MS.4.4.

## Checks

- **Elaboration.** `lake env lean packages/PadicDifferentialEquationsAndRigidCohomologyPartII/Suggested.lean`, run from the content checkout, exited 0 with no output. No `TauCeti.*` module is imported, so no module build was needed.
- **Elaborated signatures.** `Suggested.lean` has zero declarations: one `import Mathlib`, the module docstring and an empty namespace. So the `#check @name` scratch inventory has 0 entries. No binder or hypothesis could be dropped, and nothing changed.
- **Dependency direction.** The prescribed command printed:

  ```text
  depcheck: 240 roadmaps, 2176 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line appeared.
- **Citations.** `roadmaps resolve` on the README returned no cross-roadmap citations found nowhere and no Lean names found nowhere. The new parent sections were each opened at the indexed head of PadicDifferentialEquationsAndRigidCohomology (via `roadmaps show`):
  - §RD.1.36: generic isoclinic modules are closed under subquotients.
  - §RD.3.34: "The category `F^a`-`Isoc(X/K)` is abelian".
  - §RD.3.37: an exact faithful restriction functor.
- **Gate failures.** None were listed for this round.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| MS.4.2 slope step: image `Q` of `P_1(N)` in `P` is PBQ with `λmax(Q_η) = λmax(N)` | Ordinary Legendre `N† = L†\|_U`, `P = Top(L\|_U)` | `P_1(N†) = N†` (rank 2, λmax 1); `Q = P` (rank 1, slope 1); overconvergent(Q) = false; `λmax(Q_η) = 1 = λmax(N)` | Holds through MS.2.9; MS.2.4 inapplicable here, as the finding says. Added as a Check |
| Same, with `P_1(N†) ≠ N†` | Legendre–Kummer `M†` of MS.2.8 on its ordinary locus, `P = Top(M\|_U)` | Generic slopes of `M`: (1,0,0); `P_1 = L†(χ)` (rank 2, λmax 1); `O(π_p²)` slope 0 maps to 0 in `P`; `Q = Top(L(χ)) = P` (rank 1, slope 1); `rank Top(M) = 1 = rank P` | Consistent; `M†` is saturated (MS.4.5, third case, nonsplit), so the hypothesis holds |
| Same, trivial cases | Unit `O → O`; `O(−1) → O(−1)` | `Q = P`; `0 = 0` and `1 = 1`, ranks `1 = 1` | Consistent |
| Same, negative control | `O(−1) ⊕ O(0) → O(0)` | `P_1 = O(−1)` maps to 0 (the projection kills it); kernel on dagger sections is `Γ(O(−1)) ≠ 0` | Hypothesis fails, and the route correctly cannot start (existing Check) |
| Same, degenerate | `P = 0` | Excluded by `P ≠ 0`; with `P ≠ 0`, `N ≠ 0`, `P_1(N†) ≠ 0` | Nonvanishing of `Q` uses injectivity on nonzero sections |
| Sub of isoclinic is isoclinic of the same slope (§RD.1.36) | `P_η = E_η²` (slope 0), `Q` the diagonal; non-isoclinic `L_1 ⊕ L_0` with sub `L_0` | Diagonal slope `0 = 0`; for the non-isoclinic ambient the sub has slope `0 ≠ 1 = λmax` | Isoclinicity of `P` is needed and is a hypothesis of MS.4.2 |
| Direction of the slope fact | Hom vanishing as stated in §RD.1.37 (lower to higher only) | A sub-piece of slope `λ > s` inside slope-`s` `P` is not excluded by that one-sided statement; §RD.1.36's subquotient closure (via Dieudonné–Manin, §RD.1.32) excludes both `λ < s` and `λ > s` | Cite §RD.1.36 |
| MS.2.9 quotient API used | `P_1(N) → Q` (Legendre); `L_1 ⊕ L_0 → L_0` | Legendre: max `1 → 1`. Split: source not PBQ, max `1 → 0` | PBQ hypothesis on the source is needed; it holds for `P_1(N)` |
| Abelian convergent category (§RD.3.34) | Image of `P_1(N) → P` | Legendre image is `P`, locally free of rank 1 | Image exists in the category; no overconvergence is claimed |
| New Check numerics against other Checks | MS.2.7 third Check, MS.2.9 third Check, MS.4.1 first Check | `B_U(L) = Top(L\|_U)` has slope 1 and is not overconvergent; kernel `H` has rank 1 and slope 0; `rank N = 2 = rank H + rank P = 1 + 1`; `rank Top(N) = rank P = 1` | All agree |
| Correction entry (TSU Prop. 6.1 proof) | TSU line 1354 vs line 1016–1017 and line 869–870 | 3.30(2) needs an overconvergent surjection; 3.17(2) needs a surjection over `B`; the Legendre image is not overconvergent | Entry is accurate |
| Generality | Statement of MS.4.2 | Unchanged: any perfect `k`, any characteristic-zero discretely valued `K`, all `p`. The Legendre Check needs odd `p` (the Legendre family) | No narrowing; the Check is an instance only |

## Ownership and overlaps

The repair introduces no new object, construction or target. It reroutes one proof step through MS.2.9, which this roadmap already owns, and through three existing parent sections. So no ownership question arises.

The overlap report lists:
- no open pull request that changes this roadmap;
- no dropped id that this roadmap cites;
- no revision-only id.

No id of this roadmap was renamed or removed.

## For the maintainer

- No Lean name, target number or section heading changed. Other roadmaps citing MS.4.2 are unaffected.
- The review's "Source issues" section lists four more source misprints. They are not findings:
  - TSU Theorem 3.19(1) and DAD Lemma 4.1.4 are already in "Corrections to the sources".
  - The TSU Proposition 6.1 slip now has its own entry.
  - OHK Corollary 5.12 is not cited anywhere in the README, so it needs no entry.
- No source was fetched, and `needs-references.toml` was not written.
- The review text contained no instruction-like passage.

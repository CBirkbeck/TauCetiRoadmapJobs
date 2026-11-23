# Review of FormalLaurentPuiseux (pull request #2558 at f823055)

**Verdict:** accepted

**Summary.** Accepted: no finding. The four small corrections of the previous review are repaired, in the README (the Check of §2.3, the locator of §5.2) and in the description, and the repairs are correct; the description was read against this head and the base and agrees with both. Two format notes are carried, neither blocking; four facts are left for the human reviewers.

## N01 — The targets not yet realised still carry no source locator

The no-limit statement of §1.2, the Hasse–Leibniz rule of §2.1, the three targets of §3.5, the two of §3.6, the fixed fields of §6.1 and the three targets of §7.3 have a route but no locator. Carried from the previous review.

## N02 — The splitting sentence of §5.2 can be read with the wrong subject

"… a monic polynomial over `K[[t]]` whose reduction splits, has degree invertible in `K`, has zero coefficient in degree one below the top and is not a power of `Y` factors …" (lines 728–730) is true when the conditions are read of the reduction; read of the polynomial, `Y² − t` would contradict it. Would "whose reduction splits, has zero coefficient one below the top and is not `Y^m`, and whose degree `m` is invertible in `K`" be acceptable? Carried from the previous review.

## Previous findings

The previous review (of `32d88de`) had no finding; its small corrections and format notes are accounted for here.

- C01 — repaired: "a `K`-derivation `δ` of `F` vanishing on `K(t)` with `δ(g) = 1`: it exists because, for a transcendence basis `B` of `F` over `K(t)` containing `g`, the derivation `∂/∂g` of `K(t)(B)` extends to `F`" (§2.3, lines 367–373).
- C02 — repaired: "(existence: Mannaa–Coquand, Lemma 1.7, pp. 4–5; the uniqueness of the factors follows from that of each correction)" (§5.2, lines 725–727).
- C03 — repaired: the description now reads "the new statement that `t^(−j)` has no limit in `F` (§1.2); and, written out as explicit targets, the items of main that the pinned Tau Ceti does not yet realise".
- C04 — repaired: the description has a bullet for the bracket formula, antisymmetry and residue duality over a commutative ring `R`, the lattice topology of `V((t))` for every `V`, and the polygons of §5.1 over `R((t))`.
- N01 — not repaired: the targets written with "Prove" still have no locator; carried as N01 (a format note).
- N02 — not repaired: the sentence of §5.2 is unchanged; carried as N02 (a format note).

<details><summary>What was checked</summary>

Incremental re-review of 16 changed lines since `32d88de`: the second Check of §2.3 and the locator sentence of §5.2, with what they cite (the Check of §2.2, Mannaa–Coquand Lemma 1.7, the two pinned Hensel declarations). The automatic checks all pass on this head. `Suggested.lean` is unchanged and elaborates with no error and no warning; it declares nothing, so there is no signature to compare and nothing for the one-tactic probe. The supplier-order check, which requires every roadmap this one consumes to be on main or earlier in the merge order, reports 133 roadmaps, 1474 edges and no problem: no upward supplier and no cycle. No file outside the folder changes; no layer is added, removed or reordered.

The description was read sentence by sentence against the head and the README at the merge base: it says that the pull request revises a roadmap on main, that L1–L7 keep ids, subjects and anchors, which statements changed in content, and that `Suggested.lean` now pins declarations by `#check` and restates none (the 38 removed prototypes). The items it lists as main's unrealised targets are each in the base README (for example the Hasse–Leibniz rule, the transport to `AlgebraicClosure F`, "the whole absolute Galois group is inertia") and each is written with "Prove" at the head. No sentence is contradicted and no change a reader needs is left out.

Not verifiable: Dean Cureton's repository and the Zulip thread were not opened. No automatic check was set aside.

</details>

## Verified sound

| Statement | Instances tried | Computed values (README side) | Library or source side | Result |
|---|---|---|---|---|
| §2.3 Check: `Ω[F⁄K] → Ω¹_cont(F/K)` not injective in characteristic zero | `g = exp t`, `δ = ∂/∂g` extended | induced map on `dg − Dg·dt`: `δ(g) − Dg·δ(t) = 1 − exp t · 0 = 1 ≠ 0`; `λ`: `Dg − Dg·1 = 0` | `F` algebraic over `K(t)(B)`, separable in characteristic 0, so `∂/∂g` extends uniquely; §2.2 Check gives non-continuity | sound |
| §5.2 coprime-factor Hensel lifting, existence and uniqueness | `Y² − (1 + t)` over `ℚ` and over `ℤ/9`; `g = Y − 1`, `h = Y + 1`, `k = 1` | `(Y−1)H₁ + (Y+1)G₁ = −1`: `G₁ = −1/2`, `H₁ = 1/2` (in `ℤ/9`: `4`, `5`; `9Y − 1 = −1`); unique of degree `< 1` | MannaaCoquand2013 lines 132–165: existence only, over a ring `R`, pp. 4–5; line 166 disclaims uniqueness; pinned `eq_and_eq_of_mul_eq_mul_of_isCoprime` over `CommRing` | sound |

The rows for the untouched statements stand as in the previous review, of `32d88de`.

- Source locators checked against the text: 1 (MannaaCoquand2013 Lemma 1.7, lines 132–167; statement on p. 4, proof on p. 5).
- Library declarations: the pinned types printed by the `#check` lines of `Suggested.lean` elaborated again; the two Hensel declarations as read in the previous review.
- Cross-roadmap citations: none in the changed passages; the changed Check cites §2.2 of this README, whose Check (lines 332–334) supplies the transcendence of `F` over `K(t)`.
- Supplier-order check: `depcheck: 133 roadmaps, 1474 edges, 0 problem(s)`. Automatic checks: all passed.
- Elaboration: no error, no warning; no declaration, so no `#check @name` comparison and no padding probe.
- Description: every paragraph compared with the head and the merge base; 0 sentences contradicted.
- Change outside the folder: none.

Overlap check: read NewtonPolygons (main, and its open revision), AffineLieAlgebras and RamificationOfCompleteDiscretelyValuedFields (main), as in the previous review; the change touches no shared object. NewtonPolygons owns the general polygon geometry and this roadmap its Laurent specialization, Hensel lifting and Newton–Puiseux; the formal loop algebra is owned here and consumed by AffineLieAlgebras; nothing has two owners.

Source independence: changed passages only; 2 passages compared with 1 source (MannaaCoquand2013 lines 139–167), none shared; largest share FrenkelLoop, 10 of 14 locators; contents not compared again (no layer added, removed or reordered; independent in the previous review).

Research link: L1–L3 and L7 are the formal-disc calculus (coordinate changes, the residue cocycle, `Gal(ℂ((t))) ≅ ℤ̂`) that Frenkel (2007) uses for local Langlands for loop groups (§§1.2.1, 1.3.5, 3.5); L5 is the Newton–Puiseux theorem as in Mannaa–Coquand (2013). Rests on the README's References and both texts read.

## Not verifiable

- Dean Cureton's Puiseux repository: not opened, so the name `PuiseuxSeries.isAlgClosure` and its licence were not checked.
- The Zulip discussion cited in the References: not opened.

## Source issues

- **Error** in MannaaCoquand2013 at Lemma 1.7, remark after the proof, p. 5 (line 166): the source says uniqueness of the two factors may fail when the base ring is not a domain; it should be that monic factors with the given coprime reductions are unique over every commutative ring; affects nothing.
- **Misprint** in MannaaCoquand2013 at Lemma 1.7, proof, p. 5 (line 146): the source bounds the degree of the second family of corrections by naming `G_ℓ` again; it should be `H_ℓ`, of degree less than `s`; affects nothing.

## For the human reviewers

- The pinned Tau Ceti is `2fd255d`. The folder's generated `PROGRESS.md` reports later work (to `385ec2d`), for example completeness of `V((t))`, which the README still writes as a target; at the pin that is correct.
- `Suggested.lean` declares nothing: every headline theorem is proved in the pinned Tau Ceti, and the file pins declarations with `#check`.
- FrenkelLoop was read from the author's page at the URL in the References; its page numbers are those of that copy.
- Dean Cureton's repository (named in the README's scope and References) was not opened; its licence, should code be ported, is not checked here.

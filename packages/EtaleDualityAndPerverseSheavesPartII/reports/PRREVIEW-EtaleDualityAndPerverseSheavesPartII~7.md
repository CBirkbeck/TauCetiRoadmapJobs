# Review of EtaleDualityAndPerverseSheavesPartII (pull request #1743 at f7e0d6b)

**Verdict:** needs changes

This is an incremental re-review of the 6 lines changed since c83a1a6. The gate passes, and the dependency check reports 0 problems.

- **R01 (P2):** only partly repaired. This folder now claims local Lefschetz, but the head of PurityForFlatCohomology's pull request still owns the same statements and hands them back to this roadmap. That head was committed three hours after this one. The remaining edit is in that pull request; this folder needs no further change for it.
- **R02 (P3):** new and minor. It is a page locator in §5.7, which the new Scope sentence cites.

## R01 (P2) — Local Lefschetz and its local-duality inputs still have two owners

**Location:**
- `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md:23`: "PurityForFlatCohomology takes the local Lefschetz theorem from §7.3 for the hypersurface step of its bound of the étale depth by the virtual dimension, and owns none of these statements."
- `README.md:1570`: "PurityForFlatCohomology §1.6 consumes local Lefschetz (§7.3)".

**Claim:** This roadmap owns §§5.6–5.7, 7.1, 6.3, 6.9, 6.11, 6.12 and 7.3. PurityForFlatCohomology owns none of them and consumes §7.3.

**Witness:** At PurityForFlatCohomology's pull request #1840, head 1de6822 (2026-11-07 15:33, after this head's 12:45):
- `TauCetiRoadmap/PurityForFlatCohomology/README.md:162–163` still reads "local étale duality statements and the local Lefschetz theorem (§§1.4–1.5): to be imported by EtaleDualityAndPerverseSheavesPartII".
- `:2508–2509` repeats this.
- §1.6 cites its own §1.5 (`:857`, `:859`).

**The duplicated statements at that head:**

| PurityForFlatCohomology (#1840) | Here | Comparison |
| --- | --- | --- |
| §1.5 (`:825–828`) | §7.3 (`:1406`) | Same quantifiers: R regular local, not assumed excellent; f ∈ 𝔪; ℓ invertible; bijective for i < dim R − 1, injective at dim R − 1. Same locator, CS24 Lemma 3.2.3. |
| §1.4(a) (`:797–799`) | §7.1 (`:1374`) | Same statement, a case of §5.7: R strictly henselian excellent regular local, `H^i(Spec R[1/f], ℤ/ℓ) = 0` for i > d. |
| §1.4(b) | §6.11; §6.10's regular clause | §6.11 covers strictly henselian R. §6.10's regular clause, twisted by the invertible Λ(d)[2d], covers any excellent regular local R. |
| §1.4(c) | §6.12 | §6.12 is the case K = Λ(d)[2d]. |

**Repair:**

*In this folder:* no further edit. The Scope sentence, the §7.3 Check and the consumer line are correct once the other head changes. Accept on the re-review after that head drops §§1.4–1.5.

*In PurityForFlatCohomology's pull request (same author):*
1. Delete §§1.4–1.5, the bullet at `:162–163`, the bullet at `:2508–2509` and the local-duality and local-Lefschetz clause of the Scope's owned list at `:63–64`.
2. Add a `From TauCetiRoadmap.EtaleDualityAndPerverseSheavesPartII` contract citing:
   - §7.1, for §1.4(a);
   - §6.11 and §6.10's regular clause, for §1.4(b);
   - §6.12, for §1.4(c);
   - §7.3, for §1.5.
3. In §1.6 (`:857`, `:859`), replace "§1.5" by "EtaleDualityAndPerverseSheavesPartII §7.3".

Its dependency check then moves it after this roadmap, which is at merge-order line 385.

**Checked:**
- The move is unobstructed. `roadmaps grep PurityForFlatCohomology` finds it cited only by this roadmap and by GroupSchemesOverABase. GroupSchemesOverABase is its supplier and is not in the merge order, so nothing at merge-order lines 221–385 consumes it. This roadmap cites it as no supplier.
- On every instance, both sides give the same values (adversarial table), so nothing is lost.
- The opposite assignment does not work. §1.4(a)'s *Needs* there (`:808–810`) are §F.5, absolute purity, excellence and affine proper base change. None of these gives affine Lefschetz, whose proof here is Layers 0–5.

## R02 (P3) — §5.7 cites two corollaries on different pages as "p. 220"

**Location:** `README.md:984`: "(ILO14, Exposé XV, Corollaire 1.2.2 and Corollaire 1.2.4, p. 220 (printed); Exposé 0, Corollaire 8, p. 5; ILO14 line 10350)".

**Claim:** Both corollaries are on printed p. 220.

**Witness:**
- Corollaire 1.2.2 is at ILO14 line 10350, before the page footer "219" at line 10359.
- Corollaire 1.2.4 is at line 10362, after the header "220" at line 10361.

**Repair:** Replace "p. 220 (printed)" by "pp. 219–220 (printed)".

**Checked:**
- Line 10350, which the README cites, is Corollaire 1.2.2 on p. 219, and Corollaire 1.2.4 is on p. 220.
- Exposé 0, Corollaire 8 is at line 396 on printed p. 5 and stays as written.

## Previous findings

- R01 — partly repaired: `README.md:23` now reads "This roadmap owns Gabber's affine Lefschetz theorem (§§5.6–5.7) … and the local Lefschetz theorem (§7.3) … owns none of these statements". PurityForFlatCohomology's head 1de6822 still owns §§1.4–1.5. Re-raised as R01.
- R02 — repaired: `README.md:1570` now reads "PurityForFlatCohomology §1.6 consumes local Lefschetz (§7.3) for its bound of the étale depth by the virtual dimension (CS24 Theorem 3.2.4)". "PF.1" occurs 0 times in the folder. §1.6 exists at that head (`:847`).

## Verified sound

**Scope of this re-review.**
- I read the three changed passages in full: Scope `:23`, the §7.3 Check `:1418` and Downstream consumers `:1570`.
- I also read every section they name: §§5.6–5.7 (`:956–996`), §6.3 (`:1116–1120`), §§6.9–6.12 (`:1290–1356`), Layer 7 in full (`:1368–1428`) and the *Needs* lines the Scope's dependency sentence summarises (`:966`, `:1298`).
- The diff touches no file outside the folder; `git diff --stat origin/main...HEAD` outside the folder lists 0 paths. `Suggested.lean` is unchanged since c83a1a6 (0-line diff).

**Gate.** I ran the gate on this head: every scanner is 0, the result is `OK` and the exit code is 0. The worker's gate also reports `build=0`. The required dependency check, complete output:

```text
depcheck: 239 roadmaps, 2427 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. The diff adds no supplier edge; its only cross-roadmap references are to a consumer and to LefschetzPencilsAndVanishingCycles §0.10, which is already a supplier.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/Suggested.lean` takes 13 s and exits 0. The only warnings are six "declaration uses `sorry`" (lines 65, 88, 181, 225, 262, 280). The file is unchanged, so the `#check @name` comparison of all 9 declarations from the previous report stands: 0 dropped binders, and `scratch/signatures.md` agrees. The module docstring still names local Lefschetz as not statable, because local étale cohomology with supports is missing at the pins.

**Sources checked at this head.** ILO14 is the arXiv v1 text; its file page is the printed page + 6. CS24 is arXiv v3, whose printed page equals its file page.

| Target | Text read | Outcome |
| --- | --- | --- |
| §7.3 Check: CS24 Theorem 3.2.4 | CS24 line 1381, p. 33: noetherian local R, commutative finite étale G of invertible order, `H^i_𝔪(R, G) = 0` for i < vdim R | Locator, page and statement agree. |
| §7.3 Check: first step of the proof | CS24 line 1387, p. 34: Theorem 3.1.3 and Lemma 3.2.3 settle hypersurfaces | Agrees. |
| §7.3, §§7.1–7.2, §6.11 | CS24 lines 1356–1380: Lemma 3.2.3 with (3.2.3.1), (3.2.3.2), the dualizing complex `(μ_ℓ^{⊗d})[2d]`, `Rj_* ∘ D ≅ D ∘ j_!` and local duality | Agrees. |
| §5.6 (cited by the new Scope) | ILO14 line 10333, Théorème 1.1.2, printed p. 219 | The range pp. 219–224 holds. |
| §5.7 (sample) | ILO14 lines 10350 (1.2.2, p. 219), 10362 (1.2.4, p. 220), 396 (Exposé 0, Corollaire 8, p. 5) | Hypotheses (strictly local or henselian, quasi-excellent, U affine, n invertible) and conclusions agree. The page slip is R02. |
| §6.3 (sample) | ILO14 lines 12669 (2.4.1.1, p. 265: noetherian regular excellent ℤ[1/n]-scheme, −codim, pin = inverse Gysin map) and 12835 (2.4.4.1, p. 267) | Agrees. |
| §6.11 (sample) | ILO14 line 12220 (XVII Théorème 0.9, printed p. 257: noetherian excellent ℤ[1/n] with a dimension function; Λ dualizing if regular); CS24 line 1367 | Agrees. |
| Layers 0–1 named by the Scope's dependency sentence | ILO14 line 1414 (II 3.2.1, p. 29), 1958 (III 5.1, p. 41), 2890 (V 2.1.2, p. 64), 2957 (V 3.1.1, p. 66) | The §§0.3, 0.5, 1.6 and 1.7 locators hold. |

**Cross-roadmap citations resolved this round.**
- PurityForFlatCohomology at #1840 head 1de6822 (local checkout):
  - §1.4 at `:793` and §1.5 at `:825`;
  - §1.6 at `:847`, "The étale depth is at least the virtual dimension", with *Needs* "§§0.2, 1.1, 1.5; LefschetzPencilsAndVanishingCycles §0.10" (`:859`);
  - ownership bullets at `:162–163` and `:2508–2509`.
- LefschetzPencilsAndVanishingCycles §0.10 at the head of its pull request (`roadmaps show`, `:701–713`): pointwise purity `Λ(−d)[−2d] → i_x^!Λ` at regular local points. This gives the vanishing below 2d that the new Check uses, for any regular local ring, through the local-to-global sequence.
- The Scope's dependency claims match the *Needs* lines they summarise:
  - §5.6 *Needs* (`:966`) lists §0.5 (approximation), §0.3, §2.4 (uniformization hypercovers), §3.6 (oriented hyper-base-change) and §§5.3–5.5;
  - §6.9 *Needs* (`:1298`) lists §§1.6–1.7 (partial algebraization) and §4.2 (finiteness);
  - §7.1's route is "Apply §5.7 directly" (`:1378`).

**Ownership against open work.** I searched main and the 472 open roadmap pull requests with `roadmaps grep`, using the tool's index:
- "affine Lefschetz" hits this roadmap, PurityForFlatCohomology (R01) and RiemannianGeometry. RiemannianGeometry's hit is the Andreotti–Frankel theorem for complex manifolds, a different object.
- "local Lefschetz" hits this roadmap, PurityForFlatCohomology, LocalPurity §1.4 on main (the SGA 2 extension theorem for finite étale covers, a different object) and DeformationAndDerivedPatchingAlgebra `localCI_parafactorial` (Picard groups, a different object).
- "Local étale duality" hits only PurityForFlatCohomology, and "normalised/normalized dualizing complex" has no hit.

`scratch/overlaps.md` lists no dropped ids and no other pull request that changes this roadmap.

**Adversarial table.** It has computed rows for every changed statement, for the sampled targets that fall in the changed passages, and for both findings. Throughout, Λ = ℤ/ℓ or ℤ/n with n invertible, and grading is cohomological.

| Statement | Instances tried | Values on each side | Result / change |
| --- | --- | --- | --- |
| Scope `:23`: list of owned sections | each section against its own statement | §5.6: quasi-excellent X, f affine of finite type. §5.7: strictly local quasi-excellent X, `H^q(U) = 0` for q > d. §7.1: strictly henselian excellent regular local ring. §6.3: regular excellent ring, δ = −codim. §6.9: noetherian excellent ring with δ. §6.11: strictly henselian excellent regular local ring. §6.12: strictly local excellent scheme. §7.3: regular local ring, excellence not assumed. | Each description matches its section. |
| Scope `:23`: "owns none of these statements" | PurityForFlatCohomology head 1de6822 | `:162–163` owns §§1.4–1.5 | False at that head (R01). |
| §7.3 against PurityForFlatCohomology §1.5 | DVR with f = π; k⟦x,y⟧ with f = x; f = 0; d = 0 | **DVR:** degree 0 is `0 → ℤ/ℓ`, injective and not onto, on both sides. **k⟦x,y⟧:** degrees 0 and 1 are `0 → 0`; degree 2 is `0 → ℤ/ℓ(−1)`, the same on both sides. **f = 0:** the identity. **d = 0:** f must be 0. PurityForFlatCohomology's unit-f Check lies outside f ∈ 𝔪 here. | Same values; duplicate (R01). |
| New §7.3 Check (`:1418`) | R̃ = k⟦x,y⟧ with f = x; R̃ a DVR with f = π; R̃ = k⟦x,y,z⟧ with f = z; f = 0; R = k⟦x,y⟧/(xy) | **k⟦x,y⟧, f = x:** `H⁰_𝔪(k⟦y⟧) = ker(ℤ/ℓ → ℤ/ℓ) = 0`, as claimed. `H¹_𝔪(k⟦y⟧) = coker(id) = 0`, so degree 1 = d − 1 is `0 → 0`, consistent with injectivity. `H²_𝔪(k⟦y⟧) = H¹(k((y)), ℤ/ℓ) = Hom(ℤ/ℓ(1), ℤ/ℓ) = ℤ/ℓ(−1)`, while `H²_𝔪(k⟦x,y⟧) = 0` (purity puts it in degree 4), so the degree-2 map is not onto, as claimed. **DVR:** R̃/(π) = k and "vanishing below 0" is empty. **k⟦x,y,z⟧/(z) = k⟦x,y⟧:** the Check gives vanishing below 2 and purity gives below 4, which is consistent. **f = 0:** dim R̃/(0) = d ≠ d − 1, and the Check restricts the dimension identification to f ≠ 0. For every f ≠ 0, vdim(R̃/(f)) = d − 1, including f ∉ 𝔪², where R̃/(f) is regular. **xy = 0:** vdim = 1 gives `H⁰_𝔪 = ker(ℤ/ℓ → (ℤ/ℓ)²) = 0`, and `H¹_𝔪 = ℤ/ℓ ≠ 0` (two branches), so the bound is sharp. | Correct. "Cannot be extended to degree d" is exactly what the instance shows; the DVR Check covers degree d − 1. |
| §7.3 Check locators | CS24 lines 1381 and 1387 | Theorem 3.2.4 on p. 33; the hypersurface step on p. 34 | Correct. |
| Downstream consumers (`:1570`) | PurityForFlatCohomology §1.6 at its head | "étale depth ≥ vdim", CS24 Theorem 3.2.4; it combines LefschetzPencilsAndVanishingCycles §0.10 with local Lefschetz | The locator is correct (previous R02). At that head it uses its own §1.5 (R01). |
| §5.7 (sample) | strict trait with U = η; henselian DVR over 𝔽_q; a strictly local artinian X | **Strict trait:** `H^q(η) = 0` for q > 1, since tame inertia has cd_ℓ = 1. **DVR over 𝔽_q:** cd_ℓ(K) = 2 = 1 + cd_ℓ(𝔽_q). **Artinian:** U ∈ {∅, X} and `H^q(X) = 0` for q > 0. | Statement correct; the page is R02. |
| §6.3 (sample) | c = 0; strict trait (c = 1) | **c = 0:** the pin is the identity. **c = 1:** `H²_s(Λ(1)) ≅ Λ` by the Kummer boundary of π, and cl_(uπ) = cl_π. | Correct; locators hold. |
| §6.11 (sample) | d = 0, 1, 2 | **d = 0:** K = Λ. **d = 1:** K = Λ(1)[2]. **d = 2:** `RΓ_x(Λ(2)[4]) = Λ(−2)[−4] ⊗ Λ(2)[4] = Λ` in degree 0, while the unshifted Λ has closed support in degree 4. | Correct. |
| 0.1–0.8, 1.1–1.7, 2.1–2.4, 3.1–3.6, 4.1–4.2, 5.1–5.6, 5.8, 6.1–6.2, 6.4–6.10, 6.12, 7.1–7.2, 8.1–8.6, and the 9 Lean declarations | as in the reviews at c83a1a6, ffdd816, d6c3ae4, f7fc49c and 047baea | values recorded there | Textually unchanged; carried forward. |

**Declared gaps.** The diff leaves the five gap slugs and their contracts untouched, so the previous checks stand. It declares no new gap.

## Not verifiable

- **Ill03** and **Epp73** remain settled as uncertified. The diff does not touch them.
- The published Astérisque pages of the ILO14 locators were not compared. The README states arXiv v1 page numbers and, for XVII Théorème 0.9, the published numbering.

## Source issues

- **Misprint** in ILO14 at Exposé XVII, Théorème 0.9, p. 257 (printed, arXiv v1; ILO14 line 12233): the bullet on flat morphisms with geometrically regular fibres writes the exceptional inverse image of K. It should be the ordinary pullback f^*K, as Proposition 4.1.1 states (ILO14 line 13520). Affects nothing: README §6.10 states f^*K.

# Review of StableHomotopyKTheory (pull request #1227 at 23a1323)

**Verdict:** accepted

This incremental re-review covers the 49 lines changed since 6ebf6e2, all of them in `README.md`. `Suggested.lean` and `metadata.toml` are unchanged. The one previous finding is repaired, and the repair introduced no new problem. The changed passages contain no defect. The gate passes.

## Previous findings

- R01 — repaired: `README.md:60` (Conventions) now reads "the shift is the index shift `(xₙ) ↦ (φₙ(xₙ₊₁))` … the difference map is `δ = 1 − shift` … Tau Ceti's declaration for δ is named `TauCeti.ModuleTower.shift`; for towers, the word shift alone always means the index shift, never δ."

## Verified sound

**Scope and repository state.**

- `git diff --stat origin/main...HEAD` outside the roadmap folder is empty. So is the change since 6ebf6e2 outside the folder.
- The change since 6ebf6e2 touches only `README.md`: 26 insertions and 23 deletions in 25 hunks. No heading changed, so no section number moved.
- I read every hunk. They fall in:
  - Conventions (line 60, new);
  - `From Tau Ceti` (line 76);
  - the G3.4 bullet (line 99);
  - §§1.3, 1.5, 1.26, 1.29, 2.5, 2.11, 2.34, 3.18 (two hunks), 3.19, 3.21, 3.25, 3.26, 4.8, 4.11, 4.15, 4.24, 6.2 and 7.29;
  - §7.9 (new Check, line 2470);
  - §7.10 (lines 2478 and 2486).

**R01 repair, checked passage by passage.** Each of the following reads correctly at this head:

- Line 76 defines `δ = 1 − shift` "of the Conventions, which Tau Ceti names `TauCeti.ModuleTower.shift`". The Milnor hypothesis for complexes is now "whose difference map δ is surjective in every degree".
- Line 99: "Section 7.9 identifies the map that 1−shift induces on πₖ with δ".
- Line 101: G3.10's "coker(1−shift)".
- §3.18 (line 1215): "the cokernel `TauCeti.ModuleTower.limOne` of δ(x)ₙ=xₙ−pₙ(xₙ₊₁)".
- §3.18 proof (line 1226): "(shift,id)", the index shift on ∏Xₙ.
- §4.11 (line 1615): "of δ(x)ᵢ=xᵢ−rᵢxᵢ₊₁, which is G3.10's coker(1−shift)".
- §7.9 (line 2461) and the Layer 7 Examples (line 2824).

A grep for `1−shift`, `1 − shift`, `coker(1`, `1−δ` and "shift map" finds no remaining use of "shift" for δ. Three other uses are not tower index shifts, and none conflicts with the convention:

- "Loop shift" (§§2.4–2.5) is the loop-space identification.
- The filtered-object τ of §7.29 (line 2715) is the transition map, the same direction as the index shift, never δ.
- "The shift [1]" (line 2735) is the triangulated shift.

**Gate, elaboration, dependencies.**

- My gate rerun printed `gate StableHomotopyKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` and exited 0. The worker's gate on this head also reports `build=0`.
- `lake env lean` on `TauCetiRoadmap/StableHomotopyKTheory/Suggested.lean` exited 0. It printed exactly 11 `declaration uses 'sorry'` warnings, at lines 84, 93, 111, 166, 175, 182, 192, 203, 221, 238 and 268, and nothing else.
- The dependency check printed:

```text
depcheck: 236 roadmaps, 2268 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or `moved:` line. The only roadmap the changed text newly cites is GeneralizedCohomology, which is on main.
- Signatures: there are 24 declarations, unchanged since 6ebf6e2. The four "looks dropped" leads are the same false positives as in [r7]:
  - `quillenTheoremA`, `quillenTheoremB` and `quillenTheoremB_structuredArrow` carry their `[Category]` binders as `inst`/`inst_1` in the elaborated types.
  - `continuousFunctions_projective_free` mentions no category.

**Cross-roadmap citations the changed text makes, resolved on main (1bea835).** The Conventions say that "shift" means the index shift "as in GeneralizedCohomology G3.4, G3.8 and G3.10". That holds:

| Item | Location in `TauCetiRoadmap/GeneralizedCohomology/README.md` | What it says |
| --- | --- | --- |
| G3.4 | item at 717 | "1−shift" is `(a_i)↦(a_i−f_i*a_(i+1))` (lines 723, 734–735) |
| G3.8 | item at 785 | the derived fibre of 1−shift has r-th coordinate `pr_r−f_r pr_(r+1)` (lines 787–788) |
| G3.10 | item at 913 | the abelian orbit set is identified with "coker(1−shift)" (line 929) |

**Library declarations opened at the pins** (Tau Ceti 2fd255d9, under `TauCeti/Algebra/Category/ModuleCat/Tower/` unless another path is given; 9 declarations and the Milnor binder `hC`):

| Declaration | File:line | Agrees with the changed text |
| --- | --- | --- |
| `TauCeti.ModuleTower.shift` | `Basic.lean:160` | Its docstring calls it "the shift map δ", with body `id − pi (transition n ∘ proj (n+1))`, so it is δ, not the index shift. This matches line 60. |
| `.lim`, `.limOne` | `Basic.lean:170`, `174` | `ker shift` and `Product ⧸ range shift`, i.e. ker δ and coker δ |
| `.groupTowerLimOneEquiv` | `GroupTower.lean:56` | `F.toGroupTower.limOne ≃ F.limOne`, the cokernel of δ (lines 76, 1215, 1615) |
| Milnor hypothesis `hC` | `Milnor/Basic.lean:304`, `435` | `∀ i, Surjective (C.term i).shift`, i.e. δ is surjective (line 76) |
| `.multiplicationTower` | `ProZero.lean:97` | transition `x ↦ x * a`, so ×2 at `a = 2` (Check at line 2470) |
| `.lim_multiplicationTower_eq_bot` | `ProZero.lean:173` | needs `¬IsUnit p` (§7.10) |
| `.padicSum`, `.limOneMultiplicationTowerEquiv` | `Padic.lean:57`, `141` | the target is `ℤ_[p] ⧸ (Int.castAddHom ℤ_[p]).range` (§7.10) |
| Mathlib `Module.Finite.exists_comp_eq_id_of_projective` | `Mathlib/RingTheory/Finiteness/Projective.lean:28` | Gives `n`, surjective `f`, injective `g` and `f ∘ₗ g = id`. Q = ker f is a finite projective complement (§4.15). |

**Sources read this round.**

- **S II, Remark 5.9, printed p. 258** (S lines 13595–13602; this is the §7.10 locator, reworded in this change). The remark says only that lim¹ measures the failure of uniqueness of maps out of a sequential homotopy colimit. Its example is cited by a placeholder (S line 13601). The new wording, "says only what a nonzero lim¹ term measures, for a sequential homotopy colimit", is accurate. The ×p value now rests on Tau Ceti's equivalence and §7.9.
- **The seeded sample.** None of the 15 seeded targets is in the changed passages. Each of the 15 sections is byte-identical to its text at 5f92355e, the head that [r5] accepted. Two seeded targets are adjacent to changed text: §2.23 is cited by the changed §6.2 line, and §3.28 cites the changed §3.25. Their locators were reread:
  - §2.23, NS Appendix C, Prop. C.3, p. 161 (NS lines 7579–7592): a levelwise weak equivalence of proper simplicial spaces realises to a weak equivalence, by the skeletal pushouts and the gluing lemma. This supports the statement as written.
  - §2.23, W IV Thm. 3.6.1(i), p. IV.29 (W IV lines 1324–1325): the bisimplicial-set case. It supports the statement as a special case.
  - §3.28, W IV Thm. 1.8 and Remark 1.8.1, p. IV.6 (W IV lines 270–276): the universal property into H-spaces, and that a homology isomorphism into an H-space is acyclic with homotopy-equivalence factor. This is stated at BGL(R). The README's general plus form is derived through §§3.25, 3.15 and 3.23, and that route is unchanged.

**Ownership and duplication.** The change adds a notational convention, one Check and rewording. It adds no carrier, construction or theorem, so nothing in it can have a second owner. The overlap check lists no open pull request that changes this roadmap, no dropped id and no revision-only id. The convention matches its two suppliers: GeneralizedCohomology on main and Tau Ceti at the pin (tables above).

**Headline theorems and padding.** `Suggested.lean` is unchanged since 6ebf6e2. It states the same 11 sorried theorems:

- `quillenTheoremA` (§2.31);
- `quillenTheoremB` and `quillenTheoremB_structuredArrow` (§2.34);
- `IsAcyclicMap.iff_homology` (§3.7);
- `plus_exists` (§3.10);
- `IsPlusConstruction.lift` (§3.25);
- `IsPlusConstruction.hSpaceRecognition` (§3.28);
- `IsPlusConstruction.nonempty_piTwoEquiv` and `IsPlusConstruction.fiber_universalCentralExtension` (§3.29);
- `continuousFunctions_projective_free` (§4.29);
- `cellularApproximation` (§5.17).

It also has the same 13 real-bodied definitions, and the module docstring names every headline that cannot be stated at the pins. The padding verdicts of [r6] and [r7] stand.

**Adversarial table.** The first block has new rows, with computed values, for every statement this change touches. The second carries the 15 seeded targets from [r5]; their text is unchanged since that head. The third carries the headline theorems from [r6].

| Statement | Instances tried | Values computed on each side / wrong-model control | Result; change |
| --- | --- | --- | --- |
| Conventions, line 60: index shift s versus `δ = 1 − s` | ×2 tower on ℤ with `x = (0,1,0,…)`; identity tower; zero tower | ×2: `s(x) = (2,0,0,…)`, `δ(x) = (−2,1,0,…)`, as stated. Identity: ker δ = constants ≅ ℤ and coker δ = 0, but ker s ≅ ℤ and coker s = 0 too, so only the ×2 and zero towers tell the readings apart. Zero: δ = id gives lim = lim¹ = 0; s = 0 would give ∏Aₙ twice. | Pass |
| Line 76, Tau Ceti contract: δ named `shift`; Milnor for complexes needs δ surjective | complexes in degree 0 with ×2 transitions; with surjective transitions | ×2: δ is not onto, since coker = ℤ₂/ℤ ≠ 0, so `hC` fails and no Milnor sequence is claimed. Surjective: solve `φₙ(xₙ₊₁) = xₙ − yₙ` recursively, so δ is onto and `hC` holds. | Pass |
| Line 99: π_k of G3.8's 1−shift is δ | constant Hℤ tower; ×2 tower of S | π_k of the derived product is ∏π_kE_r, and the coordinate `pr_r − f_r pr_(r+1)` gives `x_r − f_r x_(r+1)` = δ. Constant tower: ker = ℤ, lim¹ = 0, so π₀ holim = ℤ. ×2: lim¹π₀ = ℤ₂/ℤ. | Pass |
| §3.18: evaluation map and abelian lim¹ via δ | constant point; constant S¹; solenoid `S¹ ←2 S¹ ←2 ⋯` | Point: holim = point and evaluation is the identity. Constant S¹: π₁ holim = ℤ. Solenoid: lim π₁ = 0 and π₀ holim = coker δ = ℤ₂/ℤ, which has no 2-torsion. The wrong model coker s would give ∏ℤ/2. | Pass |
| §4.11: phantom kernel = coker δ = G3.10's coker(1−shift) | constant exhaustion of S¹ with T = S¹; T = * | `[ΣS¹,S¹]_* = π₂S¹ = 0`, so lim¹ = 0 and `[S¹,S¹]_* = ℤ` survives. T = * gives 0 everywhere. | Pass |
| §7.9 new Check (line 2470) | ×2 tower; `y = m/2 ∈ ℤ₂` | `v₂(m/2) ≥ 0` forces m even, so 2[y] = 0 implies [y] = 0: ℤ₂/ℤ has no 2-torsion. Image of s = ∏2ℤ, so coker s = ∏ℤ/2 ≠ 0, killed by 2. `(1,0,0,…) = δ(1,0,0,…)` is 0 in coker δ but nonzero in coker s. 1 − δ = s. | Pass |
| §7.10, reworded statement and locator | p = 2, class of 1/3; the sequence (1,1,…) | `3·11 = 33 ≡ 1 mod 32`, so 1/3 ∈ ℤ₂ \ ℤ gives a nonzero class. `padicSum(1,1,…) = 1/(1−2) = −1 ∈ ℤ` gives 0, matching `δ(−1,−1,…)ₙ = −1 + 2 = 1`. Milnor at k = −1 gives π₋₁holim ≅ lim¹π₀ = ℤ₂/ℤ, since π₋₁S = 0. | Pass |
| §2.5: §2.4's boundary = loop shift + loop inclusion | `b ↪ S¹` | hofib = ΩS¹, and the boundary `π₁S¹ = ℤ → π₀ΩS¹ = ℤ` is bijective, the same as §2.4's Check (line 581). | Pass |
| §§2.11, 2.34: forward/reverse comma comparison | `F = id_C`; `F : C → *` | `id`: C/d has a terminal object, so B is contractible and hofib(id,[d]) is contractible: weak. `C → *`: F↓* = C, hofib = BC, and the comparison is the identity. | Pass |
| §4.8: action-category inclusion equivalence | trivial S; control S = ℕ on itself | Trivial S: S⁻¹X ≃ X, so BX → B(S⁻¹X) is an equivalence. Control: +1 on Bℕ = ℕ is not onto π₀, so the hypothesis fails, and indeed π₀B(ℕ⁻¹ℕ) = ℤ ≠ ℕ. | Pass |
| §4.15: finite-projective complement | R = ℤ×ℤ with P = ℤ×0; P = 0 | First: n = 1, Q = 0×ℤ, projective; it is not free, since a free (ℤ×ℤ)^r with r ≥ 1 has both idempotent parts nonzero. Second: Q = 0, n = 0. The Mathlib lemma gives `f ∘ g = id`. | Pass |
| §4.24: Segal spaces and iso-class monoid | C = finite sets under ⊔ | Skeleton(Core C) ≅ ℕ under +, with zero ∅; `A_C(1)` = nerve of the core ≃ ⊔ₙBΣₙ. | Pass |
| §6.2: relative S-construction `S•(F)` | F = id_C; F : 0 → C | id: `Sₙ(id) = Sₙ₊₁C = PₙS•C`, contractible by the extra degeneracy, giving the delooping `wS•C → * → wS•S•C`. `0 → C`: `d₀x = 0` forces a constant filtration, so `Sₙ(F) ≃ C` and the sequence is `wS•C ≃ wS•C → *`. | Pass |
| Capitalisation-only statements §§1.3, 1.5, 1.26, 1.29, 3.19, 3.21, 3.26, 7.29 | one instance each | 1.3: Δ[1] has 2 0-cells and 1 1-cell, and Mathlib's sk 1 realises to the 2-point 0-skeleton. 1.5: ∂Δ[2] ⊂ Δ[2] is a closed circle; a discrete 2-object category → 1 is faithful but not a mono and does not embed. 1.26: `H₀(C₂;ℤ⁻) = ℤ/2`. 1.29: SingleObj ℤ has π₁ = ℤ. 3.19: `[S¹,S¹]_* = ℤ = Hom(ℤ,ℤ)`. 3.21: lifting S² → K(ℤ,2) through PK(ℤ,2) has obstruction the generator of H²(S²) = ℤ. 3.26: BA₅ plus models agree. 7.29: S/2 has no unital multiplication (π₂(S/2) = ℤ/4), consistent with Q₁(2) ≠ 0. | Pass; statements unchanged |
| 2.8 (seeded) | `*→S¹←*`; `*→*←*` | ΩS¹ (π₀ = ℤ) and *, while the strict pullback is * | Pass; carried [r5] |
| 2.23 (seeded) | constant point → constant interval | levelwise and realised maps are weak; π₀ = 1 and higher π = 0 on both sides | Pass; carried [r5]; locator reread above |
| 2.29 (seeded) | terminal diagram over C₃ | ∫F = C₃; hocolim of points = BC₃, with π₁ = C₃ on both sides | Pass; carried [r5] |
| 3.4 (seeded) | punctured Poincaré sphere → * | π₁ map from the perfect group of order 120 to 1: surjective with perfect kernel | Pass; carried [r5] |
| 3.9 (seeded) | `id_S¹`; plus at P = 1 | π₁ = ℤ and higher π = 0 at both ends | Pass; carried [r5] |
| 3.17 (seeded) | S¹×B → B; reflection mapping torus | trivial action passes; the reflection acts by −1 on π₁ = ℤ and fails | Pass; carried [r5] |
| 3.28 (seeded, headline) | S¹ → S¹ of degree −1; plus = id | H₁ map −1 is invertible and the factor is a homotopy equivalence; degree 2 fails the premise | Pass; carried [r5]; locator reread above |
| 3.35 (seeded) | K(C₂,1); K(ℤ,1) | odd H = C₂ and even H = 0; H₁ = ℤ with higher H = 0 | Pass; carried [r5] |
| 4.23 (seeded) | empty word, singleton, two words | unit, x, x⊗y; lengths 0+n = n | Pass; carried [r5] |
| 4.26 (seeded) | discrete ℕ, ℤ | 1 has no inverse in ℕ and has inverse −1 in ℤ | Pass; carried [r5] |
| 4.28 (seeded) | n = 0, 1; constant function 2 | C(Δ⁰,k) = k; restrictions keep 2 | Pass; carried [r5] |
| 5.8 (seeded) | f: 0 → ΣHℤ, y = 1; id | δ_F(1) = −1 and hΣδ_F(1) = −1 = −i(1); for id both groups are 0 | Pass; carried [r5] |
| 5.19 (seeded) | ordinary and super lines over ℂ | self-swap +1 and −1; η sends the odd class to −1 | Pass; carried [r5] |
| 7.15 (seeded) | product and suspension of H(C_p) | ∏C_p is killed by p; suspension moves the group to degree 1; both stay complete | Pass; carried [r5] |
| 7.34 (seeded) | p = 2 with n = 1, 2; p = 3 with n = 1 | S/8, S/32 and S/9; S/2 fails the unit test and S/3 fails associativity | Pass; carried [r5] |
| 2.31 Quillen A (headline) | `id_[1]`; `∅ → 1` | contractible commas, identity; the empty comma is not contractible | Pass; carried [r6] |
| 2.34 Quillen B, both forms (headline) | `1 → C₃`; `id_[1]` | discrete C₃ commas; ΩBC₃ has 3 components; identity gives a point | Pass; carried [r6] |
| 3.7 local homology iff acyclic (headline) | id; `* →` punctured Poincaré sphere with regular coefficients | isomorphisms; H₀ is ℤ¹²⁰ against ℤ | Pass; carried [r6] |
| 3.10 plus existence (headline) | S¹ with P = 1; BA₅ with P = A₅ | id; π₁ = 1 and H₂ = ℤ/2 | Pass; carried [r6] |
| 3.25 plus factorisation (headline) | `id_S¹` at P = 1; BA₅⁺ → K(C₂,2) | h = g; two classes on both sides, indexed by H² = C₂ | Pass; carried [r6] |
| 3.29 `nonempty_piTwoEquiv`, `fiber_universalCentralExtension` (headline) | P = A₅; P = 1 | π₂(BA₅⁺) = H₂(A₅) = C₂, fibre π₁ = 2·A₅ → A₅ with kernel C₂; 0 and 1 → 1 | Pass; carried [r6], [r7] |
| 4.29 projective freeness (headline) | P = 0; rank one; n = 0; Möbius line | free of ranks 0 and 1; C(Δ⁰,k) = k; Möbius is non-free outside the hypothesis | Pass; carried [r6] |
| 5.17 cellular approximation (headline) | D(ℤ), G = ℤ[0], E = Hom(−,C₂[0]); empty G | evaluation C₂ → C₂; empty G gives R = 0; ⊕ℕℤ fails compactness | Pass; carried [r6] |

[r7]: packages/StableHomotopyKTheory/reports/PRREVIEW-StableHomotopyKTheory~7.md
[r6]: packages/StableHomotopyKTheory/reports/PRREVIEW-StableHomotopyKTheory~6.md
[r5]: packages/StableHomotopyKTheory/reports/PRREVIEW-StableHomotopyKTheory~5.md

**Remarks carried in [r7], now resolved.** `README.md:941` (§2.34) now reads "§2.11's forward-comma comparison map is weak", so the doubled phrase is gone. The §7.10 locator now says what S II Remark 5.9 supports and nothing more.

**Remark on untouched text (no change requested).** Five Check bullets begin with a lower-case word: `README.md:900`, `901`, `1694`, `2466` and `2467`.

## Not verifiable

- Thomason (1979), Thm. 1.2 (§2.29): the journal copy is paywalled. It was checked through Kahn Thm. 1.4.3 in [r6].
- Thirteen seeded targets were not reread at their sources this round: §§2.8, 2.29, 3.4, 3.9, 3.17, 3.35, 4.23, 4.26, 4.28, 5.8, 5.19, 7.15 and 7.34. None is in or next to the changed passages, and their text is byte-identical to the head [r5] accepted. Their rows are carried.
- Limits carried from earlier reports: Barratt–Eccles, Γ⁺-structures I (paywalled), and the structure-map details of Schwede's Waldhausen iteration (a source gap already recorded).

## Source issues

- **Gap** in S at Remark II.5.9, printed p. 258 (S lines 13601–13602): the source promises an example of a Milnor sequence with a nonzero lim¹ term but points to it through an unfilled placeholder reference; it should name the section or work containing that example; affects nothing.
- **Misprint** in W IV at the paragraph introducing Theorem 1.8, printed p. IV.6 (W IV lines 265 and 268–269): the source doubles the word "that" (line 265) and the word "is" (lines 268–269) in the two paragraphs before the theorem; it should state each once; affects nothing.

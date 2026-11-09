# Review of HeightsRationalPointsAndObstructions (pull request #1017 at 49a5570)

**Verdict:** needs changes

This is an incremental re-review of the 21 README lines changed since 92d2ce0. The changes are:

- the supplier preamble (line 29) and a new supplier bullet (line 50);
- a new contract subsection, *From TauCetiRoadmap.GroupSchemesOverABase* (lines 118–126), with three Checks;
- the Picard step of `groupUnitsPic_product` and its *Needs:* line in §3.8e (lines 1578, 1587);
- the `[T̂→T̂_sc]` identification in `connectedDegreeZero_PT` and its *Needs:* line in §3.8f (line 1605);
- the second Check of §5.13b (line 2647), which repairs the previous R01.

`Suggested.lean` and `metadata.toml` are unchanged since 92d2ce0. The gate fails at this head with `dropped=4`. Every one of those hits comes from the new supplier, GroupSchemesOverABase. That roadmap may not be cited, and no other roadmap supplies what it was cited for. One blocking finding.

## R01 (P1) — The Picard groups of a reductive group are handed to GroupSchemesOverABase, which may not be cited

**Location.** `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md`:

- line 29: "GroupSchemesOverABase also precedes it … the reductive Picard groups in §§3.8e–f";
- line 50: the GSOB supplier bullet;
- lines 118–126: the GSOB contract subsection;
- line 1578: "For Pic Ḡ take the field case from GSOB §6.2 on the reductive quotient";
- line 1587: the *Needs:* item "GSOB §6.2 reductive Picard groups";
- line 1605: "its cokernel P/X\*(T_der) is Pic Ḡ by GSOB §6.2", and "GSOB §6.2" in that *Needs:* line.

**Claim.** GroupSchemesOverABase §6.2 supplies, over a field:

- the sequence `0 → X*(G) → X*(T) → Pic(G/B⁻) → Pic(G) → 0`;
- `Pic(G/B⁻) ≅ ℤ^Δ ≅ P`;
- `Pic(G) ≅ P/X*(T_der)`.

The README also says that GroupSchemesOverABase precedes this roadmap.

**Witness.** GroupSchemesOverABase is on the project's dropped-names list. The gate's `dropped` scanner flags lines 29, 50, 50 and 118. The roadmap is also missing from the merge order and from main. No permitted roadmap states Pic Ḡ: searching main and every open head for `Pic(G/B`, `Pic(SL`, `T̂_sc`, `UPic`, Popov and Sansuc finds only GroupSchemesOverABase itself.

**Consequence.** As written, the field-case Picard computation has no owner. Four targets depend on it:

- `groupUnitsPic_product` in §3.8e uses it directly;
- `connectedDegreeZero_PT` in §3.8f uses it directly;
- `invariantBrauer_lifting` depends on it through those two;
- `descent_descent_eq_descent` in §3.8 depends on it through §§3.8e–f.

The previous head owned this step in §3.8e ("For Pic remove the Bruhat-cell boundary of G …"), and the previous review passed it.

**Repair.** Own the field case here again and keep the new, more detailed argument. The content GSOB was cited for is correct; see the table.

1. Line 29: delete "; GroupSchemesOverABase also precedes it" and "the reductive Picard groups in §§3.8e–f,". The sentence then reads exactly as it did at 92d2ce0.
2. Line 50: delete the GSOB bullet.
3. Lines 118–126: delete the contract subsection. Move its three Checks into §3.8e's **Checks.**; all three are correct (see the table).
4. Line 1578: replace "take the field case from GSOB §6.2 on the reductive quotient:" with "prove the field case here on the reductive quotient:". Keep the rest of the sentence: the big cell `U⁺B⁻ ≅ 𝔸^N×G_m^r` has trivial Pic, the pulled-back `D_α` generate Pic Ḡ, and the relations are the divisors of characters of T.
5. Line 1587: delete "GSOB §6.2 reductive Picard groups;" from *Needs:*. The big cell is already covered by "RG structure/Bruhat".
6. Line 1605: replace "by GSOB §6.2" with "by §3.8e", and delete "GSOB §6.2;" from *Needs:*.
7. In §3.8e's Sources, cite the Picard computation directly: Popov 1974 §4 and Sansuc 1981 §6, each with its lemma or proposition number and page. Add both works to References; neither is there now.
8. Drop GroupSchemesOverABase from the description's depends-on and merge-order lists.

**Test.** I applied steps 1–6 to a scratch copy of the README. It has no occurrence of `GroupSchemesOverABase` or `GSOB` left, so the four `dropped` hits disappear. Line 29 comes back identical to its 92d2ce0 text.

## Previous findings

- R01 — repaired. The new §5.13b Check (line 2647) reads: "for dim A≥1 the group A(E) is not finitely generated: A(ℚ̄) is nonzero and divisible and contains the infinite torsion subgroup A(ℚ̄)_tors, and A(E)⊇A₀(𝔽̄_p) is an infinite torsion group".

## Verified sound

### Scope of the change

- `git diff 92d2ce0 HEAD` on the folder touches only `README.md` (16 insertions, 5 deletions).
- `git diff --name-only origin/main...HEAD` lists only the folder's three files.
- The long "files changed outside the folder" list in the change summary comes from merging main (86c64e6). It is not the pull request's own change, and it is not a finding.

### Gate and depcheck

The gate rerun at 49a5570 gives:

`set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=4 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL`

The only failure is `dropped=4`, which is R01.

The dependency check prints `depcheck: 237 roadmaps, 2304 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. It cannot see the GroupSchemesOverABase edge, because that roadmap is neither on main nor in the order; the dropped-names scanner is what catches it.

### Elaboration

`lake env lean TauCetiRoadmap/HeightsRationalPointsAndObstructions/Suggested.lean` takes 29 s. It prints seven `declaration uses sorry` warnings (lines 60, 72, 79, 91, 138, 152, 166) and nothing else.

The file is unchanged since 92d2ce0. Its 11 elaborated signatures in the worker's signature dump are the ones the previous review compared with the README, and none has lost a section binder.

### Is the GroupSchemesOverABase content right?

GroupSchemesOverABase's README at its open head, §6.2 (its lines 1218–1236), states exactly what the contract transcribes. The defect is ownership, not mathematics.

### Ownership search

None of the following states Pic of a reductive group or of its flag variety:

- ReductiveGroups and ReductiveGroupsPartII on main (Bruhat and big-cell material only);
- SchemeAndStackFoundations on main (Picard theory of schemes and curves);
- AdelicAlgebraicGroups at its open head;
- every open head searched with `roadmaps grep`.

### Mathematics of the changed passages

All values are in the table.

- **The exact sequence.** It holds on SL₂, PGL₂, GL₂ and G_m.
- **The basis of Pic(G/B⁻).** The `D_α` basis matches `Pic(G/B⁻) = P` for a non-simply-connected G.
- **The product argument (§3.8e).** It holds:
  - Pic of `𝔸^N×G_m^r×X̄` is Pic X̄ for regular X, since `H¹_et(X,ℤ)` and NPic vanish on a normal X;
  - units on the big cell times X̄ are `U(X̄)×` Laurent monomials, so the relations are the image of X\*(T) modulo X\*(G), by Rosenlicht;
  - checked on `PGL₂×ℙ¹`, where it gives `ℤ/2⊕ℤ`.
- **The identification of `[T̂→T̂_sc]` (§3.8f).** The kernel is X\*(G), units modulo constants. The cokernel is `X*(T_sc)/X*(T_der) = P/X*(T_der)`, because restriction `X*(T)→X*(T_der)` is onto and `X*(T_der)→X*(T_sc)` is injective.
- **Remark on line 120.** "In characteristic zero every connected reductive group over k̄ is split" is true, and in fact holds in every characteristic. Not a defect.

### Adversarial table

Rows marked r4 were computed this round. The others are carried from the previous reports (r3, r2, r1) for statements the diff leaves untouched.

| Statement | Instances | Values | Result |
|---|---|---|---|
| Contract sequence `0→X*(G)→X*(T)→Pic(G/B⁻)→Pic(G)→0` (r4) | SL₂; PGL₂; GL₂; G_m | SL₂: `0→ℤϖ→ℤ→0→0`, `mϖ↦O(m)`, Pic = 0. PGL₂: `0→2ℤϖ→ℤ→ℤ/2→0`, `α↦O(2)`. GL₂: `ℤ²→ℤ`, `(a,b)↦a−b`, kernel `ℤ(1,1)=ℤ·det`, Pic = 0. G_m: `0→ℤ→ℤ→0→0`. | exact in all four; content correct, owner forbidden (R01) |
| `Pic(G/B⁻)≅ℤ^Δ≅P` and `Pic(G)≅P/X*(T_der)` (r4) | GL₂ against the wrong model `Pic(G/B⁻)=X*(T)`; SL₃; PGL₂ | GL₂: `X*(T)=ℤ²` but `Pic ℙ¹=ℤ=P`, so the wrong model is excluded. SL₃: `P=ℤ²`, Pic = 0. PGL₂: `P/X*(T_der)=ℤϖ/2ℤϖ=ℤ/2`. | correct |
| §3.8e `Pic(Ḡ×X̄)=Pic Ḡ⊕Pic X̄` route (r4) | `G=PGL₂, X=ℙ¹`; `G=X=G_m`; X cuspidal (excluded) | `PGL₂×ℙ¹`: big cell times ℙ¹ has Pic ℤ; one boundary divisor D; `div(α)=2D`; units of G×X are constants, so kernel ℤ/2 and `Pic=ℤ/2⊕ℤ`. `G_m×G_m`: Pic 0, units modulo constants `ℤ²=X*(G_m)⊕U(X)/k̄^×`. Cuspidal X has `NPic≠0`, excluded by smoothness. | correct for smooth X |
| §3.8f `[T̂→T̂_sc]` identification (r4) | PGL₂; GL_n; torus; wrong model with `T̂_der` in place of `T̂_sc` | PGL₂: `ℤα→ℤϖ`, `α↦2ϖ`, kernel 0, cokernel ℤ/2 = Pic. GL_n: `ℤⁿ→ℤⁿ/ℤ(1,…,1)`, kernel ℤ·det, cokernel 0. Torus: kernel X\*(T), cokernel 0. Wrong model on PGL₂: cokernel 0 ≠ ℤ/2. | correct |
| Contract Checks, lines 124–126 (r4) | the three bullets | Pic(SL₂)=0, Pic(PGL₂)=ℤ/2, `2ℤϖ⊂ℤϖ`. GL_n: `k̄[GL_n]^×=k̄^×·det^ℤ`, Pic 0 since GL_n is open in `𝔸^{n²}`. Torus: `G/B⁻=pt`, kernel term X\*(T). | correct; move them to §3.8e |
| §5.13b second Check, repaired (r4) | E=ℚ̄ with A=E₀: y²=x³−2; E=𝔽̄_p(t) with A₀ elliptic; dim A=0 | `(3,5)` has infinite order (`x(2P)=129/100`). `A(ℚ̄)` is divisible, hence not finitely generated, and `#A[n](ℚ̄)=n²`. `A(𝔽̄_p(t))=A₀(𝔽̄_p)` is torsion with `ℓ²` points of order ℓ for ℓ≠p. For dim A=0 the group is 0, which the Check now excludes. | correct |
| §5.13b / `finitelyGeneratedField_points_fg` (r3) | ℚ; 𝔽_p; 𝔽_p(t); ℚ(t) with A constant; ℚ̄; A=0 | f.g. via §1.7, finite field, Conrad Cor. 7.2 (line 1090) or trace; ℚ̄ correctly excluded | unchanged, true |
| §2.16 `H³(G_k,k^{s×})=0`; `Br₁/Br₀≃H¹(k,Pic X̄)` (r2) | ℚ; `ℚ(√13,√17)`; ℝ | 0; `ℤ/2≠0` in the finite layer; `Ĥ³(ℤ/2,ℂ^×)=0` | unchanged |
| §3.17a torsor/divisor and polarization diagonal (r2) | elliptic A; a=0; `λ_(O)` | `⟨0,β⟩=0`; `⟨a,a⟩=0` | unchanged |
| §1.1, §4.6 `mordell_finite`, §5.1 `point`/`cosetSupport` (r2) | `φ=[n]`; genus 2 over ℚ; a=0 | injective Kummer map; one target; support = A | unchanged |
| Height conventions, §§0.2–0.30 (r1) | `[2:1]` over ℚ and ℚ(i); `y²=x³−2`, `(3,5)`; `[2]*L=L⁴` | `log 2`, `2 log 2`; `129/100`; four quartics | unchanged |
| §1.7 `fg_points`; §1.10; §§1.15–1.19 (r1) | `y²=x³−x`, `S={2,∞}`; ℚ₂, ℝ | `Sel²=(ℤ/2)²`, `Ш[2]=0`; indices 8, 16, 1, 2 | unchanged |
| §§2.2–3.18c Checks (r1) | `ℤ[t]/(3t−1)`; `(−1,t)`; ℚ(i); `ℤ/3` | no ℤ₃-point; 1/2; 0; `1/3+2/3=0` | unchanged |
| §4.8 `siegel_finite`, §5.6, §5.13 `finiteRank_mordellLang`, §6.2 `genusZero_hassePrinciple` (r1) | ℙ¹ minus 1, 2, 3 points; Γ=0; `x²+y²=3z²` at 3 | infinite / infinite / finite; dimension 1, rank 0; no ℚ₃-point | unchanged, not vacuous |

### Headline theorems

`Suggested.lean` is unchanged. Its seven sorried theorems are those listed in the previous report, as are the not-statable headlines named in its docstring. The change touches no headline.

### Seeded sample

None of the fifteen sampled targets lies in the changed lines. §3.8 ("Comparison and iteration") depends on them through its *Needs:* "§§3.5–7, 3.8a–f", which is how R01 reaches `descent_descent_eq_descent`. Under the incremental rule its locators (Poonen Theorems 8.5.4–5 pp.247–248; Cao 2020 Theorems 1.1–2 pp.2152–2153) were not reopened.

### Remarks on untouched text (no change requested)

- **Overlap lead.** Line 1161 cites LocalFieldsRamification Layer 4. On main that layer is "Layer 4: the tame quotient of the absolute Galois group" (`Completed/LocalFieldsRamification/README.md` line 1154), but an open revision of LocalFieldsRamification (#617) no longer defines it.
- **Citation leads.** The 28 Lean-name leads in the citation scan all sit in untouched lines. Three of them are this roadmap's own `Suggested.lean` names.

### Declared gaps

None. There is no readable `design/plan.json`, and the change declares no gap.

## Not verifiable

- **Popov 1974 §4 and Sansuc 1981 §6.** These are cited in the changed text only as "the supplier's … locators". Neither is in the sources cache, and this review edits no manifest, so neither text was opened. Repair step 7 asks for the exact lemma and page of each.
- **Faltings 1991 (§5.9a).** Carried from the first review: JSTOR only, untouched passage.

## Source issues

- none

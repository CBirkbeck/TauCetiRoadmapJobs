# Review of ModularityAndLanglandsExtensionsPartII (pull request #2449 at b05eba7)

**Verdict:** needs changes

## R01 (P3) — The description's supplier lists omit OrdinaryAutomorphicFormsAndModularityLiftingPartII

**Location.** Pull-request description, Dependencies paragraph: "The suppliers that are still open pull requests are in the dependency task list and the merge order below." The `depends-on` and `merge-order` blocks.

**Claim.** This head makes OrdinaryAutomorphicFormsAndModularityLiftingPartII, an open roadmap in #2268, a supplier of §§9.4 and 12.4. It appears in neither block, so the sentence is false. As written, the chain would let this pull request merge before its supplier.

**Witness.** README line 329: "### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups and OrdinaryAutomorphicFormsAndModularityLiftingPartII". The `depends-on` block has 24 entries and none is #2268. The chain ends "#2135 (PotentialAutomorphyInfrastructurePartII) → **this pull request**". `ORDER.txt` lists the supplier at 303 and this roadmap at 304.

**Repair.**
- Add `- [ ] #2268 OrdinaryAutomorphicFormsAndModularityLiftingPartII` to the `depends-on` block.
- End the `merge-order` chain with `#2135 (PotentialAutomorphyInfrastructurePartII) → #2268 (OrdinaryAutomorphicFormsAndModularityLiftingPartII) → **this pull request** (#2449)`.

The open suppliers of #2268 (#2135, #1180, #1081, #1075, #1069, #1034, #1006, #923, #920) are already in the chain.

## Previous findings

- R01 — repaired: in §9.4, "For `p = 2`, where PotentialAutomorphyInfrastructurePartII Layer 3 is stated only for odd `l`, the inputs are replaced as follows (supplier contracts)." The gap is gone from the README and from `design/plan.json`, which now hold 14 slugs each.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| §9.1 reduction (6), `4 \| [F : ℚ]` (nt21b p. 6) | `n = 2, 3`; `[F : ℚ] = 2, 4` | nt21b line 244 asks only for "even". `3·2 = 6 ≡ 2`, `3·4 = 12 ≡ 0`, `2·2 = 4 ≡ 0` mod 4. A real quadratic `E/F` doubles the degree | holds |
| §9.1, new Check | `n = 3`, `[F : ℚ] = 2` | `n[F : ℚ] = 6`, `6 mod 4 = 2`. After (6), `4 \| n[F : ℚ]` for `n = 1, 2, 3` | holds |
| §9.4 at `p = 2`: exactness and freeness (AutomorphicFormsOnReductiveGroups §§7.4–7.5) | trivial coefficients; `C₂` acting by sign on `ℤ` | trivial action: `S(J, 𝒪/ϖ^m) = (𝒪/ϖ^m)^h`. Sign action: `0` over `ℤ` but `𝔽₂` mod 2 (§7.5 Check); weight `0` excludes it | holds |
| §9.4 at `p = 2`: Hecke determinant glued by IntegralHeckeAndGaloisDeterminants §4.1 | `n = 1`; `T ⊂ T ⊗ E` | `n = 1`: `T ⊗ ℚ̄₂ ≅ ∏_χ ℚ̄₂`, reduced. In general `T ↪ ∏ E_π`, jointly injective; coefficients `q_w^{i(i−1)/2}T_w^{(i)} ∈ T`; no `n!` is inverted | holds |
| §9.4 at `p = 2`: comparison at `Q`, using OrdinaryAutomorphicFormsAndModularityLiftingPartII §2.3(i) | `R = ∅`; a twist of `St₂` at `v ∈ Q` | `v` is split and `v ∤ 2`, so (i) applies. Eigenvalues `α, q_vα` with `q_v ≡ 1 mod 2^N` coincide residually, against the distinctness in §9.3 | holds |
| §12.4 at `p = 2`: `4 \| n[F : ℚ]` from `n = 2r` and (11) of §12.1 | `r = 1, 3`; `[F : ℚ] = 2` | `2·2 = 4` and `6·2 = 12`, both `≡ 0 mod 4`; in general `2r·2k = 4rk` | holds |
| Supplier block: OrdinaryAutomorphicFormsAndModularityLiftingPartII Layer 2 hypotheses | BCGP25 Hyp. 5.7.1 (its README line 234) against §9.1 (11) and §12.1 (14) | `K/F` unramified everywhere: (11), (14). Places above 2 split, since `S ⊇ S_p` splits. `nd ≡ 0 mod 4`: (6), and `n = 2r` | holds |
| Supplier block: OrdinaryAutomorphicFormsAndModularityLiftingPartII §2.3 | constituent at level `V_1(Q; N)` | (i): characteristic polynomial `Σ(−1)^j q_w^{j(j−1)/2}T^j_w X^{n−j}`, matching the action `q_w^{i(i−1)/2}T_w^{(i)}` in §9.4 | holds |
| §9.8 (nt21b Thm 2.1), sample, depends on §9.4 | `p = 2`, `n = 2` | `2^a > max(5, 3)` forces `a ≥ 3`. nt21b line 568 treats `p = 2` separately; its §9.4 inputs now have owners | holds |
| previous R01, `gap:dyadic-definite-unitary-forms` | README, `plan.json`, *Needs* lines | 0 mentions remain; 14 slugs in each; §§9.4 and 12.4 cite the two supplier roadmaps | repaired |
| R01 here, the description's supplier lists | `depends-on`, `merge-order` | 24 entries, none #2268; the chain goes #2135 → #2449. `ORDER.txt` lists the supplier at 303 | omission real |

The rows for statements the diff does not touch stand as in the previous review, of 79b71ce.

- **Source locators checked against the text:**
  - nt21b lines 237–262 (reductions (6)–(11), p. 6);
  - nt21b lines 436–567 (unitary Hecke modules, Lemma 2.4, Proposition 2.5 and its proof, pp. 10–12).
- **Cross-roadmap citations in the changed passages, all resolved:**
  - on main: AutomorphicFormsOnReductiveGroups §§7.4–7.5 (README lines 1218, 1245); IntegralHeckeAndGaloisDeterminants §4.1 (line 3244); SmoothRepresentationsOfLocalGroups SR.1.5, SR.2.3, SR.3.4 (lines 1583, 2205, 2957); Chebotarev Layer 10 (line 410, completed roadmap);
  - at open heads: OrdinaryAutomorphicFormsAndModularityLiftingPartII §§2.1 and 2.3 (#2268, lines 236, 286); PotentialAutomorphyInfrastructurePartII Layer 3 and §4.2 (#2135, lines 728, 1065).
- **Gate at b05eba7 (my run):** every check 0, `OK`; no change outside the folder. Depcheck: `depcheck: 259 roadmaps, 2488 edges, 0 problem(s)`.
- **Elaboration:** `Suggested.lean` has not changed since 79b71ce. `lake env lean` gives only the two `sorry` warnings (lines 98, 117).
- **Gaps:** 14 slugs, identical in `design/plan.json` and the README. No mention of `dyadic-definite-unitary-forms` remains.
- **Shape of the changed text:** the changed subsections keep their Checks, *Needs* lines and Dependencies. The added lines contain no LaTeX, no process words and no pull-request numbers.

Overlap check: I read the following.
- OrdinaryAutomorphicFormsAndModularityLiftingPartII: scope, Layer 2, §§3.3, 3.6.
- PotentialAutomorphyInfrastructurePartII: Layer 3, §§3.1, 4.2.
- AutomorphicFormsOnReductiveGroups: §§7.4–7.6.
- IntegralHeckeAndGaloisDeterminants: Layer 4.
- SmoothRepresentationsOfLocalGroupsPartII: SRU.7.1.

Shared objects and their owners:
- Algebraic modular forms at `l = 2` and the Galois representations of their constituents: AutomorphicFormsOnReductiveGroups §§7.4–7.5 and OrdinaryAutomorphicFormsAndModularityLiftingPartII §§2.1, 2.3; this roadmap cites them.
- The ordinary Hecke-valued representation and the ordinary Taylor–Wiles levels at `p = 2`: OrdinaryAutomorphicFormsAndModularityLiftingPartII §§3.3, 3.6. §9.4 instead builds the weight-`0` Hecke algebra at hyperspecial level above 2, which is not ordinary and so is a different algebra. It does this with the gluing theorem of IntegralHeckeAndGaloisDeterminants §4.1.
- The Kazhdan–Lusztig classification: see the human-reviewer bullets below.

Source independence (changed passages only): I compared 9 changed passages with 4 sources (nt21b, nt26, nt21, chen14). They share no run of 7 words. The `p = 2` paragraph of §9.4 has no counterpart in nt21b pp. 10–12, which cites its predecessor paper for these steps. No layer was added, removed or reordered, so the arrangement was not compared again; the previous review found nt21 with the largest share, 86 of 233 locators, and the contents independent.

## Not verifiable

- kl87 Theorem 7.12 and §8, bbm82 Théorème 3.1.1, kw09 Proposition 9.3: uncertified (paywalled) and settled, cited by locator only. They are in untouched text.
- Every locator in the changed passages could be read.

## Source issues

- none

## For the human reviewers

- The Kazhdan–Lusztig classification is stated in two places:
  - §4.9 here (README line 1871; merge order 304);
  - SmoothRepresentationsOfLocalGroupsPartII SRU.7.1 (pull request #1815 head, README line 1482; merge order 316), which does not cite this roadmap.

  An earlier repair round settled this as an edit for that roadmap.
- `gap:components-under-field-extension` asks AdicSpacesPartV Layer 1 (on main) for base change of irreducible components. That roadmap's README line 23 excludes "base change of global irreducible components" from its scope.
- README §13.6 (lines 5120–5121) and its first Check (line 5135) record a problem in another roadmap's text: the second paragraph of ModularityAndLanglandsExtensions §4.23 (pull request #1180 head), read in characteristic zero, fails for `r ≥ 2`, because the weights `{0, 1, 1, 2}` repeat. That statement belongs to the other roadmap.
- Layers 7 and 14 avoid nt21's odd-rank induction because of the block defect in the proof of nt21 Proposition 7.4 (p. 88), which the previous review recomputed. No published correction was searched for.

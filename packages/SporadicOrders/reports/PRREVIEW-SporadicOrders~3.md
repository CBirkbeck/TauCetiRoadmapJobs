# Review of SporadicOrders (pull request #599 at dee3069)

**Verdict:** needs changes

🤖 Independent AI review, incremental: 143 changed README lines since `824bdaa`; `Suggested.lean` is byte-identical to the previously reviewed head. One finding, P2: the repair of the previous R01 reasserts, with more detail, five Tau Ceti declarations that still do not exist at the pinned Tau Ceti revision (they exist on Tau Ceti's upstream `main`, which is not the pin). The other two previous findings are repaired, and every new Check in 0.2 and 0.3 recomputes. The gate passes, the dependency check reports no problem, and the twenty headline theorems elaborate with exactly twenty `sorry` warnings. No pull-request file was changed.

## R01 (P2) — Five Tau Ceti declarations cited as the supplier contract do not exist at the pin

**Location:** `TauCetiRoadmap/SporadicOrders/README.md:118–133` (“`TauCeti.GroupPresentation.homEquiv` … `TauCeti.Relator.eval` … agree by `TauCeti.Relator.lift_toFreeGroup` … `TauCeti.Relator.commInvInv r s` … by `TauCeti.Relator.eval_commInvInv`”); the same names are consumed at lines 416 and 425 (2.1, `TauCeti.Relator.eval`), 447 and 450 (2.2, `homEquiv`) and 479 (Layer 2 Dependencies).

**Claim:** Tau Ceti at the pin supplies `GroupPresentation.homEquiv`, `Relator.eval`, `Relator.lift_toFreeGroup`, `Relator.commInvInv` and `Relator.eval_commInvInv`.

**Witness:** The pin is unchanged, Tau Ceti `a780c7ad6beb23f60a17351a492d177878020ad5` (`lake-manifest.json`; the checked-out package is at that commit). A search of the whole pinned tree for these five names finds nothing (`homEquiv` only as `IsProjectiveCover.homEquivOfIsSimpleModule` and category-theory uses). `TauCeti/GroupTheory/Presentation/Relator.lean` at the pin declares `toWord`, `length`, `toFreeGroup`, `conj`, `div`, `toFreeGroup_comm_inv_inv` (line 296: the free-group value of `comm (inv r) (inv s)` is `r⁻¹ s⁻¹ r s`), `relatorSet`, `toWord_toFreeGroup`; it has no `eval`, no `commInvInv`. `GroupPresentation.lean` at the pin ends its API at `relatorSet` (180), `mem_relatorSet_iff` (188), `relatorSet_eq_relatorSet_transcribed` (201), `Group` (207), `matchesMetadata` (214); no `homEquiv`. The sporadic modules transcribe source commutators through a private `sourceComm r s := .comm (.inv r) (.inv s)` (for example `McLaughlin.lean:160`), not through a library constructor. All five names do exist on Tau Ceti's upstream `main` today (`Relator.eval`, `lift_toFreeGroup`, `commInvInv`, `eval_commInvInv`, `GroupPresentation.homEquiv` with the signature the README describes), which is presumably where the repair was read from; the roadmap is reviewed against the pin, and the pin bump is not the roadmap's to make.

**Repair:** State the Tau Ceti contract with the pinned names, which carry the same mathematics. Relator evaluation at an assignment `τ` is `FreeGroup.lift τ t.toFreeGroup` (Mathlib `FreeGroup.lift`, Tau Ceti `TauCeti.Relator.toFreeGroup`), ranging over `t ∈ P.transcribed`; the relator set of `P.Group` is exactly these values by `TauCeti.GroupPresentation.mem_relatorSet_iff`; the hom out of `P.Group` is `PresentedGroup.toGroup` with `toGroup.of` and `toGroup.unique`, so delete the `homEquiv` bullet or describe the correspondence as the consequence of those three without a name. Replace the last commutator sentence by: the constructor is `TauCeti.Relator.comm`, Mathlib's `r s r⁻¹ s⁻¹`, and a source commutator `r⁻¹ s⁻¹ r s` is transcribed as `comm (inv r) (inv s)`, whose free-group value is given by `TauCeti.Relator.toFreeGroup_comm_inv_inv`. Make the same substitution at 2.1 (`TauCeti.Relator.eval` → `FreeGroup.lift τ` of `TauCeti.Relator.toFreeGroup`), 2.2 (drop “equivalently `TauCeti.GroupPresentation.homEquiv`” and the *Needs* item) and the Layer 2 Dependencies. I checked that this is exactly the semantics under which the relators of M23, M24, J1, HS and McL were evaluated on the models in the previous review's table D, so the repair changes no mathematics. If the author prefers the upstream names, the README must still say what is true at the pin; a later pin bump can shorten the contract.

## Previous findings

- R01 — not repaired: `README.md:118–133` now cites `homEquiv`, `Relator.eval`, `lift_toFreeGroup`, `commInvInv`, `eval_commInvInv`; none exists at Tau Ceti `a780c7ad` (above).
- R02 — repaired: `README.md:214–260` states 0.3, the sifting step and the membership criterion with `Rᵢ ⊆ G₍ᵢ₎`, `Rᵢ · bᵢ = Δᵢ`, six Checks; `README.md:52–57` says P0 receives theorems, not a checker; Downstream (`:486–489`) names 0.1 and 0.3.
- R03 — repaired: `README.md:31–37` owns the abstract orbit description here and places CertifiedPermutationComputation §2.2 as its instance for a finite type with inverses adjoined, consuming nothing; §2.2 of that roadmap at its open head (lines 177–181) says exactly that.

## Verified sound

Head `dee3069fa2c699bc9735eb71e81f40d8bb727cb1`, main at `c994070`; pins Mathlib `5e0c4e5239cb0a2d86d68a884bf52cfd963fce22`, Tau Ceti `a780c7ad6beb23f60a17351a492d177878020ad5`, both unchanged since the previous review. The diff touches only `README.md` (108 insertions, 35 deletions); `git diff --stat 824bdaa HEAD -- Suggested.lean` is empty and the outside-folder diff against `origin/main` is empty.

**Gate, build and signatures.** The worker's gate: every check passes. I elaborated `Suggested.lean` with `lake env lean` (the Tau Ceti object file `Sporadic/Presentation.olean` was present): exit 0 in 6.6 s, twenty `declaration uses sorry` warnings at lines 251–278 and 284–330, no other output. The `#check` signature comparison and the one-tactic padding probe of the previous review stand unchanged, since the file is byte-identical; no section variables exist, so no binder can have been lost. The dependency check printed

```text
depcheck: 173 roadmaps, 1178 edges, 0 problem(s)
```

with no `UPWARD`, `CYCLE` or `moved:` line; SporadicOrders is line 400 of the 402-line merge order. No gaps are declared and none is needed.

**Headlines.** Unchanged: ten `card_<Name>` (1.2) and ten `exists_surjective_<Name>` (2.2), all stated; the docstring says Layer 0 is general theory stated in the README. The docstring's “order and membership theorems” for Layer 0 now matches the README, which states 0.3.

**Adversarial table, changed statements (computed here).** Products are Mathlib's `(σ * τ) x = σ (τ x)`; permutations were enumerated by brute force (closures of at most 6 elements).

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 0.3 sifting step, `h ∈ G₍ᵢ₎ ↔ r⁻¹ h ∈ G₍ᵢ₊₁₎` | `G = A₃ = ⟨c[0,1,2]⟩`, `b₁ = 0`, `R₁ = {1, c[0,1,2], c[0,2,1]}`, all six `h ∈ S₃` | both sides agree for all six `h` (three in, three out) | holds |
| 0.3 criterion, Check 1 | `S₃`, base `0, 1`, `R₁ = {1, c[0,1,2], c[0,2,1]}`, `R₂ = {1, c[1,2]}`, `g = c[0,1]` | `g 0 = 1` selects `c[0,1,2]`; residue `c[0,1,2]⁻¹ · c[0,1] = c[1,2]`, fixes 0, sends 1 ↦ 2; selects `c[1,2]`; final residue `1`; `c[0,1,2] · c[1,2]` has images `1, 0, 2 = c[0,1]` | Check exact |
| 0.3 Check 2 | `⟨c[0,1,2]⟩` (order 3), base `0` | `c[0,2,1]` → `r₁ = c[0,2,1]`, residue `1`, member; `c[0,1]` → `r₁ = c[0,1,2]`, residue `c[1,2] ≠ 1`, not member; `c[0,1] 0 = 1 ∈ Δ₁` so the orbit-only test would accept it | Check exact |
| 0.3 Check 3 | `⊥`, `k = 0` | empty product `1`, residue `g`; `g ∈ ⊥ ↔ g = 1` | Check exact |
| 0.3 Check 4 | `Fin 4`, `⟨c[0,1]⟩` (order 2), `R₁ = {1, c[0,1]}` | `Δ₁ = {0, 1}`; `c[0,2] 0 = 2 ∉ Δ₁`, no `r`; `c[2,3]` → `r₁ = 1`, residue `c[2,3] ≠ 1` | Check exact, two distinct failure reasons |
| 0.3 Check 5 (`Rᵢ ⊆ G₍ᵢ₎` needed) | `⟨c[0,1,2]⟩`, `R₁ = {1, c[0,1], c[0,2]}` | images of 0: `{0, 1, 2} = Δ₁`; sifting `c[0,1]` selects `c[0,1]`, residue `1`; `c[0,1] ∉ G` | negative control correct |
| 0.3 Check 6 (base needed for `g = r₁ ⋯ rₖ`) | `S₃`, single point `0` | `G₍₂₎ = {1, c[1,2]}`; sifting `c[1,2]` selects `1`, residue `c[1,2] ≠ 1` yet `∈ G₍₂₎`; `c[1,2] ∈ S₃` | general form decides correctly, short form fails |
| 0.3 degenerate: infinite `α` | `α = ℤ`, `G = ⟨x ↦ x + 1⟩`, base `0`, `R₁ = G` | `Δ₁ = ℤ`, `G₍₂₎ = ⊥`; `g = shift by m` sifts to residue `1`; `g = x ↦ −x` has `g 0 = 0`, `r₁ = 1`, residue `g ∉ ⊥` | no finiteness needed |
| 0.3 coset reading of `Rᵢ` | `A₃`, `b₁ = 0` | left cosets of `G₍₂₎ = ⊥` are the three singletons, bijective with `Δ₁ = {0, 1, 2}` via `r ↦ r 0` | “representatives, repetitions allowed” correct |
| 0.2 abstract form (inverses included) | `α = ℤ`, `S = {shift}`, `b = 0` | least set closed under `±1` containing 0 is `ℤ` = orbit; `ℕ` closed under `S` only, `ℕ ≠ ℤ` | identity and negative control correct |
| 0.2 route: closed-both-ways elements form a subgroup | `T` any subset | `g T ⊆ T ∧ g⁻¹ T ⊆ T` closed under `*` and `⁻¹`, contains `S` | route sound |
| 0.2 finite form | `Fin 4`, `S = {c[0,1]}`; `Fin 3`, `S = ∅` | orbits `{0,1}`, `{2}`; `{1}` | Checks exact |
| 0.2 finiteness hypothesis | `T` finite suffices (injective self-map of a finite set is onto); `Finite α` implies it | stated with `Finite α`, which is stronger than needed but true | no defect |
| Supplier contract: hom condition | `P.Group = PresentedGroup P.relatorSet`; `mem_relatorSet_iff` | relator set = `{t.toFreeGroup : t ∈ P.transcribed}` (pin, line 188); `PresentedGroup.toGroup` needs `∀ r ∈ rels, lift τ r = 1` | mathematics correct, names wrong (R01) |
| Supplier contract: commutator | `comm (inv r) (inv s)` | `toFreeGroup_comm_inv_inv` (pin, line 296): value `r⁻¹ s⁻¹ r s` | convention correct, name wrong (R01) |
| Scope: CertifiedPermutationComputation §2.2 | its README at the open head, lines 177–181 | reachability over generators and inverses ↔ orbit membership, for `Fin n` | citation resolves; instance of 0.2 as the README says |
| Downstream: CFSGBasicProperties P0 | main `README.md:69–73`, `:99`, `:310` | its text names a Hex checker and certificates; this README now says what it receives are the theorems 0.1–0.3 and the ten orders | consistent on this side; the consumer's wording is its own to align |

**Adversarial table, untouched statements (carried forward from the previous report, which computed them at `824bdaa`; the statements are unchanged at this head).** Tables A (the ten orders with base and basic orbits recomputed by a verified Schreier–Sims: 7920; 95040; 443520; 10200960; 244823040; 175560; 604800; 44352000; 898128000; 495766656000, each equal to the README and to the ATLAS page), B (all twenty-five per-carrier Checks), C (0.1 degenerate cases: `k = 0`, `S₃`, cyclic, `⊥`, `ℤ` with junk values; the conventions witnesses `b 0 = 3` versus `5` and `(a*b) 0 = 0`, `(b*a) 0 = 5` for M24), D (relator supports under the four sign choices for M23, M24, J1, HS, McL; exhaustive solutions for M11, M12, M22, J2) and E (nontriviality and the positivity hypothesis) of `PRREVIEW-SporadicOrders~2` apply verbatim: the generator transcriptions (twenty ATLAS files compared point by point) and the twenty theorems are byte-identical.

**Pinned declarations opened at this head.**

| File at the pin | Declaration, what was checked |
| --- | --- |
| `TauCeti/GroupTheory/Presentation/Relator.lean:75–85, 207–212, 296, 302, 321` | constructors `gen inv mul pow comm`; `toFreeGroup`; `toFreeGroup_comm_inv_inv`; `relatorSet`; `toWord_toFreeGroup`; no `eval`, `lift_toFreeGroup`, `commInvInv`, `eval_commInvInv` |
| `TauCeti/GroupTheory/Presentation/GroupPresentation.lean:180–214` | `relatorSet`, `mem_relatorSet_iff`, `relatorSet_eq_relatorSet_transcribed`, `Group`, `matchesMetadata`; no `homEquiv` |
| `TauCeti/GroupTheory/SpecificGroups/CFSG/Sporadic/McLaughlin.lean:160` | private `sourceComm r s := .comm (.inv r) (.inv s)` |
| `Mathlib/GroupTheory/GroupAction/Defs.lean:55` | `MulAction.mem_orbit_iff` (new in 0.2/0.3 *Needs*) |
| `Mathlib/Algebra/Group/Subgroup/Defs.lean:442, 447` | `Subgroup.mul_mem`, `Subgroup.inv_mem` (new in 0.3 *Needs*) |
| `Mathlib/Algebra/Group/Subgroup/Lattice.lean:375` | `Subgroup.closure_induction` |
| `Mathlib/GroupTheory/Index.lean:940` | `MulAction.index_stabilizer` |

**Sources sampled.** 0.1, 1.1, 1.2, 2.1, 2.2: untouched by the diff; their verification in the previous report (twenty ATLAS files, ten group pages, the `M24G1-P1` page, the pinned presentations) stands. 0.2: checked by computation above. 0.3: its only locator is Seress §4.1 (below). The resolver's one lead, `Hex.PermGroup.Kernel.card_closure` at `README.md:510`, is in the unchanged References and was resolved against the Hex repository at the cited commit in the previous review.

**Duplication and ownership.** The only object overlap previously found (the orbit lemma, R03) is now settled in Scope. Nothing in the 143 changed lines states a construction another roadmap owns: Mathlib at the pin has no sifting or stabilizer-chain membership lemma (`Mathlib/GroupTheory/Schreier.lean` stops at Schreier's lemma and the finite-index closure). CFSGBasicProperties P0 on main consumes rather than states it. Ownership against open pull requests was checked through the roadmaps tool for CertifiedPermutationComputation only; the brief's sibling checkouts do not include it.

## Not verifiable

- **Seress, *Permutation Group Algorithms*, §4.1 (the sifting procedure, cited at 0.3).** Cambridge University Press, paywalled; the sources service found no legal copy and recorded it in the missing-references file. The attribution is standard (sifting through a stabilizer chain is the content of that section) and the statement was verified by computation instead.
- **Dixon–Mortimer, Theorem 1.4A.** Paywalled (Springer); unchanged from the previous review.
- **`exists_surjective_Co3`, the AtlasRep file names, the J₂.2 remark.** Unchanged passages; as in the previous review.

## Source issues

- none

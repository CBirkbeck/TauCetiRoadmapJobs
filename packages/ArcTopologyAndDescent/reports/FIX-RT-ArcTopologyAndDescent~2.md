# FIX-RT-ArcTopologyAndDescent~2: repair of red-team round 2 (passes a and b)

Ten findings from two reviews. The overlapping CS24 locator findings are settled together. Results: 7 applied, 1 applied differently, 2 disputed. `Suggested.lean` is unchanged, because no finding affects a Lean statement.

This run restored the earlier attempt's edits after re-verifying them: the cited lines of CS24 (711, 723), BM21 (105, 464, 2054), BS17 (173, 384), STACKS (6868, 7001, 7011) and RYD10 (471, 802, 1023, 1036); EnhancedDerivedSheaves §§E1.6 and E2.8 on main; AdicSpaces §2.1 (`Completed/AdicSpaces/README.md` line 364); PerfectoidSpaces §P1.20 (*perfectoid-tate-ring-from-integral-perfectoid*, README line 4828 ff.); and ClassicalAdicEtaleCohomology §6.3 at its open head (Corollary 4.2.7(i), 4.2.7(ii) and the separably-closed `D⁺` statements).

## RT-ArcTopologyAndDescent~2a/F01, RT-ArcTopologyAndDescent~2b/F03 (P3) — applied

Old → new:
- §11.1 (README): "Text locators: CS24 line 692" → "CS24 lines 711 and 723". CS24 line 692 is the page-18 marker. §2.2.1 opens at line 711, and the finite-ideal clause is at line 723.
- `sources.toml` CS24: "CS24 lines 692 and 733" → "711 and 733".
- Worked examples, the other half of 2b/F03: "BM21 lines 100, 406 and 2052" → "105, 406 and 2054". Example 1.3 opens at BM21 line 105 and Example 6.8 at line 2054.

## RT-ArcTopologyAndDescent~2a/F02 (P3) — applied

In the §4.3 Checks, the bullet that only restated the definition is replaced by a computed Check. For the underlying-set functor F(A)=A and a rank-two aic V with middle prime p, V is identified with the compatible pairs in V_p×V/p. (1,1) is the image of 1. (1,0) is in the product but not in the pullback, because its residues 1 and 0 differ in κ(p)≠0.

## RT-ArcTopologyAndDescent~2a/F03 (P3) — applied

`sources.toml` BS17 locator: "Definitions 2.1 p. 4 and 2.13 p. 9; BS17 line 140" → "Definition 2.1, p. 4; BS17 line 173; Definition 2.13, p. 9; BS17 line 384". Line 140 is a page marker. Definition 2.1 opens at line 173 and Definition 2.13 at line 384; I checked both in the cached text.

## RT-ArcTopologyAndDescent~2a/F04 (P3) — applied

Huber pairs and `Spa` are AdicSpaces §2.1 (Layer 2), at `Completed/AdicSpaces/README.md` line 364, not Layers 0–1. Changes:
- Ownership row: now "AdicSpaces Layers 0–1 and §2.1".
- Supplier contract: §2.1 is named for Huber pairs, Spa and the map of spectra.
- §9.2 Needs and the Layer 9 Dependencies line: §2.1 added.

The other "Layers 0–1" citations stay as they are, because they use only completion, valuation spectra or completed tensors: §1.7 (Spv only), §8.4, §10.6, and Layers 1, 8 and 10.

## RT-ArcTopologyAndDescent~2a/F05 (P2) — applied

I confirmed both overclaims on main:
- EnhancedDerivedSheaves §E1.6 (README line 689 ff.) has Tor-independence of perfect algebras and no valuation decomposition.
- §E2.8 (line 2399 ff.) has inductive level and descendability, and no presheaf blowup criterion.

Changes:
- The ownership row and the EnhancedDerivedSheaves contract now say that E1.6 supplies perfect-algebra Tor vanishing and E2.8 supplies inductive level. Valuation splitting is assigned to §0.5 here, and both directions of the blowup criterion to §1.4 here.
- §1.4 no longer claims agreement with E2.8.
- §1.4 gains the h-sheaf ⇒ excision route: for sets, the equalizer argument; for spaces, the monomorphic leg makes the presheaf pushout a homotopy pushout. Source: BS17 lines 256–262 and 301–314.

## RT-ArcTopologyAndDescent~2b/F01 (P2) — applied

The witness holds:
- A universal submersion is a universal spectral submersion (BM21 Definition 2.14, line 464), hence an arc-cover (§2.7).
- RYD10 proves effective descent only for qc universally subtrusive maps (Theorem 5.17, line 1023) and for noetherian universal submersions (Corollary 5.18, line 1036).

So the old gap asked the supplier for a case of §6.6 itself. Theorem 5.17 is stated for quasi-compact étale spaces (E_qc, RYD10 Notation 5.1, line 802). Separatedness and finiteness also descend along universally submersive maps: the diagonal's closedness and universal closedness are checked through images, which a submersion detects. RYD10 Corollary 2.10 (line 471) makes universal submersions and universal subtrusions agree for locally finite type maps over a locally noetherian base, which justifies the finite-type reduction in §6.6. Changes:
- The gap `constructible-etale-space-descent` (README and `plan.json` `gaps[2].needs`, identical text) now asks for effective descent along v-covers, that is qc universally subtrusive maps. It covers étale algebraic spaces together with their separated and finite subcategories, citing RYD10 5.17/5.18, plus the constructible-sheaf equivalence.
- The §6.6 route imports v-descent only. Descent along the rank-two split comes from §4.6.
- RYD10 manifest: locators added for Notation 5.1, Theorem 5.17 and Corollary 5.18.

## RT-ArcTopologyAndDescent~2b/F02 (P2) — disputed

The reviewer read only the first theorem of ClassicalAdicEtaleCohomology §6.3 at its open head. The same section also states:
- **Torsion-sheaf total-cohomology invariance:** valuation domains with separably closed fraction fields, surjective (equivalently injective local / faithfully flat) q, any A-scheme X, and torsion prime to char(X), with no uniform exponent (HUB96 Corollary 4.2.7(i)).
- **The derived adjunction unit F[0]→Rp_*p*F[0]**, as an isomorphism under the same hypotheses (Corollary 4.2.7(ii)).
- **A separately stated separably-closed version** of the ℓ-power `D⁺` invariance.

These are exactly the hypotheses the README attributes to §6.3: separably closed fraction fields, an arbitrary scheme X, and torsion invertible on X ("prime to char(X)" is the same condition). Narrowing the contract would discard supplied generality, so the proposed replacement is not applied.

The README sentence did leave open whether it meant sheaves or complexes. One clarifying edit: "for abelian torsion sheaves F" is added, plus one sentence pointing to the bounded-below complex form, which needs qcqs X and ℓ-power coefficients with ℓ invertible on the base. Both consumers (§10.5 and §12.2) use affine X and ℓ invertible in V, so both forms cover them.

## RT-ArcTopologyAndDescent~2b/F04 (P3) — applied differently

The reviewer's witness is false: the cached STACKS extraction does carry tags.
- Line 6868: section 82 has tag 09Z8.
- Line 7001: Lemma 82.6 has tag 09ZH.
- Line 7011: Theorem 82.7 has tag 09ZI.

So the reference line was correct, and the proposed "09Z8 and 09ZI" would have mislabelled Lemma 82.6. The real defect was inconsistent tag labelling. Fix: both passages now give all three tags with their roles, "section tag 09Z8, Lemma 59.82.6 tag 09ZH, Theorem 59.82.7 tag 09ZI".

## RT-ArcTopologyAndDescent~2b/F05 (P3) — disputed

PerfectoidSpaces §P1.20 contains the supporting result *perfectoid-tate-ring-from-integral-perfectoid* ([BMS] Lemma 3.21; PerfectoidSpaces README line 4828 ff.). It says that a π-torsion-free integral perfectoid R₀ with π^p | p has R₀[1/π] perfectoid Tate, and describes R°. Applied to the p-torsion-free image of A, this makes A[1/p] perfectoid Tate. §P1.25 itself cites that result as "P1.20" (line 5118). The P1.20 citation is therefore correct.

The README now names the supporting result explicitly in the ClassicalAdicEtaleCohomology contract and in §12.2, so readers are not sent to the untilt statement. The Needs/Dependencies citations are unchanged.

## Checks run

- **Tau Ceti module:** the object file of `TauCeti.RingTheory.Huber.TopologicallyFiniteType` was already present, so no build was needed.
- **Elaboration:** `lake env lean packages/ArcTopologyAndDescent/Suggested.lean` exited 0. The only output is five `declaration uses 'sorry'` warnings, at lines 57, 69, 91, 113 and 124; the Mathlib module-system warning no longer appears.
- **Elaborated signatures:** I elaborated a scratch file (exit 0) with `#check @name` for all ten declarations and compared each type with its README statement (§§2.7, 7.8, 10.0, 10.8). All binders and instances are present. The types are the same as in the worker's signature list, and nothing changed.
- **Dependency check:** `gate --depcheck … --movable` printed `depcheck: 201 roadmaps, 1422 edges, 0 problem(s)`. There are no UPWARD, CYCLE or moved lines.
- **Citations:** `roadmaps resolve` on the edited README reports no cross-roadmap citations found nowhere and no Lean names found nowhere.
- **Gap consistency:** all four `plan.json` gap slugs appear under "Exact supplier contracts". Three `needs` texts are identical to their README lines. For `coherent-topos-pushouts`, the README line equals `needs` followed by one sentence on ownership; that line was not touched in this round.

## Gate failures

- **Warning "imports `Mathlib` … designed for use with the module system; consider adding `module`" (reported twice):** applied. `Suggested.lean` now opens with the line `module`, followed by the unchanged imports `import Mathlib` and `import TauCeti.RingTheory.Huber.TopologicallyFiniteType`. Nothing else in the file changed. The declarations keep their statements, and the line numbers are shifted by two. The file elaborates with exit 0 and only the five `sorry` warnings. In a scratch worktree, the gate's import checks (`imports`, `no-import-mathlib`, `mathlib-subimports`) all report 0 for this form.

## Adversarial pass on new or changed statements

| Statement | Instances tried | Values | Result |
|---|---|---|---|
| §4.3 set-functor Check | rank-two V, middle p; pairs (1,1), (1,0) | (1,1) has residues 1,1 and comes from 1∈V. (1,0) has residues 1≠0 in κ(p)≠0, so it is not in the pullback. For p=0: V_p=Frac V, κ=Frac V, pullback = V/0 = V. | holds |
| gap: v-cover étale-space descent | rank-two split V→V_p×V/p; fold V⊔V→V; fpqc cover | Rank-two split: arc, not v (BM21 Example 1.3), so excluded. Fold: v (has a section), so included. Universally open surjection (e.g. flat finitely presented surjection): universally subtrusive (RYD10 Remark 2.5, recalled at line 1044), so included. | contract no longer contains a case of §6.6 |
| §6.6 route | finite-type Z-scheme target | v-covers = universal submersions (noetherian, RYD10 Cor 5.18 applies); aic-v-excision supplies the rank-two split | consistent with BM21 lines 1656–1661 |
| §1.4 forward direction | Z=X, E=Y (nilimmersion case); Y=∅ forces X=∅; identity blowup | F(Y)=F(X)×_{F(X)}F(Y). For Z=∅: E=∅ and F(Y)=F(X)×F(pt) with X→Y an isomorphism. Identity: F(Y)=F(Y)×_{F(Z)}F(Z). | holds; BS17 lines 256–262 |
| §1.4 space-valued step | leg E→X is a closed immersion | The presheaf of sets F_E(U)→F_X(U) is injective, so the set pushout is a homotopy pushout (BS17 lines 305–313). | holds |
| AdicSpaces §2.1 citation | (K,O_K) | The rank-one point of Spa(K,O_K) and its identity pullback need §2.1 Spa, not Layer 1 Spv. | holds |
| §6.3 contract clarification | §10.5 instance: aic rank-one V, W=V, ℓ prime to residue characteristic, X=Spec(R⊗_V R′) affine, F_ℓ coefficients; imperfect separably closed fraction field | Sheaf form: separably closed fields, X arbitrary, ℓ invertible on X, so it applies and gives F_ℓ. Complex form: X affine, hence qcqs, and ℓ is a unit of V, so it applies. Imperfect separably closed case: admitted by both supplier statements (HUB96 4.2.7(i) and the separably-closed D⁺ version). | holds |
| Stacks tags | cached text lines 6868, 7001, 7011 | 09Z8 = §82, 09ZH = Lemma 82.6, 09ZI = Theorem 82.7 | consistent in both passages |

## Notes for the maintainer

- **`plan.json` stale node ids:** outside `gaps`, `design/plan.json` still records the node ids `EnhancedDerivedSheaves:E1/valuation-decomposition-triangle` and `EnhancedDerivedSheaves:E2/abstract-blowup-squares`, along with the old §1.4 statement text. Under this job's edit rules I could only change the `gaps` list. The README is now authoritative: §0.5 and §1.4 here own those results.
- **Supplier gap changed:** `gap:constructible-etale-space-descent` (supplier SchemeAndStackFoundations §§1.2–1.10) now asks for less, namely v-covers instead of universal submersions. It also names the separated and finite subcategories explicitly.
- **Names:** no Lean names changed, and no other roadmap cites a changed name.
- **Ownership:** checked by object against main and the open-head index through `roadmaps grep`/`show` for the cited suppliers. No new carrier was introduced.
- **Leftover resolver leads:** the worker's earlier citation leads (`Arc.Cover.ofVCover`, `Etale.artinSchreier_vanishing`, `Topos.isQuasiseparated_iff_of_cover`) come from the pre-repair run and are untouched by these findings. The resolver on the repaired README lists none.
- **Untrusted text:** nothing in the reviews or fetched texts asked for actions outside the job.
- **`module` header:** this is the first `Suggested.lean` of the roadmaps on main to open with `module`. A roadmap that has it puts its declarations in the module system's default (non-`public`) scope. That is harmless for an acceptance test that nothing imports.

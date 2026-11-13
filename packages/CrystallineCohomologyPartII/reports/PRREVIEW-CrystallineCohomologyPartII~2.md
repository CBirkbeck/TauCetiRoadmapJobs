# Review of CrystallineCohomologyPartII (pull request #2265 at f0dfe4d)

**Verdict:** accepted

Incremental re-review of the 13 lines changed since `8bd69be` (`TauCetiRoadmap/CrystallineCohomologyPartII/README.md` only). No finding.

## Deferred findings

- D01 — stands

## Previous findings

- R01 — not repaired: deferred (D01)
- R02 — repaired: the Checks at former lines 517 and 558 are deleted; §1.3 and the Layer 1 Examples now compute the cusp, "B′ = k[t] `×_{k[t]/(t²)}` k = k + t²k[t] = k[t², t³], so Y′ = Y".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.3 finite pushout, new cusp Check (line 448; Examples line 522) | A = k[t², t³], J = (t², t³); both charts; wrong model H⁰(E, O_E) for A/J | A[t³/t²] = k[t]; A[t²/t³] = k[t, t⁻¹]; JO_X = t²k[t]; B′ = k + t²k[t] = A; wrong model k[t] | Y′ = Y; K = t²k[t], B′/K = k as in (ii); k[t²,t³] → k[t] ⊕ k → k[t]/(t²) exact as in (iv) | none |
| §1.3 against its second Check (π finite: Ferrand pinching) | same cusp | pinching of Spec k[t] along Spec k[t]/(t²) → Spec k is k + t²k[t] | the two Checks agree | none |
| §5.6 (i), new Check (line 1284) | affine cone over a smooth plane cubic E, ordinary and supersingular | R¹f_*WO_{X,ℚ} = H¹(E, WO_{E,ℚ}): rank 1 (slope 0), rank 2 (slope ½); torsion-free, no power of p kills it | not WO-rational; agrees with §2.2 (CR12 line 4301), §0.8 and the second Check of §5.5 | none |
| §6.12, new Check (line 1746) | elliptic curve E, L an algebraic closure of k(E), all n including powers of p | E[n](L) = E[n](k̄) (finite k-scheme); η not a k̄-point, so of infinite order; Pic⁰(E_L) = E(L) | [η] − [O] ≠ 0 in CH_0(E_L) ⊗ ℚ; u constant on fibres, u^(2) lands in the diagonal, not dominant | none |
| Checks deleted at §1.6, §2.1, §5.9, §6.6, §6.14 | each against its statement | each is an instance of its own statement with no value; the remaining Checks of each section compute values (Mayer–Vietoris, canonical cone, nodal cubic, conics and F₉, 9 ≡ 4 mod 5) | no section left without a Check; no remaining text cites a deleted Check | none |

The rows for the untouched statements stand as in the previous review, of `8bd69be`.

- Source locators: the diff adds none and removes one (Kol96 V.2.13 in a deleted Check, still cited in §6.11, §6.12 and the Layer 6 Examples); the one source statement a new Check relies on, CR12 Corollary 4.6.4 (CR12 line 4301), supports §2.2 as used.
- Internal citations of the new passages resolved at this head: §2.2, §0.8, §6.10, §6.11, §1.3; all exist and state what is used.
- `Suggested.lean` is unchanged since `8bd69be`; `lake env lean` on it: five `sorry` warnings and nothing else.
- Gate at this head: every check passed (all counters 0). No change outside the folder.
- Dependency check: `depcheck: 222 roadmaps, 1971 edges, 0 problem(s)`.
- Pull request text read against this head: no sentence contradicted; the change removes no section, declaration or supplier.
- Overlap check: read CrystallineCohomology, PadicDifferentialEquationsAndRigidCohomology, ArcTopologyAndDescent, SchemeAndStackFoundations, EnhancedDerivedSheaves; the change moves no object, owners as in the previous review (convergent-coefficient descent and Cartier transforms: D01).
- Source independence: changed passages only; 4 passages compared with 3 sources (BS17, CR12, ESN03), none shared (the cusp, the cubic cone and the elliptic-curve computations occur in none of them); largest share CR12, 102 of 280 locators; no layer added, removed or reordered, so contents not compared again.
- Remark: the Layer 5 and Layer 6 Examples keep four of the sentences deleted from the Checks (lines 1428, 1431, 1800, 1802); Examples are not Checks, no change asked.

## Not verifiable

- Nothing in the changed passages. The items of the previous review (Stacks tags 02RH and 0BED; the eight uncertified sources; §5.12 (ii) in its shifted form) stand.

## Source issues

- none

## For the human reviewers

- **Scope.** `README.md` §§1.3–1.5 and §5.12 (ii) state results in a form no cited source prints (a constructed pushout and universal descent for BS17 Proposition 11.41; a degree-shifted form of CR12 Theorem 4.8.1).
- **Licence.** Ser58Top was read from a copy of the whole proceedings volume on a third party's university page; its status was not settled.

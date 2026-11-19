# Review of ChevalleyGroups (pull request #2544 at bc52043)

**Verdict:** accepted

**Summary.** Accepted: no finding remains. The three sentences about the adjoint torus and the roadmap's generality that the previous review held (R01) now say what is true: the range of the full-weight parametrization "can be" smaller, with the `PGL₂(ℚ)` witness, equality over algebraically closed fields and for `E₈`, `F₄`, `G₂`, and statements hold over the fields and rings they name. The comparison from `G_sc(t)` to the adjoint form is now also stated over `ℤ`, and §5.8 and §6.2 are attributed. There are no small corrections and no format notes. Left for the human reviewers: Steinberg's *Lectures*, which holds half the locators, could not be read.

## Questions for the author

- The References cite the 2016 AMS edition of Steinberg's *Lectures* "whose chapter numbering is cited here". Do its theorem and lemma numbers (Chapter 3, Lemmas 15, 19 and 28(c),(d), Theorems 4 and 4′, Corollaries 3 to 5; Chapter 6, Theorem 8; Chapter 10, Theorems 28 and 29) agree with the 1967 Yale notes? No legal copy of either edition could be read, so the numbers are unchecked. (Asked in the previous review; not answered.)

<details><summary>What was checked</summary>

- Incremental re-review of the 91 lines changed since 8b4e3f4: Convention 5, the introductions of Layers 3 and 5, §5.8, §6.2, §6.3, the scope sentence, two supplier-contract bullets, and in `Suggested.lean` the module docstring and the new `exists_scGroupScheme_hom_geckGroupScheme`.
- Automatic checks: all passed. The check that every supplier this roadmap cites comes before it in the merge order, and that no chain of citations leads back to it, reports 200 roadmaps, 2197 edges, 0 problems: no upward citation and no cycle.
- Elaboration: `Suggested.lean` gives 10 warnings, all `sorry`, and no error. One tactic (`simp`, `infer_instance`, an anonymous constructor with a default or zero morphism) does not close the new statement. The file has no section `variable`s, so no binder can be dropped.
- Pull request text: the description agrees with the head (ten statements, three removed and eight added declarations, the paragraph on the adjoint torus, the §5.8 basedness clause, the attribution of §5.8 and §6.2). No change outside the folder.
- Not verifiable: Steinberg, *Lectures on Chevalley Groups*, and Steinberg, *Memoirs AMS* 80, as before.

</details>

## Previous findings

- R01 — repaired: "over a field that is not algebraically closed its image can be smaller than `T_D(k)` (for adjoint `A₁` over `ℚ` it misses `[diag(2, 1)]`, §2.5)"; Layer 5 introduction and scope sentence rewritten likewise.
- C01 — repaired: `exists_scGroupScheme_hom_geckGroupScheme` states a morphism `G_sc(t) ⟶ geckGroupScheme t ht` over `ℤ` whose composite with each `kostantRootSubgroupToToral` is `geckRootSubgroup`; README §6.3 states it in prose with the same hypotheses.
- C02 — repaired: §5.8 "*Route* (this roadmap's own argument)"; §6.2 "The argument is this roadmap's own."
- Question on Steinberg's editions — not answered; asked again.

## Verified sound

| Statement | Instances tried | Values computed (text / computed) | Result | Change |
|---|---|---|---|---|
| Convention 5; Layer 3 intro; Layer 5 intro | adjoint `A₁` over `ℚ`, `𝔽₂`, `𝔽̄_p`; `G₂` | range `{[diag(s²,1)]}`, `det 2` not a square: misses; `T(𝔽₂)=1`: equal; `kˣ` divisible so `Ext¹(P/Q,kˣ)=0`: onto; `P=Q`: identity | "can be smaller" true in every case | none |
| Layer 5 intro, "other types" | cokernel of `Hom(P,ℚˣ)→Hom(Q,ℚˣ)` for a cyclic factor `ℤ/n` of `P/Q` | `ℚˣ/ℚˣⁿ ≠ 1` for `n ≥ 2`; `[diag(2,1)] ∉ PSL₂(ℚ)` | holds | none |
| Scope sentence | §4.5, §§5.6–5.7 (algebraically closed), §5.4 (characteristic `p`) | "over the fields and rings its statements name": no universal claim left | holds | none |
| 5.8 basedness clause | `Frob_p` on `𝔽_p(t)`; `γ_σ∘Frob_q` over `𝔽̄_p` | image of `x_α` is `x_α(kᵖ) ≠ x_α(k)`: not onto; over `𝔽̄_p` onto, positive to positive | restriction to algebraically closed `k` is right | none |
| 6.2 attribution | `SL₂ → PGL₂` over `ℚ` | `res(diag(s,s⁻¹)) = [diag(s²,1)]`, cokernel `ℚˣ/ℚˣ²` | unchanged mathematics; attributed | none |
| 6.3 / `exists_scGroupScheme_hom_geckGroupScheme` | `A₁`; `G₂`; zero morphism; pin `geckRootSubgroup` (`GeckLattice/GroupScheme.lean` l.222), `kostantRootSubgroupToToral` (`ToralClosure/Basic.lean` l.250), `geckGroupScheme` l.148 | `SL₂→PGL₂`, kernel `μ₂`; `P=Q`: isomorphism; trivial map fails the clause since root subgroups are monomorphisms (`mono_kostantRootSubgroupToToral`); index type `Fin t.rank ⊕ Fin t.rank` on both sides | true; determined by the clause; not padding | none |
| 6.3 locator in the new docstring | Conrad2014 l.8159–8163 | Theorem 6.1.16(1): a morphism of root data is induced by an isogeny compatible with the splittings, unique up to `(T/Z_G)(S)` | supports the citation | none |
| 6.3 / `exists_scToGeckPoints` (cited by the changed text) | `A₁` over `ℚ`, `𝔽₂` | kernel `{±1}`; trivial, both groups of order 6 | unchanged, holds | none |

The rows for the untouched statements stand as in the previous review, of `8b4e3f4`.

- Source locators checked against the text: 1 (Conrad2014, Theorem 6.1.16(1), in the new docstring); the changed README passages add no locator. The seeded targets 5.8 and 6.2 fall in the change and now carry no source by statement (own arguments); 14 Steinberg locators remain unreadable.
- Library declarations opened at the pins: `kostantRootSubgroupToToral` (`ToralClosure/Basic.lean`, l.250), `mono_kostantRootSubgroupToToral` (`ToralClosure/RootInToral.lean`, l.94), `geckGroupScheme` and `geckRootSubgroup` (`GeckLattice/GroupScheme.lean`, l.148, l.222). The pinned Tau Ceti has no morphism from the toral closure of `V_sc(t)` to `geckGroupScheme`.
- Cross-roadmap citations resolved on main: ReductiveGroups §9B.2 (l.4669); no new citation in the change.
- Automatic checks: all passed; supplier-order check 200 roadmaps, 2197 edges, 0 problems.
- Elaboration: 10 `sorry` warnings, no error; the one-tactic probe does not close the new statement.
- Ownership against open pull requests: no open pull request changes this roadmap, drops an id it cites or is cited for an id it drops.

Overlap check: read ReductiveGroups, CFSGStatement and LieHighestWeight; the integral open cell, smoothness, fibres, central isogenies and scheme-level special isogenies are owned by ReductiveGroups §9B, Serre's theorem by LieHighestWeight §7.1; nothing else is shared.

Source independence: changed passages only; 6 passages compared with 1 source (Conrad2014), none shared; largest share Steinberg's *Lectures*, 14 of 27 locators, whose text and contents page could not be read; the change adds, removes or reorders no layer, so the arrangement was not compared again (previous result: independent of Conrad2014).

Research link: Layers 2–7 are the Chevalley–Steinberg theory of Chevalley groups and their endomorphisms (Steinberg 1967; Steinberg, *Memoirs AMS* 80, 1968) and the Chevalley–Demazure group schemes (SGA 3; Conrad 2014), on which the finite groups of Lie type of CFSGStatement and CFSGBasicProperties are built. Rests on the README (Summary, Downstream consumers, References) and Conrad2014.

## Not verifiable

- Steinberg, *Lectures on Chevalley Groups*: Ch. 1 Thm 1; Ch. 3 Lemmas 15, 19, 28(c),(d), Thms 4 and 4′, Cors 3–5; Ch. 5 Thm 7; Ch. 6 Thm 8; Ch. 10 Thms 28, 29. No legal copy could be read.
- Steinberg, *Endomorphisms of linear algebraic groups*, Memoirs AMS 80 (1968): cited in the References only; not opened.

## Source issues

- none

## For the human reviewers

- Not tested: Steinberg's *Lectures on Chevalley Groups* holds the largest share of locators (14 of 27, at 11 README sites, plus three docstrings of `Suggested.lean`) and could not be read legally. Wording and arrangement were not checked against it.

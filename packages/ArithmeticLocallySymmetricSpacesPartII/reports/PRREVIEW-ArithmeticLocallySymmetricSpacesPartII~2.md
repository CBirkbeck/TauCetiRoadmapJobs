# Review of ArithmeticLocallySymmetricSpacesPartII (pull request #2401 at 568b4e2)

**Verdict:** accepted

## Previous findings

- R01 — repaired: `Suggested.lean` lines 65–66 read "(Representation.piTensorProduct fun σ => (TauCeti.symPowerRep ℂ 2 (t σ)).comp (embeddingStdRep σ Γ))". README §3.1, From Tau Ceti, the §3.1 *Needs:* line and the Layer 3 Dependencies now cite it, and the README no longer mentions `PiTensorProduct.mapMonoidHom` or `MonoidHom.pi`.
- R02 — repaired: §1.1 reads "*Needs:* LocallyAnalyticDistributionsPartII §5.2; NoncommutativeAndEquivariantIwasawa §F.1; NoncommutativeAndEquivariantIwasawa §0.15; CompletedCohomologyPartII §3.1."
- R03 — repaired: the summary block reads "Completed-homology descent gives Fu's bound … and its group-cohomology form `finrank_groupCohomology_weightRep_le`. A lower bound from the Finis–Grunewald–Tirao base-change count completes two-sided linear Bianchi growth".
- R04 — repaired: the description reads "degree-zero group homology … has dimension a·∏(k_i+1) up to a nonnegative multiaffine error with no full-product term, and every higher homology group is bounded by the same error, uniformly in the degree."
- R05 — repaired: the sixteen bullets are deleted, along with two more of the same kind (§4.3 "No claim that κ^{1−d} dim S_κ converges", §4.4 "This is an upper bound at arbitrary level"). Each scope limit is still stated in prose: §3.2 "carries upper bounds from K′_f to K_f, never lower bounds"; §3.4 "Degeneration … is not used"; §5.6 "No asymptotic leading constant … for the entire cuspidal space"; §5.8 "the upper bound alone for cusp forms".

## Verified sound

| Target | Instance | Roadmap value | Computed / source value | Result |
| --- | --- | --- | --- | --- |
| §3.1 `weightRep` (new body) | the previous head's body; any Γ, t | the action is `Representation.piTensorProduct` of the factors | pointwise equal to `PiTensorProduct.mapMonoidHom.comp (MonoidHom.pi …)`, checked in Lean through `piTensorProduct_apply`; `rfl` fails only because the definition is not exposed | holds |
| §3.1 pure-tensor API bullet | γ ∈ Γ, ⊗_σ v_σ; F = ℚ(i), γ = (i 1;−1 0), t = (1,1); t = (1,0) | ⊗_σ Sym^{t_σ}(σ(γ))v_σ; trace on E₁ is 1; −I acts by −1 | the Lean `example` closes with `piTensorProduct_apply_tprod`; i·(−i) = 1, while one embedding on both factors gives i² = −1; (−1)^{1+0} = −1 | holds |
| §3.1 dimension | t = 0 over ℚ(i); signature (1,1), t = (2,2,2) | 1; 27 | 1·1 = 1; 3·3·3 = 27 (`Basis.piTensorProduct`, finrank n+1) | holds |
| §1.1 (new *Needs:*) | M = A, k = (1,2); one-dimensional W with character a | 6 = 6; dim W both sides | D(2,3) = 2·3 = 6; a·a⁻¹ = 1; fu24 line 1120; §F.1 at its head proves the quotient topology and continuity | holds |
| §3.2 new sentence (upper bounds only) | F = ℚ, K = SL₂(Ẑ), K′ = Γ(3) of index 24; coefficients ℂ and Sym¹⁰ | lower bounds do not transfer from K′ to K; upper bounds do | H¹: 3 at Γ(3) (2g+c−1 = 0+4−1) but 0 at SL₂(ℤ); Sym¹⁰: 3 at SL₂(ℤ) ≤ 2·9+4 = 22 at Γ(3) | holds |
| §3.2 locator | fu24 §7 p. 23; Thm 1.2 p. 2 | odd split p; any fixed K_f | fu24 line 1152 (odd p, completely split), line 1169 (K_f = GK^p), line 89 (any fixed K_f) | holds |
| `finrank_groupCohomology_weightRep_le` | ℚ(i), SL₂(ℤ[i]): t = 0 with i = 0, 1; t = (1,0); t = (n,n), a = n+1 | dim ≤ C; vanishing; dim ≤ C(n+1) | H⁰ = 1, H¹ = 0 (finite abelianisation); −I acts by −1, so H^i = 0; (n+1)·dim ≤ C(n+1)² | holds |
| `bianchi_groupCohomology_linear_growth` | ℚ(i), SL₂(ℤ[i]), n = 99, 100; n = 0 | base-change parts 33.3 and 8.4; n₀ needed | slopes 5/24 ± 1/8 = 1/3, 1/12; 100/3, 101/12; H¹(·,ℂ) = 0; −I acts by (−1)^{2n} = 1 | holds |
| §5.6 (two Checks deleted) | ℚ(i); u = 2 | A−B = 1/12; A/B = 3 | 5/24 − 3/24 = 1/12 > 0; (9/24)/(1/8) = 3 | holds |

The rows for statements this change leaves untouched stand as in the previous review, of `b6c4a2b`.

- Gate, re-run at this head: every check passes (`depcheck=0 … outside-folder=0 source-material=0 OK`). Dependency check: `depcheck: 238 roadmaps, 2254 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The merge order lists this roadmap at line 209, after LocallyAnalyticDistributionsPartII (208) and CompletedCohomologyPartII (188).
- Elaboration: `lake env lean` on `Suggested.lean` gives only the two `sorry` warnings. In a scratch copy, the `#check @` types of all 4 declarations match `signatures.md` and README §§3.1, 4.2 and 5.8: no binder is lost. A one-tactic `simp` probe on the first theorem makes no progress, so there is no padding.
- Library declarations opened at the pin: Tau Ceti `Representation.piTensorProduct` (TauCeti/RepresentationTheory/Tensor/Pi/Basic.lean:48; `CommSemiring R`, `Monoid G`), `piTensorProduct_apply` (:53) and `piTensorProduct_apply_tprod` (:58). The new import's module is built at the pin.
- Cross-roadmap citation resolved: NoncommutativeAndEquivariantIwasawa §F.1 at its open head.
- Source locators re-checked in the changed passages: 5 (fu24 §1 p. 1, §6 p. 22, §7 pp. 23–24, Thm 1.2 p. 2; marshall12 §2.1 pp. 3–4). The other sampled targets (§§1.3, 2.1, 4.2, 4.3, 5.2, 5.3, 5.6, 5.7) lost only Checks, and their statements and locators did not change.
- Checks remaining in the sections that lost bullets: every section keeps at least one computed Check, and §2.1, the one definition with an API list among them, keeps three. The prose cites only Checks that remain (§5.3 N = 3; the §4.2 Sym¹⁰ value).
- Pull-request text, checked against this head: title, summary block and prose agree with it. "BianchiModularForms is named only under Scope and ownership and in one Check of §5.2" matches README lines 38, 40 and 608. The validation figures match the gate.
- Outside-folder diff: empty. Main has no copy of this roadmap.

Overlap check: read LocallyAnalyticDistributionsPartII, CompletedCohomologyPartII, AutomorphyLiftingBeyondTaylorWiles, QuaternionicModularForms and TorsionCohomologyInfrastructure, the open list ranked by shared vocabulary; the corresponding list for roadmaps on main and the list ranked by named results are empty. This change adds no object of its own. It cites only Tau Ceti `Representation.piTensorProduct`, which `roadmaps grep` finds in no other roadmap. Nothing is shared.

Source independence: changed passages only; 4 passages compared with 2 sources (fu24, marshall12), none shared: the §3.2 added sentence against fu24 §7 (lines 1150–1181), the §3.1 clause and API bullet against fu24 §1 (lines 33–46) and marshall12 §2.1 (lines 103–143), and §1.1 against fu24 line 1120. The new From Tau Ceti sentence shares only the standard phrase "tensor product of a family of representations" with the library docstring. Largest share: fu24, 32 of 52 parenthetical locators, unchanged. Contents compared with fu24 §§1–7 at `b6c4a2b`: independent. That result stands, and the contents were not compared again, because the diff adds, removes or reorders no layer.

## Not verifiable

- None in the changed passages. The two items of the previous review (fgt10 Lemma 4.19 traces at p = 2; the local-type sum fgt10 omits in Theorem 4.17) concern untouched statements and stand.

## Source issues

- **Misprint** in fu24 at Theorem 1.2, (3), p. 2: the source says the minimum runs over 1 ≤ i ≤ r = [F:ℚ] of an (r₁+r₂)-tuple; it should run over the r₁+r₂ place weights; affects nothing.
- **Misprint** in fu24 at equation (2), p. 2: the source says compactly supported cohomology; it should be Marshall's interior subspace, since for Bianchi n > 0 dim H¹_c exceeds dim H¹_! by the number of cusps; affects nothing.

## For the human reviewers

- none

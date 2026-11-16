# Review of NashBlowups (pull request #2413 at dd3e0e3)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: §2.5 line 1031 now cites "nashModificationNotes2024, Section 1, lines 110–111, for an embedded variety over an algebraically closed field"; §2.6 line 1060 and §7.1 line 1670 now say "the statement is this roadmap's own".
- R02 — repaired: the description's paragraph now reads "Suppliers not yet on main … AlgebraicModuliForArithmeticGeometry §§1.3 and 5.4 … DerivedDeRhamCohomology §0.23 … Suppliers on main: SchemeAndStackFoundations §§0.7, … EnhancedDerivedSheaves §E1.6; … AdicSpacesPartIII §R3.6 … named only to mark the boundary".

## Verified sound

| Target | Instance | Roadmap side | Other side (computed, or source at locator) | Result |
|---|---|---|---|---|
| §2.5 *nashBlowupHom_isIso_of_smooth* (new locator) | `𝔸¹_k`, `d=1`; `Spec k`, `d=0`; `𝔸²⊔𝔸¹`, `d=2` | `Gr₁(O·dx)=X`, so `X*=X`; `Gr₀(0)=X`, so `X*=X`; `X*=𝔸²≠X` | first two smooth of rel. dim `d`, so `ν` iso; third has no rel. dim `2` and is excluded; nashModificationNotes2024 lines 110–111 | holds |
| §2.5, negative control | `Spec 𝔽_p(t^{1/p})` over `𝔽_p(t)`, `d=0` | `Ω=K·dy` of rank `1`, smooth locus `∅`, `X*=∅`, `ν` not iso | not smooth, so the hypothesis fails; nothing contradicts the corollary | holds |
| §2.6 *nashBlowup.baseChange* (new mark) | `V(x²−2y²)` over `ℚ`, `k'=ℚ(√2)` | `X*=𝔸¹_{ℚ(√2)}`, one closed point over `0`; `(X*)_{k'}=𝔸¹⊔𝔸¹` as `ℚ(√2)⊗ℚ(√2)=ℚ(√2)²` | `X_{k'}`: lines `x=±√2y`, tangent quotients `[√2:±1]` distinct, so `(X_{k'})*=𝔸¹⊔𝔸¹` | holds |
| §2.6, inseparable `k'` | `C: x^p+y²+t=0` over `𝔽_p(t)`, `p` odd, `k'=k(t^{1/p})` | `J_C=(2y)=(y)`, a nonzerodivisor, so `C*=C` and `(C*)_{k'}=C_{k'}` | `C_{k'}: u^p+y²=0`, reduced; `J=(pu^{p−1},2y)=(y)`, so `(C_{k'})*=C_{k'}`; nobile1975 lines 147–148 | holds |
| §7.1 *nashIterate_of_smooth*, *normalizedNashIterate_of_smooth* (new mark) | `𝔸¹`, `d=1`; `C` above | `X^{(i)}=Y_i=𝔸¹` for every `i`; `C`: `X^{(i)}=Y_i=C`, not smooth | `𝔸¹` normal and `ν` iso give `ν̄` iso (§6.4); `C` lies outside the hypothesis, the converse fails | holds |
| §7.1, negative control | `𝔸²⊔𝔸¹`, `d=2` | smooth but not in the Setting: excluded | `X^{(1)}=𝔸²≇X`: the Setting hypothesis is needed | holds |
| §6.4 (cited by §7.1) | cusp in char `2`; `𝔸¹` | `ν` iso, `X` not normal, so `ν̄` not iso; `𝔸¹`: `ν̄` iso | `ν̄=𝔸¹→cusp` bijective, `k[t²,t³]≠k[t]`; nashModificationNotes2024 lines 515–517 | holds |
| §0.3 (cited by §§2.5, 7.1) | `Spec ℚ(i)` over `ℚ`, `d=0`; `𝔸²`, `d=2` | rel. dim `0`; `2`; `X_sm^{(d)}=X` | `𝔸²⊔𝔸¹` is not pure and is excluded; stacksAlgebra line 17618 | holds |

Rows for the statements the change does not touch stand as in the previous review, of `f8bd785`.

- Source locators: 2 new ones checked, nashModificationNotes2024 lines 110–111 (§1.2, printed p. 3; its setting, integral over algebraically closed `k`, at lines 99–100) and nobile1975 lines 147–148 (proof of Theorem 2, printed p. 300). Both are at the stated line and match the README's description.
- Library: Tau Ceti `preimage_smoothLocus_le_smoothLocus_pullback_snd` (`TauCeti/AlgebraicGeometry/Morphisms/Smooth/Locus.lean:53`) and `isPureDimensional_pullback_Spec_map_iff_of_field` (`TauCeti/AlgebraicGeometry/Scheme/KrullDimension.lean:263`) opened at the pin. Their statements match §2.6.
- Internal references of the changed text: §§0.2, 0.3, 1.1, 1.2, 1.5, 2.3, 2.5, 6.4 resolve. §6.4 (`ν̄` iso iff `X` normal and `ν` iso), together with §2.5, gives the §7.1 induction step.
- Gate: passes every check, both in the worker's run and in a rerun at this head. Dependency check: `depcheck: 235 roadmaps, 2240 edges, 0 problem(s)`, with no UPWARD or CYCLE line. Nothing changes outside the folder.
- Elaboration: `Suggested.lean` is unchanged since `f8bd785`. `lake env lean` gives only two `declaration uses sorry` warnings. `#check @` of the 3 declarations agrees with README §§0.7, 4.4 and 5.4, with no binder lost. The padding probe stands.
- Pull request text: the title, summary block and prose agree with this head. The Dependencies paragraph names the suppliers in README lines 342–395, plus the two citations used only for scope.
- Overlap check: closest roadmaps as listed, SchemeAndStackFoundations (main and its open revision), PurityOfBranchLocus, DirectSummandsAndBigCohenMacaulay and AbhyankarLemma. The change adds no object. Material on the regular locus, normality, modifications and descent stays SchemeAndStackFoundations', which this roadmap cites. No other roadmap names Nash blowups.
- Source independence: changed passages only. 3 passages compared with 2 sources, at most 3 consecutive words shared ("is an isomorphism"). The largest share is nashModificationNotes2024, 24 of 124 source mentions. Contents were not compared again, since no layer was added, removed or reordered.

## Not verifiable

- hironaka1983: uncertified in the manifest; cited by locator only; not in the changed passages.
- spivakovsky1990: uncertified; cited by locator only; not in the changed passages.
- semple1954: uncertified; cited by locator only; not in the changed passages.
- teissier1982: uncertified; cited by locator only; not in the changed passages.
- ega1: uncertified; cited by locator only; not in the changed passages.

## Source issues

- **Misprint** in nashModificationNotes2024 at §§1.2–1.3, printed pp. 3–4: the source takes the closure of the image of the Gauss-type map in the Grassmannian alone, although the map lands in `X × G(d,N)`; it should be the closure in `X × G(d,N)`; affects nothing.
- **Gap** in nobile1975 at the proof of Theorem 2, printed p. 300: the source reduces to `k = ℂ` by descent without justification; it should state that the Nash blowup commutes with extension of algebraically closed fields (e.g. from Theorem 1) and that smoothness descends; affects the proof.

## For the human reviewers

- none

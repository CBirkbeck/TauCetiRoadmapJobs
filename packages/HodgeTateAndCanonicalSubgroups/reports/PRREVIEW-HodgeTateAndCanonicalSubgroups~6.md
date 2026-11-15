# Review of HodgeTateAndCanonicalSubgroups (pull request #1084 at c6ed07f)

**Verdict:** accepted

Incremental re-review of the 117 lines changed since `333737c`. No finding; the gate passes and the dependency check reports no problem.

## Previous findings

- R01 — repaired: README line 244 "for odd p its cohomology is killed by every `a∈O_C` with `v(a)≥1/(p−1)`"; `Suggested.lean` line 55 has `(hp2 : p ≠ 2)`; line 9 puts the bound at `p = 2` outside the roadmap.
- R02 — repaired: 3.2 is deleted (Layer 3 runs 3.1, 3.3–3.12, later numbers kept); line 9 hands the lifting to `CohomologyComparisons` §6.2; Layer 3's Dependencies no longer list R07.6 or DerivedModuleAlgebra.
- R03 — repaired: 0 occurrences of `S0`–`S6`, `O2`–`O8`, `IG.3`, `TC.2`; line 9 "PerfectoidShimuraVarieties Layers 1–3 … §6.3 … OverconvergentAutomorphicForms Layers 5–6"; each cited section exists at the open head.
- R04 — repaired: line 1934 "Cor. 4.1.9 and Lem. 4.1.10, p. 43; … Props. 4.1.14–4.1.15, p. 46"; line 2388 "[dJvdP96], §2.5, Prop. 2.5.8, p. 13"; line 2402 "§3.6, proof of Lem. 3.6.2, p. 42"; duplicates removed.
- R05 — repaired: line 1410 "`ε′ ≤ p^{−(m+2)}`", line 1428 "`0 ≤ ε ≤ p^{−(m+1)}`"; line 17 defines `G*`, `Γ₀*(p^n)`, `Γ*(p^n)` and `X_{Γ*(p^∞)}`.
- R06 — repaired: line 2533 "`PadicHodgeTheory` §§2.1–2.3", line 2984 "`PadicHodgeTheory` §2.3"; line 2754 "`µ′_{Z,*}(L̂_Z⊗OC_log,Z)` can"; one Tate-curve Check in 0.10; line 1293 "`p^{1−((p+1)/p)ε}`".
- R07 — repaired: 0.17 has three Checks (lines 458–460), 1.2 three (lines 692–694), 6.10 three (through line 1884).

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 0.5, Lean headline (odd p) | `n = 0`; `μ_p`; `ℤ/p`; Oort–Tate `x^p = ax`, `ab = p·unit`; six one-tactic probes | cotangent 0; `𝒪/p` spanned by `t−1`; 0; cokernel `𝒪/(a,y)`, `v(y) = v(b)/(p−1) ≤ 1/(p−1)`; all six probes fail | holds; not padding |
| 0.5 sources at `p = 2` | FAR10 l.1284; FAR11 ll.1198, 1225–1226, 1268, 1302; SCH15 ll.2391–2393; PS16 ll.199–206; SW20 l.3906 | `p≠2`; Thm. 1 `p≠2`, Thm. 2 proof uses Thm. 1(3); "only proved for `p≠2`"; `p≥3`, exponent 2 unwritten; exactness over C, printed p. 98 | locators match |
| 0.5 zero composite at every p | target `ω_{G^D}` free over `O_C`; exactness over C | composite is torsion in a torsion-free module: 0 | holds without the bound |
| Scope: lifting modulo `p^{1−ε}` | SCH15 ll.1078–1082 (p. 32); CohomologyComparisons README line 1155 | same hypothesis `0≤ε<1/2`; §6.2 `*Needs:*` names R07.6.6 | matches |
| Scope: `p = 2` in PerfectoidShimuraVarieties §3.9 | its README line 1392 | `B(g,2) = 2g`, cokernel killed by `4^g` | matches PS16 Rem. 1.10 |
| 0.10 Check | `t ↦ t^p`; `Tate(q) → Tate(q^{1/p})` | `dt/t ↦ p·dt/t`: `D_f = V(p)`; identity on `𝔾_m`: `D_f = 0`, kernel quasi-finite only | holds |
| 0.17 Checks | ordinary point; totally degenerate cusp; zero map | `α` an isomorphism on the étale quotient, onto `ω_A/p^n`; `ω_{(T^∨[p^n])^D} = 0` so `α` vanishes there; `X(T)/p^n⊗O ≅ ω_T/p^n` | hold; exclude the zero map |
| 1.2 Checks | `V = ℚ_p(−1)`; abelian scheme | `M₀ = tM`: `F_{−j}` full iff `j ≤ −1`, jump at 1; reversed index: jump at `−1`; `F₀` rank g, `F₁/F₀ = ω_A(−1)` | agree with 1.4 and line 750 |
| 6.10 Check | log disc `k⟨T⟩` | `dT ↦ T·dlog T`; cokernel `k⟨T⟩/T` | holds |
| 6.12 locators | DLLZ-adic ll.2157, 2163, 2187, 2229, 2303, 2314 | pp. 43, 43, 44, 45, 46, 46 | match |
| 6.36 (sampled) | dJvdP96 ll.521–531 (p. 13); point; Tate curve | vanishing above d for quasi-compact X; `d = 0`; `H¹ = ℤ ≠ 0` | matches |
| 6.37 locator | DLLZ-RH ll.2029–2041 (p. 42) | projection formula with (3.3.1) is in the proof of Lem. 3.6.2, not 3.6.1 | the author's locator is the right one |
| 5.1, 5.2 ranges | BHW ll.721, 1372 | `ε_m^can = p^{−(m+1)}`, so `ε_{m+1}^can = p^{−(m+2)}` | match |
| Conventions, `G*` | BHW ll.49, 872, 965 | fibre product over `Res_{F/ℚ}𝔾_m`; action through `γ^∨ = det(γ)γ⁻¹` | matches |
| 2.3 (sampled), line 838 | PerfectoidShimuraVarieties §§1.30, 2.2 | open Siegel tower perfectoid; open Hodge-type tower perfectoid | citation resolves |
| Downstream consumers, line 3124 | TorsionCohomologyInfrastructure lines 39, 118; HigherHidaAndColemanTheory lines 159, 161 | cites §§2.1–2.10; cites §5.1 | agree |
| Pull request text | title, summary block, prose against the head | "for odd p", "the prime 2 stays outside"; two Lean declarations; folder added | agrees |

Rows for untouched statements stand as in the previous review, of `333737c`.

- Source locators checked against the text: 19, in 9 sources (FAR10 1, FAR11 4, SCH15 2, PS16 1, SW20 1, BHW 3, DLLZ-adic 4, DLLZ-RH 2, dJvdP96 1).
- Cross-roadmap citations resolved at the open heads: PerfectoidShimuraVarieties §§0.3, 1.11, 1.30, 2.2, 3.5, 3.8, 3.9, 6.1a, 6.2, 6.3 and Layers 0–6; OverconvergentAutomorphicForms Layers 5, 6; IgusaVarietiesAndTorsionConcentration Layer 3; PadicHodgeTheory §§2.1–2.3; CohomologyComparisons §6.2. No open roadmap cites §3.2 of this one.
- Gate at `c6ed07f`: every counter 0, `build=0`. Nothing outside the folder is changed.
- Dependency check: `depcheck: 246 roadmaps, 2258 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives one warning, `declaration uses sorry` at line 55; the elaborated type carries `p ≠ 2` and every binder of the README's finite flat clause.
- Overlap check: read PerfectoidShimuraVarieties, AutomorphicBundles, CohomologyComparisons, PrismaticCohomologyPartIV, IgusaVarietiesAndTorsionConcentration, and on main AdicSpacesPartIV, PerfectoidTowers, PerfectoidSpaces; nothing shared (the change moves no object; the subgroup lifting of the former 3.2 is CohomologyComparisons §6.2's).
- Remark: 3.9 keeps its HALO range "for every p" with §0.5 in `*Needs:*`; at `p = 2` that range rests on HALO alone (see Not verifiable).

Source independence: changed passages only; 7 passages compared with 6 sources (line 9's lifting and `p = 2` sentences, 0.5, the `G*` convention, 6.36 and the `Suggested.lean` docstring against SCH15, FAR11, FAR10, PS16, BHW, dJvdP96), none shared beyond formulas and statements of a dozen words; largest share DLLZ-adic (42 of 219 locators at `333737c`, five added in 6.12); contents not compared again, since the change adds, removes or reorders no layer.

## Not verifiable

- HALO (SHA 154459bd…) and ZIE (SHA 7e553f59…): not in the sources cache; whether HALO's Appendix A reaches 3.9's `p = 2` range without the bound of 0.5 was not read.
- dJvdP96, Prop. 2.5.8: the scan's recognised text loses the proposition's heading and first line (dJvdP96 lines 520–521); the conclusion and proof were read, the hypothesis line was not.
- PS16, Prop. 1.5 and Rem. 1.6: not reread for the two new Checks of 0.17, which were checked by computation.
- OGU18, Prop. I.4.1.2: behind the publisher's paywall, cited by locator only.

## Source issues

- **Gap** in FAR11 at Thm. 2, §5.3.2, printed pp. 24–25: the source says the bound holds with no condition on p, by a proof using Thm. 1(3), stated for odd p; it should either assume p odd or prove Rem. 2's unproved extension of Thm. 1(2)–(3) to `p = 2`; affects a stated result.

## For the human reviewers

- **Scope.** The cokernel bound of 0.5 and 5.5–5.7 are stated for odd p only (README line 9). FAR11 Rem. 2 (lines 1225–1226) asserts without proof that the parts of Thm. 1 used hold at `p = 2`; PS16 Rem. 1.10 reports exponent 2, unwritten.
- **Licence.** BPC25 (Boxer–Pilloni, *Higher Coleman theory*) is cited from an author manuscript dated 3 March 2025, not a published version (README line 3146); it carries locators in 2.10, 2.12, 2.13, Layer 7 and 8.1.
- **Licence.** README line 116 says the integral-model interface "follows the Imperial College London FLT project"; no declaration of `Suggested.lean` matches a declaration of that project that I could identify.

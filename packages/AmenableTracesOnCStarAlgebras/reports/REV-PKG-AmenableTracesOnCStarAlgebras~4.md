<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13767#issuecomment-6799485347 -->
Review (claude) of 6f59950

Verdict: needs_changes

1. **F01** (P3) three Dependencies lists omit supplier sections their layers cite

   **Location.** `packages/AmenableTracesOnCStarAlgebras/README.md`: Layer 1 `### Dependencies`
   (line 826, "VonNeumannAlgebras V0, V1, V3, V4, V6, V13a, V13b.SpatialNorm; CStarAlgebras C5.1");
   Layer 2 (line 1036, "CStarAlgebras C2.8, C4.1, C4.2, C5.2"); Layer 7 (lines 1906–1910).

   **Claim.** Every layer lists its dependencies; the README's own lists include sections used only in
   Checks (Layer 6: "C9.7 (a Check)"; Layer 7: CL3 §3.4; Layer 8: C9.1).

   **Witness.** §1.2 Check, line 555: "the Toeplitz algebra (CStarAlgebras C8.4)"; §2.2 Check,
   line 935: "(CStarAlgebras C8.3, Check on these compressions)"; §7.3, lines 1865–1867: FactorRigidity
   §2.2 and VonNeumannAlgebras V13b. None is in its layer's list.

   **Repair.**

   1. Layer 1 Dependencies: "CStarAlgebras C5.1" → "CStarAlgebras C5.1, C8.4 (a Check)".
   2. Layer 2 Dependencies: "CStarAlgebras C2.8, C4.1, C4.2, C5.2" → "CStarAlgebras C2.8, C4.1, C4.2,
      C5.2, C8.3 (a Check)".
   3. Layer 7 Dependencies: "VonNeumannAlgebras V0;" → "VonNeumannAlgebras V0; VonNeumannAlgebras V13b
      and FactorRigidity §2.2 (cited for condition (v) of §7.3; no statement depends on them);".

   Tested: for each layer I extracted every supplier token of the body (`C*.*`, `V*`, `CL*`, `D2*`,
   `B1`, FactorRigidity) and subtracted those of its Dependencies. The difference is `{C8.4}`,
   `{C8.3}`, `∅`, `∅`, `∅`, `∅`, `{FactorRigidity, V13b}`, `∅` for Layers 1–8, and empty for all eight
   after the three edits. All three suppliers are on main (CStarAlgebras §8.3 at line 1645, with the
   `C(𝕋)` compression Check at 1665–1667; §8.4 at 1676; FactorRigidity §2.2 at 217; VonNeumannAlgebras
   V13b at 4692), so the dependency check is unaffected. No statement, Check or Lean declaration
   changes.

One finding, P3 (no P1, no P2). The finding of the previous review is repaired. No false or vacuous
statement, no unowned prerequisite, no upward supply, no padding and no missing headline was found;
`packages/AmenableTracesOnCStarAlgebras/Suggested.lean` elaborates at the pins with `sorry` as its
only warning. The finding is three `### Dependencies` lists that omit supplier sections their own
layers cite. No maintainer notes were left; the plan declares no supplier gaps.

## Previous finding

- **F01 (P3), a pinned Tau Ceti theorem rebuilt in §7.1 — repaired.** `### From Tau Ceti` now has
  "`LinearMap.exists_isFiniteMeasure_integral_characterSpace_eq` … a linear functional `τ` that is
  nonnegative on every `a*a` is `a ↦ ∫ ω(a) dμ(ω)` for a finite inner regular measure `μ` on `Ω`";
  §7.1 reads "for unital `A`, a state is `a ↦ ∫ ω(a) dμ(ω)` for a probability measure `μ` on the
  character space `Ω` (Tau Ceti `LinearMap.exists_isFiniteMeasure_integral_characterSpace_eq`; …)";
  the §7.1 *Needs:* line and the Layer 7 Dependencies name the Tau Ceti theorem in place of
  `RealRMK.rieszMeasure`. Checked at the pinned Tau Ceti,
  `TauCeti/Analysis/CStarAlgebra/CharacterSpaceMeasure.lean` line 134: `[CommCStarAlgebra A]`,
  Borel structure on `characterSpace ℂ A`, `f : A →ₗ[ℂ] ℂ` with `0 ≤ f (star a * a)`, conclusion
  `∃ μ, IsFiniteMeasure μ ∧ μ.InnerRegular ∧ ∀ a, f a = ∫ ω, ω a ∂μ`. The contract's "nothing about
  uniqueness" and "nothing for nonunital algebras" are accurate. The same pattern elsewhere: the
  §1.1 Check on `C(X)` applies `RealRMK.rieszMeasure` to `C(X)` directly (no Gelfand step), so the
  Mathlib bullet and the Layer 1 Dependencies rightly keep it; no other passage derives a measure
  from the Gelfand transform.

## Verified sound

**Elaboration.** `lake env lean` on `packages/AmenableTracesOnCStarAlgebras/Suggested.lean` from
the content checkout: exit 0 in 13 s; 21 warnings, all "declaration uses `sorry`", one per theorem;
no other message. No `TauCeti.*` module needed building. The file is unchanged since round 3.

**Padding probe, every theorem.** On a scratch copy each of the 21 `sorry` proofs was replaced by
`first | rfl | (simp; done) | infer_instance | trivial | tauto | (exact?; done)`: 21 errors, one
per theorem, each "`exact?` could not close the goal"; none closes. None restates a definition,
mirrors a Check or treats a boundary case. The 4 instances and 19 definitions have real bodies; no
sorried data, `set_option`, `lemma`, `#eval`, `#print`, `#synth`; imports are `import Mathlib` and
three `TauCeti.*` modules, each used.

**Signatures.** The elaborated types of all 44 declarations (the worker's `#check @name` listing
for the unchanged file) were compared with the README statements. Four definitions drop an order
class their bodies do not use (`IsFaithfulTrace`, `IsHypertrace`, `IsFoelnerTrace`: 
`[StarOrderedRing A]`; `IsAF`: both); no theorem loses a hypothesis. Nothing changed.

**Headlines (README Summary) against `Suggested.lean`.** Stated: Connes–Kirchberg (hypertrace,
extension and tensor forms), Følner sufficiency and equivalence, the tracial von Neumann form,
uniform amenable ⇔ injective `π_τ(A)''`, the nuclear case, the exact case, the two face theorems,
unitization, normalized restriction, extension from ideals, commutative and AF algebras, the group
theorem, quasidiagonal algebra ⇒ quasidiagonal trace, faithful quasidiagonal trace ⇒
quasidiagonal, Rosenberg, subalgebras of simple unital AF algebras. Named not statable in the
module docstring with the missing carrier: the bimodule form (`π_τᵒᵖ`), the vector-trace clause
(`τ''`), minimal tensor products (`A ⊗min B`). None absent, none through a stand-in. All 44 Lean
names occur backticked in the README; the resolver reports no name found nowhere.

**Sources: the 15 sampled targets, read at the cited lines.** No locator was flagged unverified.
brown2006: 1338–1340 (Prop. 3.5.8, `τ̇`; §1.2); 1423–1430 (Prop. 3.5.10) and 1469–1492
(Prop. 3.5.12 and its proof through strict continuity, which the README says it replaces; §1.3,
§6.5); 378–384 and 793–801 (`J`, `π_τᵒᵖ`, `μ_τ`; §1.4); 558–564 (Lemma 2.8) and 827 (§1.7);
759–764 (Lemma 3.1.5, two-term form; the README's one-term form is sharper and derived) and
841–850 (§2.2); 413–427 (Lemma 2.1, both identities and the proof identity; §2.3); 993–999
(§2.5); 807, 589–592, 953–958, 1078–1080, 1426–1428 (§3.1); 1201, 1218–1221, 1613–1616 (§3.3);
1317–1321 (§3.5); 851 onward (§4.3); 897–914 and 429–431 (§4.5); 971–992 and 993–1000, 1575–1576,
1608–1612 (§5.2); 1541–1549 (Rosenberg, §8.4), 1097–1121 and 340–341. tikuisis-white-winter2017:
359–361, 376–380, 456–464. schafhauser2020: 69–70, 75–77, 78–84. Every locator carries the cited
statement with the cited number. Where the README is more general than the source (no unit, no
separability, no general position) it says so and gives its own route, checked below.

**Adversarial table** (sampled targets, headlines, the repaired passage, the finding).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.2 `N_τ` two-sided, `= ker π_τ`, `=` trace radical | `ℂ ⊕ ℂ`, `pr₁`; `M_2`, `tr_2`; `M_2`, `ω = x₁₁` | `N = 0 ⊕ ℂ = {x : x₁y₁ = 0 ∀y}`; `tr_2(x*x) = Σ|x_ij|²/2`, `N = 0` while `ker tr_2 ∋ e₁₂`, `e₁₂e₂₁ = e₁₁`, `tr = 1/2`; `ω(a*a) = ‖ae₁‖²`: `e₁₂e₁ = 0`, `e₁₁e₁ = e₁ ≠ 0` | holds; traciality needed for the right ideal |
| §1.2 route | `τ((ab)*(ab))`; Cauchy–Schwarz | `= τ(abb*a*) ≤ ‖b‖²τ(aa*) = ‖b‖²τ(a*a)`; `|τ(yx)|² ≤ τ(yy*)τ(x*x)`; `y = x*` gives `τ(xx*) = τ(x*x)` | sound |
| §1.2 simplicity; Toeplitz | zero algebra; `K(ℓ²)` | no state, so nothing claimed; bounded tracial functional on `K` has equal values on all `e_ii`, so `0`; traces factor through `C(𝕋)` | holds |
| §1.3 unitization | `c₀`, `Σ2^{-n}δ_n`; `A = ℂ` | `Σ2^{-n}(x_n − x_∞) + x_∞ = Σ2^{-n}x_n`; `Ã = ℂ²`, `τ̃ = pr₁`, `τ̃(e*e) = 1 − 1 = 0` for `e = 1_Ã − 1_A` | faithfulness transfer needs "no unit" |
| §1.3 ideal extension | `M_2 ⊕ 0 ⊆ M_2 ⊕ ℂ`; `c₀ ⊆ c`, `δ_1`; `ω = x₁₁` on `M_2` | `γ = tr_2 ∘ pr₁`; `(x_1 + lim x)/2` restricts to norm `1/2`; step `ω(ea·be) = ω(be·ea)` reads `1 = 0` | holds; uniqueness not contradicted |
| §1.3 estimates | `0 ≤ e′ ≤ e ≤ 1` | `(1 − e)² ≤ 1 − e`; `(e − e′)² ≤ e − e′`; `γ(ab) = lim τ(ea·be) = lim τ(be·ea) = lim γ(be²a)`, `π_τ(e²) → 1` strongly | sound |
| §1.4 GNS data, conventions | `(M_2, tr_2)`; `(c₀, Σ2^{-n}δ_n)` | `Jπ(b*)Jĉ = (cb)^`: `π_τᵒᵖ(e₁₂ᵒᵖ)ê₁₁ = ê₁₂`; `Jπ(e₁₂)Jê₁₁ = (e₁₁e₂₁)^ = 0`; `μ_τ(e₁₂ ⊗ e₂₁ᵒᵖ) = 1/2`; `‖1̂ − ê_m‖² = 2^{-m}` | conventions pinned |
| §1.4 traciality of `τ''` | density on two vectors | `⟪Ω, π(a)b̂⟫ = τ(ab)`, `⟪(b*)^, â⟫ = τ(ba)`; second variable likewise; pinned density theorem approximates on finitely many vectors by `StarAlgebra.adjoin` | sound |
| §1.7 norming sets | `ℂ²`, `{pr₁, pr₂}`; `{pr₁}` | `max(|s|, |t|) = ‖a‖`; `(0, 1)`: `0 ≠ 1`, hull `{pr₁} ≠ S(A)` | holds; unit used for the shift |
| §2.2 defects | `φ = x₁₁`, `(e₁₂, e₂₁)` and reversed; `C(𝕋)` compressions | `1 ≤ ‖b‖d₂(φ, e₂₁)^{1/2} = 1`; `0 ≤ 0`; `P − PM_zPM_z̄P = proj(z⁰)`: `d₂ = 1/n`, `d_∞ = 1`; `T(ab) = T(a)φ(b) + (1 − VV*)^{1/2}π(a)(1 − VV*)^{1/2}T(b)` | sharp; agrees with CStarAlgebras C8.3's `−e₀e₀*` |
| §2.3 commutator identities | `P = e₁₁`, `T = e₁₂`; `P = 1`; `M_z`, `P_n` | `PT − TP = e₁₂`, `HS² = 1 = 0 + 1`; `0 = 0`; entries at `z^{n−1} ↦ z^n` and `z^{−1} ↦ −z⁰`, `HS² = 2`, norm `1` | both identities hold; match Lemma 2.1 |
| §2.5 bidual | `c₀`, `δ_1`; `x_1 + lim_U` | value `1` on tails `1_{[m,∞)} → 0` weak-star; norm `2` | normality pins `φ**` |
| §3.1 definitions | `φ_m = τ(·)1_m/m` on `M_2`, `(e₁₂, e₂₁)`; `k = 0` | `Tr_m = 1/2`, norm defect `1/(2m)`, unnormalized HS `1/(2m^{1/2})`, `tr_mφ_m(1) = 1/m`; into `M_0` the recovery error is `|τ(a)|` | normalization needed; `k = 0` harmless |
| `isAmenableTrace_unitization_iff` | `A = ℂ`, `φ = (1 − δ)id` | difference `−δa` at `(1, −1/2)` of norm `1/2`: norm `2δ` | factor `2` attained; true for unital `A` |
| §3.3 | block sum; `C*(Γ)` residually finite | `‖x ⊕ y‖₂² = θ‖x‖₂² + (1 − θ)‖y‖₂²`; weak-star limit outside `UAT` (lines 1613–1616) | `UAT` only norm closed |
| §3.5 | `e₁₁ ⊗ e₁₁`; `C*_r(F₂) ⊗ M_2` | trace `1/4`, 2-norm `1/2`; pullback along `x ⊗ 1` is `τ_{F₂}` | holds |
| §4.3, three Lean forms of §4.4 | `M_n`; `ℂ²`, `pr₁`; positivity of `μ_τ`; `H = 0` | `μ_τ(e₁₂ ⊗ e₂₁ᵒᵖ) = 1/n ≤ 1`; `Φ(T) = T₁₁`; `μ_τ(x*x) = τ(y*y)`, `y = Σa_jb_j`, so bounded ⇒ norm `μ_τ(1) = 1`; injective unital `π` into `B(0)` forces `A = 0`, no state | constant `1` in the Lean inequality is right; no vacuous case |
| §4.5 `IsFoelnerTrace`, both theorems | `C(𝕋)`, `P_n`; `ℂ²`, `(1/3, 2/3)`; sufficiency | `1 + 1 = 2 < εn`; rank one `2|ξ₁|²|ξ₂|² = 4/9`, rank two trace `1/2 ≠ 1/3`; `‖φ(ab) − φ(a)φ(b)‖₂² ≤ ‖a‖²·n⁻¹Σ‖(1 − P)π(b)eᵢ‖²` | converse needs `hess`; sufficiency needs no faithfulness |
| §4.6 `isAmenableTrace_iff_isInjective` | `M_n`; `L(F₂)`; `H = 0` | identity; both sides false; `M = 0` has no state | holds |
| §5.2 `isUniformAmenableTrace_iff_isInjective` | `C*(F₂)`; `C[0,1]`, `f = t` | amenable, `L(F₂)` not injective; defect `1/(12n²)` | holds |
| §5.4 `isAmenableTrace_tfae_of_isNuclearMap` | `C*_r(F₂)`; `C*(F₂)`; route | all four fail; amenable with non-injective `M_τ`; `π_τ = Φ ∘ π`, `(Φ ∘ β) ∘ α` approximates it, so no local reflexivity is used | target `M_τ` and exactness needed |
| §6.2 faces | `C*_r(F₂) ⊕ ℂ` | `AT = {χ ∘ pr₂}` | iff holds |
| §6.3 `isAmenableTrace_of_normalized_comp` | `M_3 → M_4`; `c = 1/2` | `τ ∘ ι̃ = (3/4)(tr_3)~ + (1/4)χ₀`; `(3/2)tr_3` not a state | `hγ` pins `c` |
| §6.5 `isAmenableTrace_of_comp_ideal` | `M_2 ⊕ 0`; `q : C*(F₂) → C*_r(F₂)` | `γ = tr_2 ∘ pr₁`; false without `hι` | holds |
| §7.1, repaired passage | `ℂ ⊕ ℂ`, `(1/3, 2/3)`; `C[0,1]`; `A = 0` | `μ = δ₁/3 + 2δ₂/3`, mass `1 = τ(1)`; Riemann sum `(n + 1)/(2n) → 1/2`; `Ω = ∅`, no state | holds |
| §7.3 group theorem | `ℤ`; `S₃`; `F₂`; trivial group | `λ_1M_{δ_0}λ_1* = M_{δ_1}`; `Tr(λ_e) = 6`; all fail; all hold; `ψ(M_{L_gf}) = ψ(λ_gM_fλ_g*) = ψ(M_f)` | (iii) ⇒ (i) matches `TauCeti.Mean.IsLeftInvariant` |
| §8.1, §8.4 Rosenberg | degenerate `π`, `ξ ∈ π(1)H`; `ℤ`; `F₂`; uncountable `Γ` | `Pπ(1)P` near a nonzero projection; `C(𝕋)` quasidiagonal, `ℤ` amenable; neither; §8.1 and §7.3 use no separability | holds; `[DecidableEq Γ]` not needed and not assumed |
| §8.5 `subalgebra_isAF_simple` | `M_3 ⊆ M_4 ⊆ CAR`; `B = ℂ²`; `B = 0` | `c = 3/4`; `pr₁` not faithful; excluded by `[Nontrivial A]` with `hι` | simplicity and `A ≠ 0` needed |
| R01 | Layers 1–8 | uncited-in-Dependencies sets `{C8.4}`, `{C8.3}`, `∅`, `∅`, `∅`, `∅`, `{FactorRigidity, V13b}`, `∅` | three lists incomplete |

**Library declarations opened at the pins this round.** Tau Ceti:
`LinearMap.exists_isFiniteMeasure_integral_characterSpace_eq` (`CharacterSpaceMeasure.lean`:134);
`toGNS`, `denseRange_toGNS`, `gnsVector`, `inner_gnsStarAlgHom_gnsVector`, `inner_gnsVector_coe`,
`denseRange_gnsStarAlgHom_gnsVector`, `norm_gnsVector` (`GNS.lean`:54, 62, 72, 86, 94, 99, 110);
`IsKMSState.eq_zero_of_apply_toPreGNS_one_eq_zero` (`KMS/Separating.lean`:114, for `gnsStarAlgHom`
and `toPreGNS 1`, as the README uses it); `traceRadical`, `mem_traceRadical` (`∀ y, τ (x * y) = 0`),
its `IsTwoSided` instance (`Radical.lean`:45, 55, 58);
`exists_forall_norm_sub_apply_lt_of_mem_adjoin` (`Density.lean`:155, finitely many vectors,
approximants in `StarAlgebra.adjoin ℂ s`). The Mathlib and remaining Tau Ceti declarations are
those the previous round listed with file and line; the pins have not moved (Mathlib `1b1ccf4b…`,
Tau Ceti `2fd255d9…`, as the README names them).

**Cross-roadmap citations resolved on main.** CStarAlgebras §2.1 (544), §2.8 (763), §4.1 (986),
§4.2 (1021), §5.1 (1112), §5.2 (1143), §5.4 (1203), §6.1 (1272), §6.2 (1297), §6.5 (1414), §7.1
(1455), §8.1 (1587), §8.2 (1617), §8.3 (1645; its Checks at 1663–1672 carry the `C(𝕋)`
compressions, the Toeplitz algebra and the zero algebra), §8.4 (1676), §9.1 (1711), §9.7 (1900).
VonNeumannAlgebras V13a (4635), V13b (4692), V13b.SpatialNorm (4696). CStarClassification §2.1
(351), §3.4 (587), §3.5 (616). OperatorAlgebraDynamics D2 (1466), D2.FreeGroups (1781).
FactorRigidity §2.2 (217). BanachSpaceTheory B1 (54). `roadmaps resolve` lists no citation found
nowhere.

**Ownership and overlap.** `roadmaps grep` over main and the open heads for amenable and
quasidiagonal traces, hypertraces and Rosenberg's theorem: hits only in VonNeumannAlgebras V13b
(von Neumann hypertraces, deferred to in the Scope), Subfactors and FactorRigidity (consumers of
V13b) and a Check of CStarClassification quoting Rosenberg's theorem. No other `Suggested.lean`
declares `IsAmenableTrace`, `IsHypertrace`, `IsQuasidiagonalTrace`, `IsFoelnerTrace`,
`matrixTwoNorm`, `gnsVonNeumannAlgebra` or `IsNuclearMap`. `generatedCStarAlgebra` has the same
body as `TauCetiRoadmap.OperatorAlgebraDynamics.generatedCStarAlgebra` (its `Suggested.lean`
line 337) in a different namespace, and `IsTracialState` differs in carrier and namespace from
VonNeumannAlgebras's: no fully qualified name is shared. The overlap listing: no open pull request
changes this roadmap, no cited id is dropped, none is defined only by a revision. The board's
package index lists three packages, none in operator algebras. No notion had to move from a later
roadmap.

**Dependency check.** Output: `depcheck: 207 roadmaps, 1918 edges, 0 problem(s)`. No UPWARD, CYCLE
or `moved:` line.

**Shape and residue.** Eight layers named by their mathematics, each ending with Examples and
Dependencies and each depending on all earlier ones, so the order is forced; every definition has
its API and at least three Checks; every theorem a locator. A search of README and Lean for LaTeX
delimiters, pull-request numbers, machine paths and process words finds none. Every cited work is
in `sources.toml` and its `cited_for` sections match the README.

**Remarks needing no change.** README lines 1603 and 1802 are longer than their neighbours (two
sentences joined; the round-3 repair's rewrap); both render correctly. In the §8.4 Check the
locator "brown2006, lines 340–341" supports the non-quasidiagonality of `C*_r(F₂)`, which that
sentence also asserts. Separability in `isQuasidiagonal_of_isQuasidiagonalTrace` is the source's
hypothesis; I did not look for an instance showing it unnecessary.

## Not verifiable

- `connes1976`, `brown-ozawa2008`, `paulsen2002`, `pedersen2018`: waived; cited as background by
  locator, texts not read.
- `kirchberg1993`: paywalled, `uncertified`; known only through brown2006 lines 1910–1913.
- The numbering of the published Memoir of brown2006 against arXiv v2: not compared; the README
  cites the arXiv numbering and says so.
- Packages under review on other board branches were not opened; the index lists none on this
  subject.

## Source issues

- **Misprint** in brown2006 at proof of Proposition 3.5.3, printed page 29: the source says the projections lie in the double commutant of the GNS image and writes the representation of the wrong trace; it should be the commutant, as in Lemma 3.5.2, and the representation of the combined trace; affects nothing.
- **Gap** in brown2006 at proof of Lemma 3.1.4, printed page 17: the source takes, for each eigenvector, as many vectors of an orthonormal basis of the same Hilbert space as its multiplicity numerator, which fails on a small space; it should tensor with an auxiliary space of dimension at least the common denominator; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6f59950f4d8babfd18aa7c572cfdbe62038a071c", "job": "REV-PKG-AmenableTracesOnCStarAlgebras~4", "model": "fable", "worker": "chris-l"} -->

# Review of QuantumGroups (pull request #1649 at 7b6238f)

**Verdict:** needs changes

This is an incremental re-review of the 60 lines changed in `TauCetiRoadmap/QuantumGroups/` since `79e1cb6`. The diff makes four changes:
- It adds `haar_modular_automorphism` and `haar_trace_iff_antipode_involutive` to `Suggested.lean`, under the Layer 4 section comment.
- It moves the modular/Kac comparison out of the module docstring's not-statable list.
- It adds a §4.1 paragraph, an API bullet, a Check and *Needs:* items for the two headlines.
- It rewrites the §0.2 sign-map justification and the Neshveyev–Tuset reference entry.

Both mathematical repairs are correct. The new theorems are true at the stated generality, the locators are right, and the gate passes. One finding remains, carried from the previous review: the conflict with #1705 and the stale description (P3). It needs no edit in the folder.

Locations are in `TauCetiRoadmap/QuantumGroups/README.md` unless stated otherwise. Sources are cited as `<source id> line N` in the worker's cache.

## R01 (P3) — Two open revisions of this folder still conflict with no stated order, and the description describes an earlier head

Carried from the previous review's R03, which re-raised H01. No repair report marks it as not actionable, and nothing at this head addresses it.

**Location:** this pull request's description (`scratch/pull-request.md`, data): "Current head `d7a6c540…`", "All pre-existing public README bytes, Suggested.lean and metadata remain unchanged", "No Lean elaboration was repeated because no Lean files change".

**Claim:** The rule has two parts:
- When two open pull requests change one roadmap and their heads conflict, one is rebased on the other before either merges, and the description says which.
- The description describes the head under review.

At this head `Suggested.lean` has two new theorems, so the description is now wrong as well as stale.

**Witness:**
- `roadmaps list` shows `#1705 QuantumGroups @kim-em 7c3e850` beside `#1649 … 7b6238f`.
- `roadmaps overlaps QuantumGroups` reports "#1649 and #1705 conflict in README.md, Suggested.lean".
- Both heads declare `TauCetiRoadmap.QuantumGroups.haar_modular_automorphism`.
- This head's §0.2 sign-map paragraph appears nowhere in #1705's README.

**Repair (for the worker):**
- Rewrite the description to describe `7b6238f`:
  - §1.1 ClassicalMultipliers;
  - Layer 0 moved down, with CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras named as later owners;
  - Layer 8 on native `TauCeti.UqSl2`;
  - §0.2's corrected sign-map parity argument;
  - a six-declaration `Suggested.lean` with four `sorry`'d theorems, which elaborates with only `sorry` warnings.
- State which of #1649 and #1705 is rebased on the other.
- Whichever merges second must keep this head's §0.2 wording. It must also declare the two §4.1 headlines only once, which both heads currently do.

## Previous findings

- R01 — repaired: `Suggested.lean:122`–`:134` states `haar_modular_automorphism` (`∃! θ : A ≃ₐ[ℂ] A, ∀ a b, h(ab) = h(b θ a)`) and `haar_trace_iff_antipode_involutive`. Docstring `:13`–`:18` names both. README §4.1 `:797`–`:805` states both with Neshveyev–Tuset locators.
- R02 — repaired: `:254`–`:259`: "For e_i²=(−d)e_i in TL_n(−d), s(e_i)²=e_i²=d·e_i=(−d)·s(e_i). In e_ie_j=e_je_i … degree 2, and in e_ie_(i±1)e_i=e_i they have degrees 3 and 1 … same parity".
- R03 — not repaired: the description still opens "Current head `d7a6c540…`" and states no order with #1705, now at `7c3e850` and still conflicting. Carried as R01.

## Verified sound

**Gate.** I ran the gate on this head. Every check is 0, ending `… source-material=0 OK`. This agrees with the worker's gate, which also reports `build=0`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty.

**Dependency check** (output of the required command, unmodified):

```text
depcheck: 235 roadmaps, 2260 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The new *Needs:* items are internal: §4.1 → §§3.2–3.3. Layer 3 names Layer 4 only as a forward pointer ("Q4 constructs its bounded extensions"), so the new edge makes no cycle.

**Elaboration and signatures.** `lake env lean` on `Suggested.lean` exits 0 with four `declaration uses sorry` warnings (`:83`, `:111`, `:122`, `:130`). A scratch copy with `#check @name` for all six declarations and `AlgebraicHaar.mk` gives types equal to `scratch/signatures.md`. The two new signatures carry `[Ring A] [HopfAlgebra ℂ A] [StarRing A] [StarModule ℂ A] [TauCeti.StarCoalgebra ℂ A] (h : AlgebraicHaar)` explicitly.

This matches the README's "every Hopf *-algebra with an `AlgebraicHaar` h". §3.1 defines a Hopf *-algebra as a native Hopf algebra with compatible star structure and star-preserving Δ. `TauCeti.StarCoalgebra` (`Algebra/Coalgebra/Star.lean:46` at Tau Ceti `2fd255d9`) is exactly `comul (star a) = star (comul a)`.

`[Nontrivial A]` is not needed: `h(1)=1` rules out the zero ring. `AlgebraicHaar` still drops `[StarModule ℂ A]`, but no field uses it, as the previous review found.

**Padding probe.** On a scratch copy, each new theorem was tried with `rfl`, `simp`, `infer_instance`, `exact trivial`, `constructor` and `aesop`, and the modular statement also with `exact ⟨AlgEquiv.refl, by simp, by simp⟩`. Every attempt fails, with "rfl failed", "simp made no progress", "type class instance expected", "Type mismatch", "unsolved goals" or "aesop failed". Neither theorem is padding.

**Headline theorems.**
- Stated: weighted Schur orthogonality (§3.1), the compact-type equivalence (§4.1), and the modular automorphism and Kac equivalence (§4.1 from §§3.2–3.3).
- The Layer 3 not-statable bullet now lists the density of the Hopf core, the Plancherel completion, the unitary pivotal comparison and intrinsic dimension (§3.3), and the Tomita comparison (§3.4).
- None of these has a carrier at the pins. A grep of pinned Tau Ceti and Mathlib finds no dagger or C*-category, standard-solution or intrinsic-dimension carrier. Tau Ceti has only `TauCeti.PivotalCategory` (`CategoryTheory/Monoidal/Pivotal/Basic.lean:76`) and `SphericalCategory` (`Pivotal/Spherical.lean:69`), with no positivity.
- The other bullets are unchanged from the previous review.

**Sources checked at the changed locators** (`nt`, the author's copy, certified):

| Locator | Where | What the text supports |
| --- | --- | --- |
| Theorem 1.6.6, p.18 | `nt` line 810; printed page header "18" at line 798 | A Hopf *-algebra generated by unitary corepresentation coefficients is C[G]. Step 1 (line 819) builds the normalized two-sided invariant functional; Step 3 (line 864) proves `h(a*a)>0` for a≠0. This supports §4.1's citation and the faithfulness behind uniqueness. |
| Theorem 1.7.3, p.22 | `nt` lines 977–978; header "22" at line 976 | `h(ab)=h(bσ_(−i)(a))` on C[G]. Line 968 gives `σ_z(a)=f_(iz)*a*f_(iz)`, so `σ_(−i)=f_1*·*f_1` (the Lean docstring's "convolution by `f₁` on both sides"). Line 971: `σ_z ∈ Aut(C[G])`, so θ is an algebra automorphism. |
| Proposition 1.7.7, p.23 | `nt` lines 1036–1040; header "23" at line 1022 | (ii) h is a trace ⟺ (iii) `S²=ι`. This is exactly `haar_trace_iff_antipode_involutive`. |

Uniqueness in `∃!` is not in Theorem 1.7.3 itself. It follows from faithfulness (`nt` lines 988–989, and the README's own §4.1 positivity step). Two solutions θ, θ′ give `h(b(θa−θ′a))=0` for all b. Taking `b=(θa−θ′a)*` forces `θa=θ′a`. The README states this argument.

The seeded sample falls in the changed passages only at §4.1. Its Timmermann locators (Prop 2.2.4, Remark 2.2.2(iv)(c), Thm 3.2.12) are uncertified; see below. The new §4.1 *Needs:* line also cites §§3.2–3.3, whose Timmermann locators are likewise uncertified. Their mathematics is checked in the table below and against `nt` Thm 1.7.3 and Prop 1.7.7.

**Duplication and ownership.** I ran `roadmaps grep -i` for `haar_modular|haar_trace_iff|Woronowicz character|Kac type|S²=id|antipode_involutive|AlgebraicHaar` over main and all 456 open heads. The only hits are QuantumGroups itself (main, #1649, #1705) and an unrelated `τ_s²=id` in ClassicalArithmeticCompletion. Neither pinned Tau Ceti nor pinned Mathlib has Woronowicz characters, a modular automorphism of a Haar functional or Kac type. QuantumGroups is therefore the single owner. The shared names with #1705 are two revisions of one roadmap, which is covered by R01.

**Overlaps.** `roadmaps overlaps QuantumGroups` lists no id this README cites that an open pull request drops, and no id only an open revision defines. The diff drops no id.

**Adversarial table.** q=1/2 unless stated. Rows 1–6 are the statements this diff adds or changes, computed here. Rows 7–33 carry forward the previous review (PRREVIEW-QuantumGroups~18, at `79e1cb6`) for statements the diff leaves untouched, with the values that review computed.

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | `haar_modular_automorphism` (§4.1) | ℂ; ℂ[C₂]; ℂ[S₃]; SU_q(2); inverse convention; zero ring; ℂ[ℤ] with `u*=u` | ℂ: θ=id is the only automorphism, `h(ab)=ab=h(ba)`. ℂ[C₂]: θ=id works; the other automorphism `u↦−u` gives `h(u·u)=1` vs `h(u·(−u))=−1`, excluded. ℂ[S₃]: θ=id, since `h(u_g u_k)=δ_(gk,e)=δ_(kg,e)`. SU_q(2): `θ(a)=4a` gives `h(aa*)=4/5=4·h(a*a)`; `θ(a*)=a*/4` gives `h(a*a)=1/5=(1/4)h(aa*)`; `θ(c)=c` gives `h(cc*)=h(c*c)=4/5`. The inverse `a/4` gives `1/20≠4/5`. Zero ring: `h(1)=h(0)=0≠1`, so there is no `AlgebraicHaar`. ℂ[ℤ], `u*=u`: `h((u−u⁻¹)*(u−u⁻¹))=−2<0`, so there is no `AlgebraicHaar` | true at stated generality | none |
| 2 | `haar_trace_iff_antipode_involutive` (§4.1) | ℂ; ℂ[C₂]; ℂ[S₃]; SU_q(2); SU_1(2) | ℂ: both true. ℂ[C₂]: `S(u)=u⁻¹=u`, `S²=id`, commutative, both true. ℂ[S₃] (non-commutative): trace and `S²(u_g)=u_g`, both true, which excludes "trace iff commutative". SU_q(2): `h(a*a)=1/5≠4/5=h(aa*)` and `S²(c)=q²c=c/4≠c`, both false. SU_1(2): commutative, `S²=id`, both true | true; both directions tested | none |
| 3 | §0.2 sign map respects the relations (rewritten) | TL₃ `e₁e₂e₁=e₁`; `e₁²=(−d)e₁`; TL₄ `e₁e₃=e₃e₁`; inverse | `s(e₁e₂e₁)=(−1)³e₁e₂e₁=−e₁=s(e₁)` (degrees 3, 1). `s(e₁)²=e₁²=d·e₁=(−d)(−e₁)=(−d)s(e₁)`. `s(e₁)s(e₃)=e₁e₃=s(e₃)s(e₁)`. `s′(e_i)=−e_i` from TL_n(d) gives `s′s(e_i)=e_i`. Adjoint: `s(e_i†)=−e_i=s(e_i)†` | true; reasons now correct | none |
| 4 | §0.2 closure parity (re-wrapped) | (k,c,n)=(0,1,1),(0,2,2),(1,1,2); d=3/2 | `k+c≡n` in all three. `T₁^(d)(s1)=d=(−1)·T₁^(−d)(1)=−(−d)`. `T₂^(d)(−e₁)=−d=T₂^(−d)(e₁)`. `T₂(1)=d²` on both sides | pass | none |
| 5 | §4.1 new Check | ℂ[S₃]; SU_q(2) | Recomputed in rows 1–2: `δ_(gk,e)=δ_(kg,e)`; `4/5=4·(1/5)`; `S²(c)=c/4`; inverse `1/20`. Agrees with §3.1's Check (`h(a*a)=1/5`), §3.2's (`θ(a)=4a`) and §3.4's (`1/20`) | consistent | none |
| 6 | Docstring Layer 3 not-statable list | pins grep | No dagger, C*-category, standard-solution or intrinsic-dimension carrier; only `PivotalCategory` and `SphericalCategory` (no positivity) | claim holds | none |
| 7 | `schur_orthogonality` (§3.1) | SU_q(2) fundamental; 1-dim character; ι=∅ | r18: `F̃=diag(2,1/2)`; first form `h(a*a)=1/5=(1/2)/(5/2)`, `h(c*c)=4/5`; second form `h(aa*)=4/5`; character `F̃=1`, `h(u*u)=1`; ι=∅ excluded by `IsSimpleOrder` | pass | none |
| 8 | `compactType_iff` (§4.1) | ℂ; ℂ[C₂]; zero ring; ℂ[x]; ℂ[ℤ] `u*=u` | r18: ℂ both true; ℂ[C₂] `\|a\|²+\|b\|²`; zero ring `h(1)=0≠1`, excluded by `[Nontrivial A]`; ℂ[x] forces x=0, both false; ℂ[ℤ] `−2<0`, both false | pass | none |
| 9 | §0.2 Checks | ℂ, R=1; ℂ², `R=e₀⊗e₁−e₁⊗e₀` | r18: δ=1, `T₂(f₂)=[3]=0`; zigzag −e₀, `‖R‖²=2`, `(−RR*)²=−2(−RR*)` | pass | none |
| 10 | §0.1 conjugate solutions | `R=2e₀⊗e₀+e₁⊗e₁` | r18: zigzags 1, 1; `√5·√(5/4)=5/2>2`; HS `√17` vs 5; `J²z=−z` | pass | none |
| 11 | §1.1 classical multipliers | S₃; ℤ | r18: `Δf(g,h)=1`, `Δf(h,g)=0`; `r₊=aS(b)`, `r₋=S(a)b` | pass | none |
| 12 | §1.2 cancellation, Haar | monoid {1,0}; C(C₂); ℤ | r18: span dim 3; `h(1[e])=1/2` vs 1; Fell unitary on δ₁⊗δ₂ | pass | none |
| 13 | §2.1 coefficient order | S₃ permutation rep; C₂ sign | r18: `u₁₃(gh)=1`, `u₁₃(hg)=0`; `(−1)²=1` vs −2 | pass | none |
| 14 | §2.2 unitarization | `U=[[1,2],[0,−1]]` | r18: `U²=I`; averaged form `[[1,1],[1,3]]`, det 2 | pass | none |
| 15 | §2.3 regular corepresentation | isometry; S₃ | r18: `h(a*b)1`; `1+1+4=6` | pass | none |
| 16 | §3.2 characters, Plancherel | SU_q(2) | r18: `f_z(a)=2^z`; `f₁*f₁(a)=4=f₂(a)`; `‖a+c‖²=1`; Vandermonde det 3 | pass | none |
| 17 | §3.3 `S²u=FuF⁻¹`, traces | SU_q(2) | r18: `S²(c)=c/4`; `tr F=tr F⁻¹=5/2`; `tr(F diag(1,0))=2` vs 1/2 | pass | none |
| 18 | §3.4 σ, τ, KMS | SU_q(2) | r18: `σ_(−i)(a)=4a`; `4/5` vs inverse `1/20`; `τ_(−i)(c)=c/4` | pass | none |
| 19 | §4.2 regular unitary | ℤ; ℂ; C₂ | r18: pentagon on (1,2,5) and (1,3,3) both reach (1,3,6); `\|2+i\|=√5`; `‖1+u‖=2` vs √2 | pass | none |
| 20 | §4.3 coamenability | ℤ; F₂ | r18: Følner `2/(2N+1)→0`; `2√3<4`; BMT Thm 2.2 needs both conditions | pass | none |
| 21 | §5.1 SU_q(2) presentation | entries of `u*u`, `uu*` | r18: `ac=qca`, `ac*=qc*a`, `c*c=cc*`; `S²(c)=c/4` | pass | none |
| 22 | §5.2 O_F^+ | `F=[[0,1],[−2,0]]`; n=1 | r18: `FF̄=−2I`; `‖E‖²=5`; `5/2≥2`; n=1 gives `u=u*`, `u²=1` | pass | none |
| 23 | §6.2 finite generators | H=0; H=ℂ | r18: quotient ℂ; `dim A_(≤1)=2`; bicommutant step | pass | none |
| 24 | §7.1 Haar on SU_q(2) | q=1/2; q=±1 | r18: `4/5`; `16/21`; endpoints 1/2, 1/3 | pass | none |
| 25 | §7.2 fusion, dimensions | `F=[[0,1],[−2,0]]` | r18: `β=25/4=d²`; `δ=−5/2`; dims `1, 5/2, 21/4, 85/8` | pass | none |
| 26 | §8.1 Hopf convention | Virelizier §2.3 | r18: same ΔE, ΔF, ΔK, S; `[2]=5/2`; `KF=4FK` | pass | none |
| 27 | §8.2 ladders | L₂⁺; L₁⁻ | r18: weights `1/4,1,4`; F `1,5/2,0`; `EF−FE=diag(−1,1)` on L₁⁻ | pass | none |
| 28 | §8.3 Casimir | L₀⁺, L₁⁺, L₂⁺ | r18: `10/9, 17/9, 65/18`; distinctness via `q^(2k)≠1` | pass | none |
| 29 | §8.4 local finiteness | L₀⁻; Verma | r18: L₀⁻ locally finite, not type 1; Verma weights `4^j` | pass | none |
| 30 | §8.5 Clebsch–Gordan | m=n=j=1 | r18: `α₁=−1/2`; middle term 5/4; `tr K⁻¹=ε[m+1]` | pass | none |
| 31 | §8.6 compact form | m=1 | r18: `h₁=1/2`; `⟨F,ac⟩=q⟨F,ca⟩`; `⟨FE,a*a+c*c⟩=0` | pass | none |
| 32 | §8.7 classical specialization | v=1, m=2 | r18: F `1,2,0`; `[E,F]=diag(2,0,−2)`; `[n−i+1][i]→(n−i+1)i` | pass | none |
| 33 | Modular automorphism and Kac equivalence (r18 rows, then absent) | — | Now rows 1–2 | stated | repaired |

**Library declarations opened at the pins** (Tau Ceti `2fd255d9`):
- `TauCeti.StarCoalgebra`, `Algebra/Coalgebra/Star.lean:46`: the field `comul_star`. Its module docstring notes `counit_star` follows.
- `TauCeti.PivotalCategory`, `CategoryTheory/Monoidal/Pivotal/Basic.lean:76`.
- `TauCeti.SphericalCategory`, `Pivotal/Spherical.lean:69`.
- The elaborated `HopfAlgebraStruct.antipode ℂ`, which is what `HopfAlgebra.antipode ℂ` in the Kac statement elaborates to.

**Remarks on untouched text** (no change requested in this incremental round):
- Layer 4's `### Dependencies` paragraph (`:924`) says "§4.1 is algebraic" and names no Layer 3 input. §4.1's *Needs:* line names §3.1 and now §§3.2–3.3. A clause "§4.1 uses §§3.1–3.3" would align the two.
- The board manifest's `nt` entry records `cited_for = ["Q0.3"]` only. §4.1 now also cites `nt` Thm 1.6.6, Thm 1.7.3 and Prop 1.7.7. This is for the worker; the manifest is outside the folder.

## Not verifiable

- Timmermann, *An Invitation to Quantum Groups and Duality* (EMS 2008): recorded `uncertified` (paywalled). §4.1's Prop 2.2.4, Remark 2.2.2(iv)(c) and Thm 3.2.12, and the §§3.2–3.3 locators the new *Needs:* line relies on, are cited by locator only. I checked their mathematics by the computations above and against `nt` Thm 1.6.6, Thm 1.7.3 and Prop 1.7.7.
- Ownership against open pull requests: I checked by `roadmaps grep` over all 456 open heads for the new objects, and against #1705 through `roadmaps show`. Other open pull requests were not read in full.

## Source issues

- none

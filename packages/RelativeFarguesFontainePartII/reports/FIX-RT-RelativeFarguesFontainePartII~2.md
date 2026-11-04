# FIX-RT-RelativeFarguesFontainePartII~2: red-team round 2 repaired

Files edited: `packages/RelativeFarguesFontainePartII/README.md`, `packages/RelativeFarguesFontainePartII/design/plan.json` (the `section` of one `gaps` entry only), and `packages/RelativeFarguesFontainePartII/Suggested.lean` (its module header only, in the repair pass below; no declaration changed). `metadata.toml` and `sources.toml` are unchanged.

## RT-RelativeFarguesFontainePartII~2a/F01 (P2) — applied

Verified: FF17 line 5338 heads the chapter "le cas F alg. clos", and Théorème 2.6.1 (FF17 line 5288) is stated there; the witness holds (E=𝔽₃((π)), F the completed perfection of 𝔽₃((t)): π²−t has slope 1/2 ∉ ℤ[1/3]=v_F(F×), so no linear factor π−[z] exists). §3.5 statement: "list all zeros below ρ₀ … linear generators" → the convergence of W holds for every standing F; the decomposition assumes F algebraically closed (zeros of radius ≤ ρ₀ are degree-one by §3.1), with the general-field exact near-zero product referred to §4.9. Added the witness as a §3.5 Check (degree-two factor (π²−t)/π² = 1−[t]/π² splitting only over the completed algebraic closure). §5.5 Needs: removed §3.5 (its "exact tail products" now cite §4.9). No other general-field section cited §3.5.

## RT-RelativeFarguesFontainePartII~2a/F02 (P2) — applied

Verified at the head of FiniteFlatGroupsAndIntegralPadicHodgeTheory (merge order before this roadmap): §R07.2.28a constructs the p-typical CW with nilpotent tails, stabilized addition, F, V, finite-length inclusions and base change over a perfect base, so the base 𝔽_p covers every 𝔽_p-algebra. §1.12: "define the unipotent covectors … full covectors allow a negative tail" → for E=ℚ_p import CW and CWu from §R07.2.28a; for every E construct the ramified version from the §0.1 truncations and identify it with the import at E=ℚ_p; §1.12 keeps BW, the growth condition and summation. Added the supplier contract "From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory", the §1.12 Needs entries (§0.1; §R07.2.28a), the Scope sentence, the Layer 1 Dependencies supplier, and the Check (ℚ_p/ℤ_p with V=p at R=𝔽_p; constant ε-tail over 𝔽_p[ε]/ε² is full but not unipotent).

## RT-RelativeFarguesFontainePartII~2a/F03 (P2) — applied

Verified the witness: q=2, v_F(t)=1, b=1+Σ_(i≥1)[t^(2^(−i))]π^i ∈ M₀, and v₁(φ^k(b)−1)=min_(i≥1)(2^(k−i)+i)=k+1 (i=k and i=k−1 attain it), so the error tends to 0 but (k+1)/2^k→0: no exponential rate in q^k. §6.4 route: "factors approach 1 exponentially in q^n by the positive coefficient bound" → uniform convergence on each compact J⊆(0,1) by a cutoff on the index m (terms |b_m|^(q^n)ρ^(m−d) ≤ ρ₂^(m−d) for m>M) followed by q-powers of the finitely many remaining coefficients; the eigen-ratio and divisor assertions are unchanged. Added the witness as a §6.4 Check. §§3.5, 4.9, 6.5 make no rate claim (searched "exponential": the other two occurrences are the bivector growth condition of §1.12 and the Newton corrections of §8.8, both unrelated).

## RT-RelativeFarguesFontainePartII~2a/F04 (P2) — applied

Verified at the head of PadicDifferentialEquationsAndRigidCohomology: §RD.0.51(b) gives C^(G_κ) = completed perfection of κ for every complete characteristic-p κ, and §RD.0.52 the ramified Witt-coefficient fixed field (its coefficient ring W(ℓ,O) of §RD.0.6 is mixed-characteristic only). §4.1: "Moreover C^(G_F)=F and W_OE(O_C)^(G_F)=A_F" → C^(G_F)=F imported from §RD.0.51(b) (F perfect and complete, so its completed perfection is F); the Witt statement follows by uniqueness of Teichmüller coefficients, with §RD.0.52 cited for the mixed-characteristic field form and the integral/equal-characteristic forms kept here. Route: the quantitative PerfectoidSpaces contract now serves only the continuous-cohomology assertions. Added the §RD.0.51 Needs entry, the RD supplier-contract sentence, the Layer 4 Dependencies supplier, and the Check (F=completed perfection of 𝔽_p((t)) versus the imperfect 𝔽_p((t)), whose invariants contain t^(1/p)).

## RT-RelativeFarguesFontainePartII~2a/F05 (P3) — applied

The four first bullets of §§3.1–3.4 described the proof, repeated a convention or announced scope. Replaced by computed instances: §3.1 (π−[a])² has two factors with multiplicity, a distinct-zero count gives one; §3.2 f=1 evaluates to 1 with Gauss bound 1≤1 and is not in m_y B_I; §3.3 |a|=q⁻² gives source slope 2 and radius q⁻², excluding the swapped reading; §3.4 F=ℂ_p^♭, I={p^(−√2)} has no classical point, B_I a field with maximal ideal (0). The proof commentary they carried was already in the proof paragraphs.

## RT-RelativeFarguesFontainePartII~2b/F01 (P3) — applied

Verified at the head of VectorBundlesAndIsocrystals: no occurrence of VB−1/VB0/VB1/VB2/VB3 and no `banach-colmez-space-definition` anchor; the cited section titles exist under "Layer 0" (Ramified coefficient rings…, Relative annuli…, Marked untilt Cartier divisors…, Completed local period rings, Rank-one Frobenius twists, Homogeneous section ring…), "Layer 1: Finite isocrystals…" (Coefficient category and rational blocks, which fixes Ĕ), "Layer 2" (Annular Frobenius descent…, Finite projective Frobenius modules…, Slope-sensitive cohomology…, Classical points…, Regular noetherian geometric curve…), "Layer 3" (Norm topology on twisted Frobenius invariants), "Layer 4" (Classification and Hom/Ext calculations), "Layer 5" (Banach–Colmez section and hypercohomology sheaves; Lubin–Tate universal cover and sections of O(1); The fundamental untilt sequence and degree-one divisors). Replaced every label accordingly (Scope lines, supplier contract, §§0.1, 0.1 Q-twist, 1.13, 6.1, 10.5, 11.6 prose, the 30 Needs lines and the two radius-dictionary clauses); deleted the stale anchor; plan.json gap `positive-degree-two-obstruction` section → "Layer 5 Banach–Colmez section and hypercohomology sheaves". No label of that form remains (grep).

## RT-RelativeFarguesFontainePartII~2b/F02 (P3) — applied

Recomputed the union of the `*Needs:*` lines per layer (script over the README; the only mismatches with the reviewer's lists were supplier-section tokens "AdicSpaces §§6.1–6.4" and "LocallyAnalyticDistributions §0.0" that are not roadmap-internal references). The reviewer's nine layer lists and three supplier omissions are correct. Dependencies lines now: Layer 2 "0"; Layer 4 "0, 2, 3"; Layer 5 "0, 1, 3, 4"; Layer 6 "0, 1, 2, 3, 4, 5"; Layer 7 "2, 4, 5, 6"; Layer 8 "0, 1, 5"; Layer 9 "0, 1, 4, 5, 8"; Layer 10 "0, 1, 2, 4, 5, 6, 7, 8, 9"; Layer 11 "1, 2, 3, 6, 7"; Layer 0 suppliers add NewtonPolygons and PadicDifferentialEquationsAndRigidCohomology; Layer 8 adds LocallyAnalyticDistributions; and, from this round's repairs, Layer 1 adds FiniteFlatGroupsAndIntegralPadicHodgeTheory and Layer 4 adds PadicDifferentialEquationsAndRigidCohomology. Rerun of the script after the edits: every summary equals its union.

## RT-RelativeFarguesFontainePartII~2b/F03 (P3) — applied

Each of §§2.11, 4.5, 6.5, 6.6, 10.6 had two Checks. Added one computed Check each, in my own wording after verifying the instance: §2.11 (ε₂=π·ε₁=ε₁^q: proximity sup_a v_F(ε₁−a·ε₂)=v_F(ε₁) finite although y_(ε₂)=φ(y_(ε₁))); §4.5 (marking composed with Frobenius: same field K_y, point (π−[c]) ↦ (π−[c^(1/q)])=φ⁻¹(y) in the ideal action, v(π) divided by q); §6.5 (b=π−[a], v_F(a)=1, q=2: zeros at radii 2^(−2^n), n<0, none of radius ≤ 1/2; forward translates accumulating at 0 could not lie in Bᵇ); §6.6 (Pi(b)∈P₀=E for b∈M₀; d=1, q=2, ||y||=1/2: one zero per radius 2^(−2^n), degree 1 on (1/4,1/2]); §10.6 (Φ(e)=[c]⁻¹e: degree 0, fixed line E·[w]e with w^(q−1)=c, character σ↦σ(w)/w in μ_(q−1), trivial iff c∈(F×)^(q−1); trivial for q=2, order 2 for q=3 and c=t over the completed perfection of 𝔽₃((t))). The reviewer's §10.6 wrong-model clause ("nontrivial class to c=1") was replaced by the (q−1)-st-power quotient control, which is what the character actually tests.

## Checks run

- `lake env lean …/Suggested.lean` from the content checkout, after the repair pass below: exit 0; only the three expected `declaration uses sorry` warnings (now at lines 46, 68, 83), and no longer the module-system warning on `import Mathlib`.
- `#check @name` scratch file (the repaired file with the three `#check` lines appended inside the namespace), elaborated once after the repair: the three elaborated types are identical to the worker's `signatures.md` and to the previous run, and match README §§11.2, 11.3, 11.5 (all binders explicit on the theorems; no section variables). Nothing changed.
- Dependency check (`gate --depcheck … --movable`), rerun after the repair pass: `depcheck: 210 roadmaps, 1836 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The two new supplier citations (FiniteFlatGroupsAndIntegralPadicHodgeTheory, merge order line 52; PadicDifferentialEquationsAndRigidCohomology §RD.0.51–0.52, line 134) precede this roadmap (line 140).
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- No gate failures were listed in the brief.

## Repair pass: the worker's build warning

The worker's build reported one problem: `TauCetiRoadmap/RelativeFarguesFontainePartII/Suggested.lean` imports `Mathlib` from a package built for the module system, and the file should start with `module`. Repaired in place, following the form of the roadmap on main that already uses the module system (CoboundaryExpansion `Suggested.lean`): the file now begins `module`, imports with `public import Mathlib` (still the single Mathlib import, no `Mathlib.<submodule>` line, no other import), and opens a `public section` before the namespace so that its three theorems stay visible to importers, as they were before. No declaration, docstring, binder or README text changed; the README names the same three Lean declarations. Elaboration and the signature comparison above were rerun on the repaired file.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §3.5 decomposition, geometric hypothesis | E=𝔽₃((π)), F=completed perfection of 𝔽₃((t)), f=π²−t; f=π−[a] over any F | slope 1/2 ∉ ℤ[1/3], no z with v(z)=1/2; (π²−t)/π²=1−[t]/π²=(1−[√t]/π)(1+[√t]/π) over C; π−[a] linear for every F | hypothesis added; Check added |
| §3.5 convergence of W | z_i=a^i, |a|<1, ρ fixed | errors |a|^i/ρ→0 for any F | holds for every F; stated |
| §5.5 without §3.5 | I=(0,ρ], zeros escaping to 0 over general F | §4.9 W has the exact near-zero divisor; g_n=f/a_n as before | Needs edge removed, route intact |
| §1.12 identification at E=ℚ_p | R=𝔽_p; R=𝔽_p[ε]/ε² | colim(ℤ/p^n,V=p)=ℚ_p/ℤ_p both sides; constant tail ε: (ε)²=0 so full covector, infinite support so not unipotent | Check added |
| §1.12 ramified CW | E=𝔽_q((π)), R=𝔽_q | W_OE,n(𝔽_q)=𝔽_q[π]/π^n, colim along V=π is 𝔽_q((π))/𝔽_q[[π]] | consistent with the p-typical case |
| §4.1 fixed field | F=completed perfection of 𝔽_p((t)); κ=𝔽_p((t)) | completed perfection of F is F; of κ contains t^(1/p) ∉ κ | import valid; Check added |
| §4.1 Witt invariants | x=Σ[x_n]π^n fixed by G_F | σx=Σ[σx_n]π^n (σ fixes π), uniqueness gives x_n∈C^(G_F)∩O_C=O_F | coefficientwise derivation holds for both characteristics of E |
| §6.4 uniform convergence | b=1+Σ[t^(2^(−i))]π^i, q=2, ρ=1/2; b=π−[a] | v₁(φ^k(b)−1)=k+1; for π−[a] error |a|^(q^k)/ρ | rate claim removed; Check added |
| §6.4 cutoff bound | m>M, ρ≤ρ₂<1 | |b_m|^(q^n)ρ^(m−d) ≤ ρ₂^(m−d) for every n | tail bound independent of n ✓ |
| §3.1 Check | (π−[a])² | two factors with multiplicity, one distinct zero | discriminates |
| §3.2 Check | f=1 at y | θ_y(1)=1, 1≤1, 1∉m_y B_I | discriminates zero map |
| §3.3 Check | π−[a], |a|=q⁻² | slope 2, radius q⁻² | pins convention |
| §3.4 Check | F=ℂ_p^♭, I={p^(−√2)} | |F×|^(1/d)=p^ℚ ∌ p^(−√2): no point; maximal ideal (0) | agrees with §§5.1, 5.3 |
| §2.11 Check | ε₂=π·ε₁=ε₁^q, a∈O_E× | v(a·ε₂)=q·v(ε₁)>v(ε₁), sup=v(ε₁) | finite, points distinct ✓ |
| §4.5 Check | ι∘Frob_F, y=(π−[c]) | new θ kills [c^(1/q)]: point φ⁻¹(y), v(π)=v(c)/q | matches Conventions' ideal action |
| §6.5 Check | b=π−[a], v(a)=1, q=2 | radii 2^(−2^n), n<0: 2^(−1/2), 2^(−1/4),…→1; Bᵇ elements: slopes ≥λ₁ only for n≤v(a'_0)/λ₁, finitely many | discriminates forward model |
| §6.6 Check | d=0; d=1, q=2, ||y||=1/2 | P₀=E; radii 2^(−2^n), n∈ℤ, one in (1/4,1/2], degree 1 | ✓ |
| §10.6 Check | Φ(e)=[c]⁻¹e; q=2; q=3, c=t | w^(q−1)=c; 𝔽₂×=1 trivial; v(w)=1/2 ∉ ℤ[1/3], class of order 2 | ✓ |
| Dependencies summaries | all 12 layers | unions of Needs lines recomputed after edits | all equal |

## Notes for the maintainer

- Ownership move recorded: the p-typical Witt covectors are now imported from FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.28a; §1.12 owns only the ramified/equal-characteristic extension, the bivectors and their summation. The fixed-field theorem C^(G_F)=F is imported from PadicDifferentialEquationsAndRigidCohomology §RD.0.51(b).
- Names other roadmaps cite: none changed. The three Lean declaration names and all section numbers of this roadmap are unchanged.
- The VectorBundlesAndIsocrystals citations now use that roadmap's current layer numbers and section titles; if it renumbers again, only these locators drift, not the mathematics.
- Ownership against open pull requests other than those the brief lists and those reachable through `roadmaps show`/`roadmaps grep` was not checked.
- No source needed fetching; `sources.toml` is unchanged and no `needs-references.toml` request was made.

# Repair report: red-team round 1 of GeneralAlgebraicKTheoryPartII

Two reviews were merged. Both number their findings from F01, so the sections are grouped under one heading per review: pass a (review r1a, F01–F07) and pass b (review r1b, F01–F05). Pass a's F03 and pass b's F01 are the same finding (the Witt characteristic-series gap); it is settled once, under pass a F03, and pass b F01 refers to that section.

# Review r1a (pass a)

## F01 (P2) — applied

Under §4.13, X⟨r⟩=fib(X→τ≤(r−1)X), so S³⟨3⟩=S³ (π₃=ℤ) and S²⟨2⟩=S². The fibers actually used are S³⟨4⟩ and J_rS²⟨3⟩. Changes:
- §4.31: S³⟨3⟩ → S³⟨4⟩, with an index sentence.
- §4.32: J_(2^m−1)S²⟨2⟩ and J_rS²⟨2⟩ → ⟨3⟩, with an index clause.
- Checks: S³⟨4⟩ has π₂=π₃=0 and π₄=ℤ/2; S²⟨3⟩≃S³ by the Hopf fibration.

There are no other uses of the notation in the README or the plan.

## F02 (P3) — applied

The witness holds. For trivial Hℚ, π_*(Hℚ^tS¹)=ℚ[t,t⁻¹] with |t|=−2, so π₀=ℚ≠0.

Supplier paragraph (AInfCohomology): "each Tate value is zero" → "finite C_p Tate spectra and the p-completed circle Tate spectrum vanish, but the raw circle Tate spectrum has π₀=ℚ". Both sides of the completed comparison are zero. No other README text claims that the rational circle Tate spectrum vanishes.

## F03 (P2) — applied

This section also settles pass b F01.

QWittVectors §1.4a (its open head, lines 203–233) supplies γ_∞:(W_(ℕ>0)(R),+)≅U_∞(R), γ_∞=∏(1−a_dt^d)⁻¹, with:
- coefficient naturality;
- restriction compatibility;
- the Verschiebung law;
- the Teichmüller law γ_∞(τ(a))=(1−at)⁻¹.

§1.3 supplies the ring structure and the inverse-limit topology.

Changes:
- Deleted gap:witt-characteristic-series from the README contract and from plan.json `gaps`.
- The contract now consumes §§1.3, 1.4 and 1.4a and defines χ=γ_∞⁻¹. Inversion is an automorphism of the abelian group U_∞ that commutes with truncations, so χ is again a natural additive isomorphism. The transported product gives (1−at)*(1−bt)=1−abt from τ(a)τ(b)=τ(ab).
- §4.36 now proves the ghost identity −tχ′/χ=Σw_n t^n, over ℤ[a_d] by the computation Σ_(d|n) d·a_d^(n/d), then specialized. One Check was added: χ=1−t² gives 2t²+2t⁴+⋯, which matches w₂=w₄=2 for a=(0,1).
- §4.36's Needs now names QWittVectors §§1.3, 1.4 and 1.4a.

## F04 (P1) — applied

The finding is right. bsy Corollary 5.2 (bsy line 2419) is derived from Theorem 5.1, the Lubin–Tate cover theorem (bsy line 2416). That proof uses:
- the colocalization E(−)⊣(−)♭ of Theorem 2.38 (line 809);
- the small-object Corollary 4.37 (line 2141);
- Theorem 4.40 with Corollary 4.44;
- Propositions 5.9, 5.15 and 5.17;
- at height zero, Theorem 5.3 (line 2443).

No roadmap owns this material: `roadmaps grep -i Nullstellensatz` and the board packages give no chromatic owner. So this roadmap owns it.

Changes:
- New target **§6.1a, "Lubin–Tate theories of perfect algebras and Lubin–Tate covers"**. It covers:
  - E(A) for perfect k-algebras, with π_*≅W(A)[[u₁…u_(n−1)]][u^±];
  - the colocalization and E(A)♭≅A;
  - the definition of a nilpotence-detecting map;
  - the cover theorem for T(n)-local R (n≥1) and for rational R, both with A of Krull dimension ≤0.

  It has a locator, a proof route, three Checks and a Needs line.
- §6.2's route is replaced: apply the cover, get A≠0 from nilpotence detection, then compose R→E(A)→E(L) with L the algebraic closure of a residue field. §6.2's Needs now names §6.1a. §4.27 was dropped from it, since the route no longer uses Hahn.
- Same pattern in §6.5: "use the Nullstellensatz" → "apply §6.2".
- Scope, the module docstring of `Suggested.lean` and the `bsy` entry in `sources.toml` (locators and cited_for) were updated.

## F05 (P3) — applied

The witness holds: lmmt line 644 is the tail of a cross-reference. The four uses now cite:
- §3.2: lmmt line 753 (discussion before Prop 3.12, pp.1026–1027);
- §3.5: lmmt line 771 (proof);
- §3.6: lmmt line 765 (Prop 3.12 and proof);
- §10.1: lmmt line 765 (Prop 3.12), with Corollary 4.31 kept.

"lmmt line 644" no longer occurs anywhere.

## F06 (P3) — applied

Both sources were fetched legally through the sources service:
- `mah81`: Mahowald, *bo-resolutions*, from the Pacific J. Math. open archive (msp.org), licence class publisher-open.
- `mil81`: Miller, *On relations between Adams spectral sequences…*, from the author's MIT page.

Locators were verified:
- mah81 line 46: Theorem 1.1, pp.365–366.
- mah81 line 633: Theorem 6.3, p.382 (page 19 of the PDF, printed 382).
- mil81 line 272: Theorem 4.11; Corollary 4.12 follows, pp.294–295.

Changes in §4.20:
- The citation now uses the primary sources; lmmt and bhls are kept as background.
- The route is rewritten: Miller's computation 𝔽_p[v₁^±]⊗Λ at odd p, and Mahowald's bo-resolution at 2, then the Bousfield-class identity ⟨T(1)⟩=⟨v₁⁻¹V⟩=⟨L_K(1)V⟩=⟨K(1)⟩.
- Needs now adds BordismFormalGroups F6.3 and GeneralizedCohomology G5.1–G5.4.
- Both works were added to `sources.toml` and the References.

## F07 (P3) — applied

§4.10: the three bullets that restated the interface were replaced. With E=v⁻¹Σ∞V and X=Ω∞E:
- π₀Φ_v(X)=[V,E]=[E,E] contains the nonzero localization class, so the zero functor fails.
- π_(−kd)Φ_v(X)≠0, so a connective output fails.
- The v-versus-v² cofinality check is kept, computed on the same example.

The finite-Postnikov Check is kept.

§4.29: the two restating bullets were replaced by R=KU₂^∧ at p=2. Here π₀(R^tC₂)=ℤ₂((x))/(x−2)≅ℚ₂, so the i=0 hypothesis fails, consistently with T(1)R≠0. At i=1 the Tate spectrum is rational, and T(j)R=0 for j≥2.

# Review r1b (pass b)

## F01 (P2) — applied

Same finding as pass a F03; settled there (gap deleted from the README contract and plan.json `gaps`; χ=γ_∞⁻¹ defined from QWittVectors §§1.3–1.4a; ghost identity proved in §4.36).

## F02 (P2) — applied

KTheoryFiniteLocalFields (open head) §6.5a, d=0 case, together with §1.6's completion gives π_*K(L)^∧p=ℤ_p[β]. These groups alone do not identify the spectrum with ku^∧p or show that β acts as v₁. §6.4 needs both, to conclude L_T(1)K(E₀(L))≠0.

So the gap is narrowed rather than deleted. It now asks only for the homotopy-ring-spectrum identification that sends the §1.2 Bott class to the Bott generator, and says the coefficient groups already follow from §§6.5a and 1.6. The README and plan.json were updated, and §6.4's Needs adds KTheoryFiniteLocalFields §1.2.

## F03 (P2) — applied

Verified at the pins:
- RefinedTraceMethods §4.14 (open head, lines 2034–2052) builds connective bimodules and the derivation-pullback algebra A×_(A⊕ΣI)A.
- GeneralizedCohomology G3 item 8 (main, lines 785–873) builds τ≥k and τ<k, the absolute smash connectivity bound and module covers. It provides no E₁-ring τ≤k and no relative tensor bound.

The gap's `needs` is rewritten to ask only for:
- the E₁ structure on τ≤kR;
- the k-invariant derivation whose §4.14 pullback is τ≤kR;
- the I⊗_A J connectivity bound.

§4.39 and §4.40 Needs now cite RefinedTraceMethods §4.14, GeneralizedCohomology G3 item 8 and gap:multiplicative-postnikov. §4.40 had previously omitted this gap even though its route uses it.

## F04 (P3) — applied

All 20 occurrences of "RefinedTraceMethods §§2.1–2.17, 4.9–4.18 and 6.1" were replaced. Section titles were checked at the RefinedTraceMethods head.

| Target | Needs now |
|---|---|
| §4.19 | entry deleted (no trace input) |
| §4.22 | §§2.1–2.5 |
| §5.2 | §§4.9, 4.11, 4.17 (DGM), 2.9 |
| §5.3 | §§2.1–2.2, 2.11–2.12 |
| §5.4 | §§2.3, 2.9 |
| §5.6 | §§4.11, 4.17, 2.9 |
| §6.3 | §§2.3, 2.9 |
| §6.6 | §4.14 |
| §8.3 | §§2.1–2.2, 4.6 |
| §9.6 | §2.9 |
| §9.7 | §§2.10, 2.9 |
| §10.2 | §§4.11, 4.17, 2.9 |
| §§10.3–10.4 | §§2.10, 2.9 |

The six Layer Dependencies lines were set to the union for their layer. §6.1 is gone everywhere. Same pattern in §9.6's statement: "imported from §§4.9–4.18" now names the two gaps it actually uses.

## F05 (P3) — applied

GeneralizedCohomology G5.4 (main, around line 1676) and TopologicalKTheory T7 (main, line 1245) use a (degree 4), b (degree 8) and u (complex), with a²=4b, c(a)=2u² and c(b)=u⁴. Both supplier paragraphs now use these names.

Same pattern in §8.6: the real Bott class β was renamed b (b∈π₈ko, A[b⁻¹]). No other β there denoted a real Bott class. KTheoryFiniteLocalFields' finite-coefficient β keeps its own name.

# Outcome of the checks

## Checks

- **Elaboration:** `lake env lean packages/GeneralAlgebraicKTheoryPartII/Suggested.lean` from the content checkout exited 0 with no output (rerun this round). The file still has no declarations; only one docstring bullet changed.
- **`#check @name` audit:** there are no declarations, so the scratch audit is empty and no signature changed.
- **Dependency check:**
  ```text
  depcheck: 56 roadmaps, 651 edges, 0 problem(s)
  ```
  No UPWARD, CYCLE or moved line.
- **`roadmaps resolve`:** no cross-roadmap citation and no Lean name was found missing (rerun this round, main 546d9e4, 354 open heads).
- **Mathlib name:** `WittVector` (newly backticked in §6.1a) exists at the pin, `Mathlib/RingTheory/WittVector/Defs.lean:52`.
- **Gaps:** 32 in plan.json (was 33). They agree with the README's "must provide" lines, and every gap the README uses is declared.

## Adversarial pass on new and changed statements

| Statement | Instances | Values | Result / change |
|---|---|---|---|
| §4.31 S³⟨4⟩ | §4.13 convention, r=3,4 | S³⟨3⟩=S³ (π₃=ℤ); S³⟨4⟩: π₂=π₃=0, π₄=ℤ/2 | consistent after re-index |
| §4.32 J_rS²⟨3⟩ | r=1 | S²⟨3⟩≃S³: π₂=0, π₃=ℤ; ΩS²⟨2⟩ would have π₁=ℤ | consistent; integral π₀ claim needs ⟨3⟩ |
| AInf circle Tate Check | trivial Hℚ; C_p; S¹ raw and completed | C_p: norm ×p invertible → 0; raw π₀(Hℚ^tS¹)=ℚ; completion 0; RHS (0)^h=0 | corrected |
| χ=γ_∞⁻¹ | a=0, τ(1); (1,0)+(1,0)=(2,−1) over ℤ, N=2 | χ(0)=1; χ(τ(1))=1−t; χ(2,−1)=(1−2t)(1−(−1)t²)=1−2t+t² mod t³=(1−t)²=χ(1,0)² | additive; agrees with QWittVectors §1.4a Check after inversion |
| Ghost identity | a=τ(c); a=(0,1) | ct/(1−ct)=Σcⁿtⁿ=Σw_n; 2t²/(1−t²): w₂=w₄=2, w₁=w₃=0 | holds; sign check vs γ_∞ gives negatives |
| §6.1a nilpotence and A≠0 | R=0; R≠0, A=0 | R→0 detecting ⇒ id_R nilpotent ⇒ R=0 | Check added |
| §6.1a cover | R=E(L); R=Hℚ[x] | identity cover, A=L; single map to ℚ(x) kills id_{R/x} (not nilpotent); ∏ residue fields reduced, dim 0 | Checks added |
| §6.2 route | R=E₁(L), Hℚ, H𝔽_q (q≠p) | identity; rational A≠0 → E₀(L̄); H𝔽_q⊗ℚ=0, so no input | consistent with statement |
| §4.20 route | p=2,3; V=S/p or Y | Miller: π_*v₁⁻¹V=𝔽_p[v₁^±]⊗Λ(δv₁)=π_*L_K(1)V; ⟨L_K(1)V⟩=⟨E(1)⊗V⟩=⟨K(1)⟩ | sound; p=2 via bo |
| §4.10 new Checks | E=v⁻¹Σ∞V, X=Ω∞E | π₀=[V,E]∋loc≠0; π₋kd≅π₀; v² cofinal | discriminates zero functor and connective output |
| §4.29 new Check | KU₂^∧, p=2, i=0,1 | ℤ₂((x))/(2x−x²)=ℤ₂((x))/(x−2)≅ℚ₂≠0; rational Tate ⇒ T(1)-local 0; T(j)KU=0, j≥2 | consistent |
| gap suslin (narrowed) | L=ℚ̄, p=2 | π₀=ℤ₂, π₁=0, π₂=ℤ₂ from §§6.5a/1.6; ring identification still needed for v₁↦β^(p−1) | gap kept, narrowed |
| gap multiplicative-postnikov | k=1, R=HA⊕ΣHA | τ≤0R=HA; derivation into Σ²HA; pullback recovers τ≤1R=R | degrees consistent with §4.14 (ΣI, I=Σ^kHπ_k) |
| §8.6 b-rename | A=ko | b∈π₈ko; ko[b⁻¹]=KO; a²=4b | consistent with G5.4 |

The χ row inverts the QWittVectors §1.4a Check γ_2(2,−1)=1+2t+3t²: its inverse is 1−2t+t² mod t³, matching the computed χ(2,−1).

## For the maintainer

- **Ownership:** the Lubin–Tate cover theorem (bsy Theorem 5.1) is now owned here as §6.1a. It was searched by object ("Nullstellensatz", Lubin–Tate covers) on main, in the board packages and across the open roadmap pull requests, with no owner found. ChromaticHomotopyTheory, a later consumer, should import §6.1a with §6.2 rather than plan it.
- **Gap changes for suppliers:**
  - QWittVectors no longer receives gap:witt-characteristic-series.
  - KTheoryFiniteLocalFields' gap is narrowed to the ring-spectrum identification.
  - EnhancedDerivedSheaves' gap:multiplicative-postnikov is narrowed. It now cites RefinedTraceMethods §4.14 and GeneralizedCohomology G3 item 8 as already supplying the square-zero algebras and the spectrum truncations.
- **Not available in this build:** `plan.json` nodes do not list the new §6.1a, because only `gaps` may change in this job.
- **Sources:**
  - Two works were added (`mah81` publisher-open, `mil81` author-page). An earlier `needs-references.toml` entry for mah81, written before the licence class was supplied, was resolved by the second fetch and removed. No text is missing.
  - The sources service rewrote some unrelated `sources.toml` entries, moving `venue` keys; no values changed.
- **Suspicious text:** none found in the reviews.
- **Supplier section names:** RefinedTraceMethods' headings at its head are §4.17 "Nilpotent invariance and the rational comparison" and §4.19 "Assembly and low-degree symbols". This README cites them by the target labels used inside those sections, "The Dundas–Goodwillie–McCarthy theorem" and "The TC assembly map for C_p". RefinedTraceMethods itself cites §4.17 the same way. The resolver accepts both labels.
- **Re-verification this round:** the following were checked again against the cached texts and the supplier heads:
  - bsy lines 809–820, 2026, 2141, 2177, 2246, 2416–2421, 2443, 2511, 2593 and 2633;
  - lmmt lines 644, 753, 765 and 771;
  - mah81 lines 46 and 633, and mil81 line 272;
  - QWittVectors §1.4a and GeneralizedCohomology line 1677 (a²=4b, c(a)=2u², c(b)=u⁴);
  - KTheoryFiniteLocalFields §§1.2, 1.6 and 6.5a.

  Each of them agrees with the README text.

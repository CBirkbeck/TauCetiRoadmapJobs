# Review of AutomorphicSpectralTheoryPartII (pull request #1761 at d8ea553)

**Verdict:** accepted

Incremental re-review of the 4 changed lines since 9fe55e7: the diff rewrites the first two Checks of §4.5a (`TauCetiRoadmap/AutomorphicSpectralTheoryPartII/README.md` lines 1441 and 1443), which is exactly the passage the previous review's R01 asked to repair. Nothing else in the folder changed, `Suggested.lean` is byte-identical to the head the previous review read, and no file outside the folder changed. No finding remains.

## Previous findings

- R01 — repaired: "the K∞-invariant discrete spectrum consists of the constant function and the even Maass cusp forms for SL₂(ℤ) … about R/24 even Laplace eigenvalues up to R … every d>0 works with any C>0 at least the dimension."

## Verified sound

**The repaired Checks, recomputed.** First Check (line 1441). K∞=PO(2) is the image of O(2), the maximal compact subgroup of PGL₂(ℝ). GL₂ over ℚ has class number one (det: GL₂(Ẑ)→Ẑ^× is onto and ℚ^×∖𝔸^×/Ẑ^×ℝ_{>0} is trivial), so PGL₂(ℚ)∖PGL₂(𝔸)/PGL₂(Ẑ) = PGL₂(ℤ)∖PGL₂(ℝ); the stabiliser of i in GL₂(ℝ) is ℝ^×SO(2), so PGL₂(ℝ)/PO(2) = (ℍ⊔ℍ̄)/⟨diag(1,−1)⟩ = ℍ, with a determinant −1 integral matrix acting through z↦−z̄ (diag(1,−1): z ↦ z̄/(−1)). Hence K∞-invariant, PGL₂(Ẑ)-fixed functions are functions on SL₂(ℤ)∖ℍ invariant under z↦−z̄, the even Maass forms, and L²_disc of PGL₂ at this level is constants plus cusp forms. The odd forms: the principal series Ind(sgn·|·|^s) of PGL₂(ℝ) restricted to O(2) contains det (det(diag(1,−1))=−1 matches sgn(−1)) and not the trivial type, so odd Maass forms carry the sign character, which descends to PO(2) because det(−1)=1; the even principal series Ind(|·|^s) contains the trivial type and not det. Areas: SL₂(ℤ)∖ℍ is π/3, the reflection quotient π/6; Weyl's law gives (π/6)/(4π)·R = R/24 even eigenvalues and (π/3)/(4π)·R = R/12 for both parities, i.e. for the type set {trivial, sign}. On right-K∞-invariant functions the Casimir of a nondegenerate invariant form is a nonzero constant times the Laplacian, so the count of |Ω|≤R is linear in R: d=1 works, and N(R)→∞ refutes any C with d=0. The factor-2 remark is the asymptotic ratio R/12 : R/24.

Second Check (line 1443). H anisotropic modulo centre gives H(ℚ)Z_H(𝔸)∖H(𝔸) compact; the K_f-fixed ω_H-equivariant functions live on finitely many H∞/Z_H,∞-orbits (the orbit space is the finite set H(ℚ)∖H(𝔸_f)/K_fZ_H(𝔸_f)), each a compact homogeneous space of the compact group H∞/Z_{H,∞}, on which a finite set of K_{H,∞}-types has finite multiplicity by Peter–Weyl. So the count is at most the dimension N for every R; with C≥N and any d>0, N ≤ C ≤ C(1+R)^d for all R≥0 (N=0 allowed). This now agrees with the statement's quantifier "C,d>0" at line 1433. The third Check is unchanged (Eisenstein series fill [1/4,∞)).

**Source locator of §4.5a**, unchanged by the diff but re-read since the Checks sit under it: bplzz line 1459–1463 (Remark 3.20, p.30): [Mül89, Theorem 0.1] in place of [Don82, Theorem 9.1] in the proof of Lemma 3.12; bplzz line 1263–1267 (Lemma 3.12, p.26): finite rank of Casimir eigenvalues on M_der via Donnelly with T finite. Both as cited.

**Gate and dependency check.** My run of the gate at d8ea553: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (the worker's run adds `build=0`). Dependency check with `--movable`: `depcheck: 239 roadmaps, 2428 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder: 0 paths. Pins: Mathlib f6090c70, Tau Ceti 358314d4. The worker's `resolve` and `overlaps` found nothing (no open pull request changes this roadmap, no cited id dropped or defined only by an open revision).

**Elaboration.** `lake env lean TauCetiRoadmap/AutomorphicSpectralTheoryPartII/Suggested.lean` at d8ea553: three `declaration uses sorry` warnings (lines 95, 108, 118), nothing else, exit 0. The file is unchanged since 9fe55e7, so the previous review's `#check @name` comparison of all ten declarations with the worker's recorded signatures (identical at this head, `scratch/signatures.md`) and its one-tactic probe (all three sorried theorems fail `first | rfl | simp | infer_instance | decide | exact?`, so none is padding) stand; the three Layer 0 headlines remain stated and the docstring still names the headlines that are not statable at the pins with their missing carriers.

**Consumers of the changed passage.** The Check is cited nowhere else; the §4.5a statement, proof route and `*Needs:*` line (lines 1433–1437) are unchanged, and its consumers §4.6, §4.7 and §5.7 (`*Needs:* … §4.5a`, lines 1453, 1465, 1641) and the Layer 4 Dependencies line use the counting bound, not the PGL₂ numbers. The gate's `readme-ids-missing=0` confirms the Check names no Lean counterpart.

**Adversarial table, changed statements** (values on each side).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 4.5a PGL₂ Check (line 1441) | K∞=PO(2), level PGL₂(Ẑ); diag(1,−1); Ind(|·|^s) and Ind(sgn|·|^s) restricted to O(2) | quotient PGL₂(ℤ)∖ℍ, z↦−z̄; area π/6 vs π/3; N_even(R)~R/24, both parities R/12; trivial type in the even series only, det in the odd series only; d=1 works, N(R)→∞ refutes d=0 | true | none |
| 4.5a anisotropic Check (line 1443) | D definite over ℚ, H=D^×/ℚ^×; dimension N; N=0 | finitely many compact H∞-orbits; 𝔗-isotypic part finite-dimensional; N≤C≤C(1+R)^d for C≥N, d>0, R≥0 | true, consistent with "C,d>0" | none |
| 4.5a continuous-spectrum Check (unchanged) | PGL₂/ℚ | Eisenstein spectrum [1/4,∞), count infinite for R>1/4 | true (r4) | none |

**Adversarial table, statements the diff leaves untouched** (carried from the previous reports, which computed them; sections unchanged at this head).

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 torus Paley–Wiener, Nash decay, product; 0.5 pullback; 1.2a multiplier, non-compact output, Weyl invariance, joint continuity; 2.5 isotypic sum; 2.15 tensor holomorphy; 2.15a central intersection, unitarity, Checks; 3.2 parametrix, kernel regularity, second slot; 3.6a GL₁, GL₂ Borel, WR constants, restriction of scalars; 4.6–4.7 routes; 5.7 refined components; Scope on CongruenceSpectralGap §5.1 (r4) | as listed there | ∫e^{−x²−λx}dx=√π·e^{λ²/4}; π/cos(πλ/2) with poles ±1; e^{−πxy} of infinite rank; ∫k(x)e^{−λx}dx=e^{λ²} with k(0)=(4π)^{−1/2}; μ(1)=e, μ(−1)=−e; ΔE=δ for E=e^{−|x|}/2; n_β(π,−s)=Λ_F(1−s)/Λ_F(1+s), value −1 at 0; 2/10=1/5, 2/5; q(it)=−t²−1/4 vs q(1/2)=0; 1/2−1/10=2/5 | true |
| 4.2a near equivalence, GL₁ Check, spherical criterion, eigenpart containment (r3) | GL₁/ℚ, ω⊗χ with χ₂(2)=−1; GL₂ Satake pairs (2,3),(3,2) | π(2)=−1, non-automorphic, line obtained; (1−2T)(1−3T)=1−5T+6T² vs 1−4T+4T² | true |
| 5.5, 5.6 (r3) | GL₂/ℚ, σ=χ₁⊗χ₂, χ₁≠χ₂; χ|·|^{±1/2} | isobaric strong multiplicity one returns {χ₁,χ₂}; χ∘det and St⊗χ share a.e. parameters | true |
| `finite_rank_weierstrass_product`, `HasRankBound`, interpolation theorems, `HasRapidVerticalDecay` (r1–r3) | p=0 Λ={n²}; p=1 Λ=ℤ; Λ=∅,{0}; Λ={1/(n+1)}; k=1, a=1/2, b=1 | least ranks 1, ∞; Ψ≡1 for ∅; Ψ′(0)=1; lattice points −1/2,1/2,3/2; exp(±z²) | true |
| §§0.4–0.10, 1.3–1.9, 2.1–2.14, 2.16–2.18, 3.1, 3.3–3.9, 4.1–4.4, 4.8–4.9, 5.1–5.4 (r1) | as listed there | e^n/(1+n)^d→∞; δ_B=4: 4^{±1/2}; GL₃ depth t vs modulus t⁴ at t=2: 2 vs 16; E₀(2)=−1; circle projector e_n(x)conj(e_n(y)) | true |

**Seeded sample, declared gaps, ownership, duplication.** The seeded targets (0.2, 0.3, 0.6, 0.8, 2.6, 2.11, 2.12, 3.3, 3.5, 3.7, 3.8, 4.1, 4.8, 5.1, 5.3), the sixteen declared gaps and the ownership searches were verified in the previous full reviews against the same cached texts and the same supplier heads; none of those sections changed at this head, and the overlaps and citation scans at this head list nothing. The diff introduces no new object, citation, declaration or supplier, so there is nothing new to audit for duplication or ownership; ownership against open pull requests was checked in the previous reviews through the `roadmaps grep` index and the sibling checkouts.

**Shape and policy of the changed lines.** Prose Checks, Unicode mathematics, no LaTeX delimiters, no pull-request numbers, process words or paths; each Check says what is computed and what a wrong reading gets wrong (the factor-2 miscount; the bounded count against "C,d>0").

## Not verifiable

- `bernstein` (Bernstein 1988): settled as uncertified; cited by locator only; not touched by this diff.
- [Mül89, Theorem 0.1] and [Don82, Theorem 9.1]: read only through their uses in bplzz at lines 1460–1461 and 1267; the Checks recomputed here use only Weyl's law for SL₂(ℤ) and its reflection quotient, not those texts.

## Source issues

- none

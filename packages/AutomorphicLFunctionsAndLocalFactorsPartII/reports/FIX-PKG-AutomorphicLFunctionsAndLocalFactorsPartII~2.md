# Repair report: automorphic L-functions and local factors, Part II, round 2

Files edited: `packages/AutomorphicLFunctionsAndLocalFactorsPartII/README.md`, `Suggested.lean`, `sources.toml`, and the top-level `gaps` list of `design/plan.json`. Nothing else changed, and no other key of `plan.json` changed: I diffed the parsed JSON before and after, and only `gaps` differs.

## F01 (P1) — not actionable in this package: the G1–G6 records are referenced by name from the `coverage` stages of `design/plan.json` (the `remaining` lists of stages D.0–D.10), which this round may not edit, so only the intake can retire them

None of G1–G6 is an unowned supplier gap. Every obligation is a target here or has a named supplier. The supplier parts are now slugged gaps, including the new `real-chevalley-contragredient` for G2's archimedean case. The owner of each record is tabulated under "For the maintainer", for the intake to retire the records.

## F02 (P1) — applied

- §6.10: "includes the local analytic construction" → CFK22 Lemma 7.3 plus the Remark 3.11 extensions.
- §7.2: the CFK Theorem A.1 bound is stated in the target (KAP23 Theorem 25).
- §7.6: k=1 is stated explicitly, from MetaplecticAutomorphicForms §6.10a; SO_c and GSpin_c are proved here.
- Same pattern in §10.3: the route is now CKPSS01 §2.

## F03 (P2) — applied

§1.3 is now the specialization of AutomorphicSpectralTheory §§1.1–1.4, 2.4 and 2.4a to the discrete datum χ(det Δ), and it cites MetaplecticAutomorphicForms §6.2. What it keeps: on U(W), w maps the character of I_EHLS(χ,s) to that of I_EHLS((χ^c)⁻¹,−s), i.e. z↔1−z; and the GU multiplier part. The ordered-residue route is deleted. One computed example is added.

## F04 (P2) — applied

`gap:ramified-hecke-prescription` is deleted from the README and from `gaps`. A new supplier section consumes GL2AutomorphicRepresentationsAndTransfer R16.1.8, which I checked at its head: full local groups, finite image, trivial at infinity, auxiliary ramification allowed. §§10.4–10.5 make the local choices and cite R16.1.8 in their *Needs* lines and in the Layer 10 dependencies.

## F05 (P2) — applied differently

- `gamma-supercuspidal-support` → EndoscopicTransferAndUnitaryTraceComparison §10.29, asking only for "equal γ ⇒ equal support" (HEN02 Proposition 1.9). Invariance follows from the §10.29 segment formula.
- The nongeneric ψ-law becomes the new `nongeneric-pair-epsilon-character-change`, to §10.29.
- Right convergence and global ψ-independence (CPS94 Lemmas 2.1–2.3) become targets of §10.3.

## F06 (P2) — applied

§3.2 now says that §3.15 supplies only the nonarchimedean case. For ℝ and ℂ, it is a target: θ inverts a fundamental Cartan subgroup, by explicit computation for U(p,q), GL_n(ℂ) and GL_n(ℝ) (the last after Ad(diag(1,−1,…))). It then applies the new `gap:real-chevalley-contragredient` (ADAMS14 Theorem 1.2, Corollary 1.4). The process sentence is deleted, and a GL₂(ℝ) Check is added.

## F07 (P2) — applied

§7.2: χ_π(−1)^(k−1) → ω_π(−1)^(k−1), with ω_π defined as the central character of π (CFK (A.3), line 1910). Three Checks are added: sgn on ℝ× with c=1, k=2 gives γZ=−Z*; k=3 is insensitive to the sign; sgn∘det on GL₂(ℝ) has ω_π(−1)=1. Same pattern in §6.5: π(i_G)^k → ω_π(i_G)^k.

## F08 (P2) — applied

- `hermitian-gspin-carriers` → `hermitian-unitary-groups` and `gspin-group-schemes`; the latter cites Mathlib `lipschitzGroup` and `spinGroup` and the Tau Ceti Lipschitz lemma.
- `speh-pole-detection` → its unitary-axis part is supplied by AutomorphicSpectralTheory §2.4; the rest becomes two slugs.
- `hermitian-automorphic-support` → two slugs, citing §5.12.
- `archimedean-rectangular-support` → five slugs.
- `opposite-unipotent-estimate` → restated on CFK Lemma 3.22's objects.

## F09 (P3) — applied

- "§§SR.2.1–SR.2.4" → "§§SR.2.1–SR.2.3 and §SR.0.4" (all 13 occurrences).
- SR.5.3 *segment-representations* → SR.5.2 *segment-representations* plus SR.5.3 *highest-derivative-adapter*.
- MetaplecticAutomorphicForms "§§3.3a–3.3b" → "§3.3 with §3.3b".
- OrthogonalSpinGroups "Layer 0" → "Layers 0–1".
- HARRIS: both the README and the manifest now say Remark 4.4(iii)–(iv), and (iii) is cited at §4.10.

## F10 (P3) — applied

In the `Suggested.lean` docstring: "README §§6.9" → "README §6.10". "§§" before a single section → "§" (lines 11, 14, 19, 23, 24, 25, 27). "Rectangular model" → "(k,c) model".

## F11 (P3) — applied

- §4.8: χ_alg=|·|_ℂ^μχ₀ → |·|_ℂ^m χ₀, with m the integer of §4.2 (EHLS line 3373), so t=m−(a_χ+b_χ)/2; the Checks are updated.
- "Rectangular model/functional" → "(k,c) model/functional", including the Layer 5 headings; "rectangular orbit (k^c)" is defined once.
- "Local Speh adapter" → "local generalized Speh comparison".

## F12 (P3) — applied

The §5.2 definition no longer says "finite-length". It now requires admissibility, vanishing above or incomparable with (k^c), and a one-dimensional (k,c) Hom space (MODELS Definition 1). Finite length and a unique (k,c) subquotient are stated as properties of ρ_c(τ) (MODELS line 219). A Check is added: an admissible type-(2,1) representation of infinite length.

## Gate failures

None were listed for this round.

## Checks run

- **Lean.** `lake env lean packages/AutomorphicLFunctionsAndLocalFactorsPartII/Suggested.lean`, run from the content checkout: exit 0, no output. The file has no declarations, so the `#check @name` comparison of Suggested.lean has an empty domain. I also put `#check @` for the Mathlib names the README cites (`lipschitzGroup`, `spinGroup`, `Matrix.fromBlocks`, `Matrix.trace`, `AddChar`) in one scratch file and elaborated it once. All five exist with the signatures described: `spinGroup` is a `Submonoid`, `lipschitzGroup` a `Subgroup` of units, both over any commutative ring. The Tau Ceti lemma's module has no built object file, so I verified it by reading the pinned source (line 138; hypotheses: field, finite dimension, `Invertible 2`, `Q.Nondegenerate`, `∃ v, IsUnit (Q v)`). I did not build it, since it is not imported by Suggested.lean.
- **Dependency check**, verbatim: `depcheck: 48 roadmaps, 537 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line. GL2AutomorphicRepresentationsAndTransfer, a new supplier, is at merge-order line 105, before this roadmap at 168.
- **`roadmaps resolve`**: no cross-roadmap citation and no Lean name found nowhere.
- **`sources check`**: `0 problem(s)`.
- **plan.json versus README**: 20 slugged gaps, with supplier and needs identical word for word (checked mechanically); the 6 G-records are untouched.

## Sources

New certified entries, fetched through the service:

- HEN02 (Numdam), read at Proposition 1.9, line 216, and §§5.1–5.3, lines 604–659.
- CPS94 (Numdam), read at Lemmas 2.1–2.3, lines 186–311.
- CKPSS01 (Numdam), read at the §2 converse theorem and its proof, lines 131–232.
- ADAMS14 (arXiv v4), read at Theorem 1.2 and Corollary 1.4, lines 46–60, and at line 314 for the category: irreducible (𝔤,K)-modules.

New uncertified entries, paywalled and cited only by locator:

- CFK22 (Lemma 7.3).
- YAM14 (Theorem 7.1).
- KAP23 (Theorem 25). The service returned "failed" (publisher page refused, HTTP 403), so I wrote the entry by hand in the service's uncertified format, with its DOI.

Also: the CFK and MODELS locators were widened (Remark 3.11, Lemma 3.22, Theorem A.1; Proposition 2), and HARRIS was aligned. No `needs-references.toml` request: nothing depends on an unread text beyond the uncertified locators. I also fetched Kaplan's arXiv 2001.08186 to check it; it is a different paper with different numbering, so it was not used for KAP23.

## Ownership

I searched by object across main and all open heads with `roadmaps grep`, and across the board packages, for every new gap: real Chevalley involution and contragredient, wave-front set and generalized Whittaker models, Hermitian dual of a cuspidal datum, GSpin as a group scheme, the opposite-unipotent estimate, and support from γ-factors. I found no owner: only unrelated hits in KacMoody, GeometricSatakeAndFusion, OverconvergentAutomorphicForms and ExceptionalThetaCorrespondencesForG2. Each gap goes to the earlier roadmap that owns the objects it is stated on.

## Adversarial pass (new and changed statements)

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.3 w-action on χ | n=1 over ℂ/ℝ, B=2; χ=\|·\|_E^i; χ=z/\|z\| | 4^i ↦ (χ^c)⁻¹(2)=4^(−i); for z/\|z\|, (χ^c)⁻¹=χ, both i at 2i | holds; only χ with (χ^c)⁻¹≠χ detects | Example added |
| §1.3 parameter | s=1/4 | z: 3/4 ↦ 1/4=1−3/4; \|det B\|^(−s) ↦ \|det B\|^(s) since \|det B*\|_E=\|det B\|_E | holds | none |
| §1.3 GU part | λ≠1 | δ_EHLS(wmw⁻¹)^(−s/n)\|ν\|^(sn/2) has \|λ\|^(−2ns+sn/2) ≠ \|λ\|^(−sn/2) | U-only statement is correct | GU part stated separately |
| §3.2 θ on fundamental Cartan | U(1); U(1,1); GL₂(ℝ), a=2, φ=π/2; GL_n(ℂ) | z^m↦z^(−m); diag(e^{ia},e^{ib})↦inverse; ᵗg⁻¹: ½r_(π/2) ≠ (2r_(π/2))⁻¹=½r_(−π/2); after Ad(diag(1,−1)): ½r_(−π/2) ✓; diag(z_i)↦diag(z_i⁻¹) | holds after inner adjustment; (Ad(d)∘ι)²=Ad(d·ι(d))=id | Check added |
| real-chevalley-contragredient | ℝ×, C=x⁻¹ versus C=id, π=\|·\|^1 | π∘C=\|·\|^(−1)=π∨; π∘id=\|·\|^1≠π∨ | hypothesis needed | none |
| GSpin F-points | c=2, Q=xy | Q(1,1)=1 unit, so Tau Ceti lemma applies; a=v·(av⁻¹) gives F×⊂even Lipschitz; c=0,1 excluded (V≠0 needed) | holds for c≥2 | c≥2 in gap |
| hermitian-unitary-groups | dim 0 | U=1, GU=Gₘ, multiplier not recoverable | consistent with §0.1 Checks | none |
| R16.1.8 local choice | p odd, m≥2; ℚ₂, m≥4 | cond(η²)=m; on 1+4ℤ₂≅ℤ₂, η of order 2^(m−2), η² of order 2^(m−3), conductor m−1 | η_v₀²χ ramified for m large | Example added |
| η²χ ⇒ non-self-duality | τ′_v₀ unramified =×μ_i | \|·\|^{it}χηημ_i=μ_j⁻¹ on O× forces η²χ=1 | condition suffices (CFK lines 1779–1781) | none |
| gamma-supercuspidal-support | N=2 trivial versus St; N=1 | equal supports {ν^(±1/2)}, GL₁ γ-ratio −q^(1/2−s)·… equal; N=1: test set r∈∅, any two characters pass | N≥2 required | N≥2 in gap |
| ψ_b law | N=k=1; trivial GL₂, τ=1 | χτ(b)\|b\|^(s−1/2); ν^(1/2)(b)ν^(−1/2)(b)\|b\|^(2s−1)=\|b\|^(2s−1)=ω_Π(b)\|b\|^(2(s−1/2)) | holds | none |
| §10.3 right convergence | N=1, Π=\|·\|^t, τ unitary GL₁ | σ₀=1−t, \|α\|=q^(−t)≤q^(1−t); L(s+t,τ) converges for Re s>1−t ≤ σ₀+3/2 | holds (not sharp) | none |
| §10.3 global ε | F=ℚ, b=2 | \|2\|_∞\|2\|₂=1; ω(2)=1 on ℚ× | holds | none |
| §7.2 sign | c=1,k=2, sgn; k=3; sgn∘det on GL₂(ℝ) | −1; (±1)²=1; sgn(det(−I₂))=1 | old χ_π gave +1 in the first case | fixed, 3 Checks |
| §7.2 (A.2) space | k=2 | U°_(c^2)={1}: pure GL_c×GL_c equivariance | statement well formed | ψ_(k,c), ω_τ(det g′)⁻¹ written out |
| §7.6 k=1 variable | s_G=1/2 | s=0; Re s_G≥1/2 ⇔ Re s≥0 | matches the supplier's half-plane | Example added |
| §6.10 nongeneric | trivial GL₂ = L(ν^(1/2),ν^(−1/2)) | γ(ν^(1/2)ητ)γ(ν^(−1/2)ητ)=γ(St×ητ); L=1 once η ramified | holds | none |
| §5.2 definition | π⊕⊕χ_n∘det, k=2,c=1 | level-m fixed vectors: dim π^K(m)+#{n≤m}; Whittaker dim 1+0 | of type (2,1), infinite length | Check added |
| §4.8 t | m=3,a=2,b=0,n=1 | 2m−a−b=4≥2; t=2; 4³·¼=16=4² | holds | none |
| §6.5 ω_π(i_G) | c odd; Sp₂ trivial π | i_G=1_G gives 1; ω(−1)^k=1 | holds | none |
| opposite-unipotent-estimate | SL₂(ℝ), R=B, σ=1 | ∫(1+x²)^(−(Re s+1/2))dx finite iff Re s>0; s=0 diverges | open chamber needed | none |
| eisenstein-pole-cuspidal-detection | c=1 | E_P=f+M₀(s)f: poles of E = poles of M₀ (CFK line 1543) | consistent | none |
| speh-cusp-normalized-intertwiner | c′=1 | region Re s>0 = §8.2's (2−c)/4 at c=2 | consistent | none |
| hermitian-residual-support | SL₂ constant residue | datum (T,1,ρ); dual (T,1,−ρ)=w·ρ | holds | none |
| automorphic-constituent-support | trivial of SL₂(𝔸); cuspidal π | I(1,ρ), Re λ=ρ closed chamber; P=G, λ=0 | holds | none |
| archimedean-wavefront-whittaker | k=1,c=2, τ∘det on GL₂(ℝ) | WF max orbit (1,1); (2)>(1,1) model 0; (1²) functional nonzero | holds | none |
| archimedean-degenerate-derivative | k=1; c=1 | χ∘det_(GL_c) ↦ χ∘det_(GL_(c−1)); c=1 reaches the line ℂ | holds | none |
| §4.10 HARRIS (iii) | disk, m=2, ab=1 | ∫=π; π^(−1)·π=1 | holds | locator added |

## For the maintainer

- **Gap slugs changed** (nothing on main or at any open head cites this roadmap, per `roadmaps grep`):
  - Removed: `hermitian-gspin-carriers`, `ramified-hecke-prescription`, `formal-candidate-products`, `speh-pole-detection`, `hermitian-automorphic-support`, `archimedean-rectangular-support`.
  - Readdressed: `gamma-supercuspidal-support`, from AutomorphicLFunctionsAndLocalFactors AL.3 to EndoscopicTransferAndUnitaryTraceComparison §10.29.
  - Added: `hermitian-unitary-groups`, `gspin-group-schemes`, `nongeneric-pair-epsilon-character-change`, `real-chevalley-contragredient`, the five `archimedean-*` slugs, `eisenstein-pole-cuspidal-detection`, `speh-cusp-normalized-intertwiner`, `hermitian-residual-support`, `automorphic-constituent-support`.
  - Restated: `opposite-unipotent-estimate`.
- **New supplier.** GL2AutomorphicRepresentationsAndTransfer (R16.1.8) is cited; it is an open new-roadmap pull request, earlier in the merge order.
- **Supplier contract assumed.** The MetaplecticAutomorphicForms contract assumes that §3.15 covers the unitary groups of its whole Hermitian datum, split E=F×F included. Its text says "unitary smooth comparison" without naming the split case. If it does not cover it, the nonarchimedean split case (Gelfand–Kazhdan for GL_n) needs a further request.
- **Retiring G1–G6.** The intake has to retire G1–G6 and remove their mentions from the `coverage` `remaining` lists (F01).
- **Section headings** renamed in Layer 5: §§5.1, 5.2, 5.3 and 5.6 now say "(k,c)". No Lean names exist or changed.

### Owners of the G1–G6 records (F01)

| Record | Owner after this round |
| --- | --- |
| G1 | MetaplecticAutomorphicForms §6.10a (local integrals, Lapid–Rallis factors, unramified denominator, completed function). §§2.1–2.4 here hold the EHLS comparisons. The Siegel continuation is AutomorphicSpectralTheory §§1.1–1.4, 2.4, 2.4a (see F03). The ordered-residue route is deleted. |
| G2 | Nonarchimedean case: MetaplecticAutomorphicForms §3.15. Archimedean case: a target of §3.2 here, plus the new `gap:real-chevalley-contragredient` (AutomorphicFormsOnReductiveGroups §§2.4, 2.7). See F06. |
| G3 | Targets of §§4.2, 4.5, 4.8 and 4.10 here. |
| G4 | Targets of §§5.4, 6.1–6.10, 7.2, 7.6 and 9.3 here. CFK22 and KAP23 are recorded `uncertified` and cited by locator; GK was read. |
| G5 | §10.3 here; CKPSS01 and CPS94 are now read (certified). Globalization: `gap:controlled-supercuspidal-globalization`. Hecke character: GL2AutomorphicRepresentationsAndTransfer R16.1.8 (F04). |
| G6 | Duplicate of the former `hermitian-gspin-carriers`, now `gap:hermitian-unitary-groups` and `gap:gspin-group-schemes`. |

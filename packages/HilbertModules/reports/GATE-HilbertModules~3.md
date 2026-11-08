# GATE-HilbertModules~3: answers to human review of `HeisenbergImprimitivity`

The repairs are in commit `ea88c1a9`, on top of `950df62`, and are not pushed. Only `TauCetiRoadmap/HilbertModules/HeisenbergImprimitivity/README.md` changes (+57/−13). `Suggested.lean` does not change. There is one review to answer: roed-math's overlap cross-check of 2026-11-06. Its point 1 makes two claims, the twisted group C*-algebras and the Schrödinger family, so they are H01 and H02. Its point 2 is H03.

## H01 (roed-math) — applied differently
The triplication is real, and the conventions agree. #1137 D1.CentralTwists uses `ω((m,χ),(n,ψ))=ψ(m)`. #1155 §6.0 uses `λ_Θ(p)δ_q=σ_Θ(p,q)δ_(p+q)`, which is this README's `λ_c(x)δ_q=c(x,q)δ_(x+q)` at `c=σ_Θ`. But the single owner has to be this roadmap, not #1137, for two reasons:
- #1137 is a revision of OperatorAlgebraDynamics, and a revision cannot be a supplier before it merges. On main, OperatorAlgebraDynamics D1–D2 (main README lines 75–204) contain no 2-cocycle twist.
- CompactQuantumMetricSpaces (#1155) is at line 202 of the merge order and HilbertModules at line 11, so #1155 is a consumer.

The proposed split also does not match #1137 itself: at its head `0e44b61`, Scope lines 33–40 already claim the trace and the gauge action as well as the completions.

Changes to the README:
- Downstream consumers (line 816) now identifies CompactQuantumMetricSpaces §6.0's quantum tori `C*(ℤ^d,σ_Θ)` with §3.1 at L=ℤ^d, c=σ_Θ: the twisted regular representation, the gauge action of `𝕋^d`, the coefficient trace and the universal property.
- A new §3.1 Check (line 495) shows `σ_Θ=c·δu` for `c=e(θnm′)` and `u(m,n)=exp(πiθmn)`, and pins the direction of the coboundary isomorphism.
- The scope bullet (lines 30–42) now says that D1–D2 have no 2-cocycle twist. It also records a fourth instance found by searching the roadmap and main for the same pattern: OperatorAlgebraDynamics D8's universal Weyl algebra on main is `C*(V_discrete, exp(−iσ/2))`. It is not used here.

The rest of the deduplication belongs to the other two pull requests:
- #1155 §6.0 consumes §3.1.
- Either #1137 drops its scalar discrete specialisation and its consumer line about HeisenbergImprimitivity (lines 2895–2902; this README does not consume D1.CentralTwists), or #1137 merges first and this roadmap is then revised to consume OperatorAlgebraDynamics as it is on main by then.

The earlier human review (GATE-HilbertModules~2, H01) moved `C*(L,c)` here and deleted the D1.CentralTwists citations for the same reason.

## H02 (roed-math) — disputed
The Schrödinger family is planned twice with identical conventions: #1137 D1.CentralTwists (head `0e44b61`, lines 657–666) and §1.1 here, `(π_(m,χ)ξ)(t)=χ(t)ξ(t+m)`, `β((m,χ),(n,ψ))=ψ(m)`. This roadmap cannot take it from #1137, because a revision of OperatorAlgebraDynamics is not a supplier before it merges. OperatorAlgebraDynamics on main has covariant pairs and integrated forms (D1, lines 75–142), but no Schrödinger family and no Heisenberg cocycle. §1.1 stays the owner. The side to change is #1137's statement that HeisenbergImprimitivity Layer 1 consumes D1.CentralTwists' family (its lines 663–666 and 2895–2902), which can cite §1.1 instead.

## H03 (roed-math) — applied differently
§5.1 (lines 624–645) changes as follows:
- Old: S(L,c) is inverse-closed "by differentiating `a⁻¹` along the generators of the gauge action".
- New: smooth vectors are defined along `Hom(L,ℝ)` (`γ_t(x)=e(t(x))`), S(L,c) is identified with them, and inverse-closedness in every matrix size is no longer a separate estimate. The gauge automorphisms commute with inversion, so the orbit of `a⁻¹` is the orbit of a composed with `Ring.inverse`. That map is C^∞ at units by Mathlib's `contDiffAt_ringInverse` (`Mathlib/Analysis/Calculus/ContDiff/Operations.lean:779`), and complete normed rings have the `HasSummableGeomSeries` hypothesis (`Mathlib/Analysis/SpecificLimits/Normed.lean:305`).

#1145's `smooth_inverse` reduces to that same lemma. It cannot be cited here: SmoothBanachRepresentations is not in the merge order and consumes AutomorphicFormsOnReductiveGroups §2.7, which is at merge-order line 63. So it can only come after HilbertModules (line 11).

Other changes:
- `contDiffAt_ringInverse` is added to the Mathlib supplier contract (line 128), to the §5.1 *Needs:* line and to the Layer 5 Dependencies (line 734).
- The scope bullet says that no general theory of smooth elements of Banach-algebra actions is built here.
- The locator is tightened to rieffel88 lines 921–931.
- Three S(L,c) Checks are added (lines 660–670): `(2δ_0+δ_1)⁻¹`, the one-sided negative control, and finite L.

## Build and gate

- `lake build TauCetiRoadmap.HilbertModules.HeisenbergImprimitivity.Suggested`: `Build completed successfully (8976 jobs)`, with the three expected `declaration uses 'sorry'` warnings (lines 82, 103, 112).
- Gate at `ea88c1a9`: `gate HilbertModules: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 239 roadmaps, 2359 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- Signatures: `Suggested.lean` is unchanged, so the 10 elaborated types in `scratch/signatures.md` are current. I compared them with README §1.1, §2.4, §5.1 and §5.2:
  - `fundamental_identity`: `[DiscreteTopology L] [IsZLattice ℝ L]`, two `Summable` clauses and the equation with `(ZLattice.covolume L)⁻¹`.
  - `exists_parsevalFrame`: `∃ n g, IsParsevalFrame L g`.
  - `parsevalFrame_trace`: `∑ j, ∫ ‖g j t‖² = ZLattice.covolume L`.

  No binder is lost and nothing changed. No `#check` file was elaborated, since the brief's only Lean command is the module build and the file did not change.

## Ownership, overlaps and moves

- Ownership was checked against main (`eaf17b1`) and the sibling heads #1137 (`0e44b61`), #1145 (`22e3c68`) and #1155 (`25e9712`), plus `roadmaps grep` for twisted group algebras, the Schrödinger family, smooth vectors and inverse-closedness.
  - This roadmap is the owner of `C*(L,c)` and the Schrödinger family, for the reasons in H01 and H02.
  - The only main-roadmap instances are OperatorAlgebraDynamics D8's Weyl algebra (recorded in Scope) and NoncommutativeGeometry N6's 𝒜_θ (already listed under Left to other owners).
  - No declaration of `Suggested.lean` shares a fully qualified name with #1137 or #1155.
- Overlaps: #861 (the parent HilbertModules) does not contain this folder, so there are no conflicting heads. No cited id is dropped by an open pull request. No notion moved down, and no supplier was added except the Mathlib lemma.
- Sources: no new source was fetched. The rieffel88 locator 921–931 (p. 280) was read in the cached text.
- Untrusted text: the review asks to switch the pull-request label back to `awaiting-review`. That is a pull-request action left to the worker; nothing in it was acted on. Nothing suspicious.

## Adversarial pass (changed or added statements)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `γ_t(x)=e(t(x))`, t∈Hom(L,ℝ), fill the identity component of L̂ | L=ℤ; L=ℤ/2; L=ℤ×ℤ/2 | ℤ: all of 𝕋. ℤ/2: Hom=0, only γ=1 = identity component of ℤ/2. ℤ×ℤ/2: 𝕋×{1} | holds | none |
| S(L,c) = smooth vectors | ℤ, c=1, coeffs `2^(−|n|)`; coeffs `1/(1+n²)` | first: all derivatives summable, so smooth. Second: third derivative has coefficients `~(2πi)³n³/(1+n²)`, unbounded, so not C³ and not rapid. Agrees | holds | none |
| Inverse-closedness via `contDiffAt_ringInverse` | `a=2δ_0+δ_1`; one-sided subalgebra; finite L; M_0 | `a⁻¹=Σ_(n≥0)(−1)^n2^(−n−1)δ_n`, with coefficient at n≥1 `2·(−1)^n2^(−n−1)+(−1)^(n−1)2^(−n)=0` and at 0 `2·½=1`. δ_1 has inverse δ_(−1) outside `supp⊆ℕ`. Finite L: S=C*. M_0=0 | holds; the non-examples show completion and the full smooth set are needed | Checks added |
| Mathlib hypotheses | `HasSummableGeomSeries` for C*(L,c) and `M_n(C*(L,c))` | instance `[CompleteSpace R]` over `NonUnitalNormedRing R` (Normed.lean:292, 305) | applies | contract added |
| `∂(a⁻¹)=−a⁻¹(∂a)a⁻¹` (order) | `a=U₁(2+U₂)` in A_θ, ∂ along `t(x)=x₂` | direct: `−(2+U₂)⁻²(2πiU₂)U₁^*`; formula: `−(2+U₂)⁻¹U₁^*·2πiU₁U₂·(2+U₂)⁻¹U₁^* = −2πiU₂(2+U₂)⁻²U₁^*`. Equal | holds | none |
| `σ_Θ=c·δu`, Θ₁₂=−θ, `u(m,n)=exp(πiθmn)` | generic p,q; (1,0),(0,1) both orders; u≡1 | `δu=exp(−πiθ(p₁q₂+q₁p₂))`, so `c·δu=exp(πiθ(p₂q₁−p₁q₂))=σ_Θ`. `exp(−πiθ)·u(1,1)=1`, matching `c((1,0),(0,1))=1`. `exp(πiθ)·exp(πiθ)=e(θ)`, matching `c((0,1),(1,0))=e(θ)`. With u≡1 the leftover phase is `exp(−πiθ)≠1` unless θ∈2ℤ | holds; direction β→α of `equivOfCoboundary` matches | Check added |
| Quantum torus = §3.1 at ℤ^d | d=0; Θ=0; d=2 | d=0: ℂ. Θ=0: C(𝕋^d). `λ_c(p)δ_q=c(p,q)δ_(p+q)` from `(λ_c(x)h)(y)=c(x,y−x)h(y−x)`. `σ_Θ(p,−p)=exp(−πipᵀΘp)=1`, so `δ_p^*=δ_(−p)=W_p^*`. `τ_Θ(a)=⟨aδ_0,δ_0⟩=f(0)` | holds | consumer line added |
| D8 Weyl algebra = `C*(V_d,exp(−iσ/2))` | σ=0; generic f,g | `c(f,g)=exp(−iσ(f,g)/2)` gives `δ_fδ_g` = D8's relation. `c(−f,f)=exp(0)=1`, so `δ_f^*=δ_(−f)=W(f)^*`. σ=0 gives a commutative `C*(V_d)` | holds | scope sentence |
| OperatorAlgebraDynamics D1–D2 on main have no 2-cocycle | grep "cocycle" in main README | hits only at lines 311 (D5), 467 (D6), 476 (D7); D1 twisted L¹ (lines 85–94) twists by α and the modular function | holds | scope wording |

# GATE-QuantumFoundations~2: answers to human review

One comment (roed-math, 2026-11-06T06:22:58Z), three points. Head before repairs `e33847c`; repairs in commit `824bab8` (not pushed). Only `TauCetiRoadmap/QuantumFoundations/README.md` changed; `Suggested.lean` is unchanged. Line numbers below are those of the README at `824bab8`.

## H01 (roed-math) — applied differently

OperatorAlgebraDynamics D8 on main (main README lines 554–600) constructs CAR(h) with its antisymmetric Fock space and operators, regular representations with Stone-generator fields, and the symmetric Fock representation with its fields and vacuum characteristic function. It has no bosonic `a(f)`/`a†(f)`, no finite-particle domain, no finite-particle CCR and no `(a+a†)/√2`, and its only continuity statement is regularity, i.e. continuity along each line `t ↦ W(tf)`. The D8 text the review cites is the open OperatorAlgebraDynamics revision (#1097). A revision of a roadmap on main is never a supplier, so §6.4 keeps these items. Two changes remove the actual overlap with main's D8. First, §6.4 (line 742) "Prove strong continuity of `h ↦ W(h)` … on the coherent-vector span" now reads "Prove that `h ↦ W(h)` is strongly continuous for the norm topology of the one-particle space, which strengthens D8's regularity (strong continuity of `t ↦ W(th)` for each fixed `h`) …", with the scope clause at line 15 and a new Check at line 754. Second, "Fermionic CAR operators are bounded." becomes "The fermionic operators are D8's bounded CAR operators, with `‖a(f)‖ = ‖f‖`." (line 742).

The split the review proposes is already what both open OperatorAlgebraDynamics revisions give this roadmap. #1097 at head `5b920ff` does so in scope line 12 and D8 line 852; #1137 at head `0e44b61` in lines 104–118. Under that split §6.3 owns `Γ`, `dΓ`, `N`, `D(N)` and `D(N^(1/2))`, and §6.4 owns the CCR on `D(N)`, the closures, essential self-adjointness on `D_fin`, the identification with the Stone generator, vacuum cyclicity and irreducibility. All of these are unchanged here. The items that revision moves into D8 are the bosonic operators on `D_fin`, the CCR on `D_fin` and continuity in the norm of `h`. They are now gathered in one sentence of §6.4 (line 742), which says explicitly that D8 constructs no bosonic operators. If that revision merges first, the rebase replaces that sentence with a citation of D8. If this roadmap merges first, the later revision of this roadmap does the same. In either order D8, which is earlier in the merge order, ends up the single owner. #1097's head now cites "QuantumFoundations §6.4" (line 852), not "QF4".

## H02 (roed-math) — applied differently

The defect is real: main's D8 does not define the symmetric-Fock `a`/`a†`. The contract (line 55) is corrected:
- old: "D8 supplies … the symmetric and antisymmetric Fock carriers, creation and annihilation operators …"
- new: "D8 supplies CAR(h) with `‖a(f)‖=‖f‖`, the antisymmetric Fock space with its creation and annihilation operators and faithful CAR representation, … the regular symmetric Fock representation … D8 constructs no bosonic creation or annihilation operators and no finite-particle domain; §6.4 defines them on D8's symmetric Fock space"

The same correction is made in scope (line 24). In §6.4 (line 742), "Compare with D8's operators: on the `n`-sector `a(f) = √n·b̄_n(f)` …" becomes a definition on `D_fin`: `a(f)η = √n·b̄_n(f)η` and `a†(f)η = √(n+1)P₊^(n+1)(f⊗η)`, with `a(f)Ω = 0`, invariance of `D_fin` and the adjoint pairing. Only the `P₋` formulas are compared with D8's fermionic operators. To make "D8's sectors" meaningful, §6.3 (line 726) now identifies D8's two Fock spaces with `P±F(h)`, with *Needs:* NoncompactQuantumSymmetry P.6 (line 732). The suggested repair, adding #1097 as a dependency, is not made: an open pull request that revises a roadmap on main is never a supplier, so D8 is cited as it is on main. #1137 cannot be cited either way. At head `0e44b61` its scope (lines 104–118) gives D8 the bosonic sector formulas and the CCR on `D_fin`, but its D8 body (line 2639) still has main's one-sentence version.

## H03 (roed-math) — applied

§7.2 (line 833) changes from "… and that a connected `G` lands in `PU(H)`." to "…; that a connected `G` lands in `PU(H)` is P.2's corollary and is consumed, not proved, here". The bullet at line 835 drops "connected groups act unitarily". The corollary is added to the P.2 deferral (line 22) and the supplier table (line 65). The statement now names "a nonzero separable `H` (P.2's standing hypothesis)", because P.2 defines the topology of `PUA(H)` only there. Evidence: NoncompactQuantumSymmetry at head `1a39856`, P.2 lines 312–315 ("P.2 owns this corollary") and bullet line 331.

## Further repair from the overlaps check (not a review point)

`scratch/overlaps.md` lists LieHighestWeight Layer 2 (cited at old lines 26, 69, 851, 947, 953) as dropped by #1220. At head `beea1d2`, #1220 has no Layers 1, 2 or 4. Its scope reassigns the `sl₂` spectrum and classification, weight integrality, the classification of irreducibles and complete reducibility to Tau Ceti declarations, and all of them exist at our pin. Following the overlap rule (cite where the content now is), this roadmap now cites the pinned declarations directly; this holds whether or not #1220 merges.
- Supplier contract (line 47): `TauCeti.exists_int_of_hasEigenvalue` (`Sl2/Spectrum.lean`). It needs a characteristic-zero domain and a torsion-free Noetherian module; without Noetherianity a Verma module has `h`-eigenvalue `λ ∉ ℤ`.
- Supplier contract (line 47): `TauCeti.Sl2Std`, `TauCeti.finrank_eq_of_hasPrimitiveVectorWith` and `TauCeti.lie_h_basisOfHasPrimitiveVectorWith` (`Standard.lean`, `WeightString.lean`). These need, in addition, irreducibility over the triple.
- Scope sentence: line 29.
- §7.3: line 849, with *Needs:* at line 855.
- §9.1: line 949, with *Needs:* at line 955.
- The table row (line 69) drops LieHighestWeight.

Complete reducibility and Clebsch–Gordan were not used by any target: §7.3 starts from a unitary representation. The overlap entry is therefore resolved without citing a revision's numbering.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `a(f)`, `a†(f)` on `D_fin` (§6.4) | `h=0`; one mode `e`; two modes | `h=0`: `D_fin=ℂΩ`, `a†(0)Ω=0`. One mode: `a†Ω=e`, `a†e=√2 e⊗e`, `a(e)(e⊗e)=√2e`, `[a,a†]Ω=Ω`, `[a,a†]e=2e−e=e`. Two modes: `a(e₁)((e₁⊗e₂+e₂⊗e₁)/√2)=e₂` | standard bosonic ladder | definition added |
| `b̄_n(f)` maps `P±^(n)` into `P±^(n−1)` | `n=1`; `n=2` with `±` | `n=1`: `P^(1)=P^(0)=1`. `n=2`: `(e₁⊗e₂±e₂⊗e₁)/2 ↦ (⟨f,e₁⟩e₂ ± ⟨f,e₂⟩e₁)/2 ∈ h` | holds | stated |
| adjoint pairing, antilinearity | `f=ie`, `φ=Ω`, `ψ=e` | `⟨a†(ie)Ω,e⟩=⟨ie,e⟩=−i`, `⟨Ω,a(ie)e⟩=−i`. A linear `a` gives `+i` | holds; linear model excluded | Check added (line 753) |
| `a(f)P_n(f₁⊗⋯⊗f_n)` sector formula (`P_n` now defined) | `n=2`, `f=f₁=e₁`, `f₂=e₂` | `2^(−1/2)(1·e₂+0·e₁)=e₂/√2`; times `√2` (normalised vector) gives `e₂` | agrees with previous row | notation fixed |
| `a†(f₁)⋯a†(f_n)Ω=√(n!)P_n(…)` | `n=0,1,2`; §6.5 `v_(1,1)` | `n=0`: `Ω`. `n=1`: `f₁`. `n=2`: `√2P(f₁⊗f₂)`. `‖√2P₊(e₀⊗e₁)‖²=2·(1/2)=1` | holds; `P_s→P₊` (lines 760, 771) | notation unified |
| `P₋` formulas = D8 CAR operators | one fermionic mode | `a†(e)e=√2P₋(e⊗e)=0`; `{a,a†}Ω=Ω`; `{a,a†}e=a†a e=e` | CAR holds | comparison kept |
| D8 Fock spaces ≅ `P±F(h)` (§6.3) | `h=0`, `ℂ`, `ℂ²` | `h=0`: both `ℂ`. `h=ℂ`: `P₊F=ℓ²(ℕ)`, `P₋F=ℂ²` (CAR(ℂ)=M₂). `h=ℂ²`: `dim P₋F=1+2+1=4` (CAR(ℂ²)=M₄) | consistent with §6.4 Checks | target added |
| `h ↦ W(h)` strongly continuous in norm (§6.4) | `‖h‖→0`; `e_n ⇀ 0`; nonregular rep of §6.6; coherent vectors | `‖W(h)Ω−Ω‖²=2−2e^(−‖h‖²/4)`: at `h=(1/n)e_n` it tends to `0`; at `e_n` it is `0.4424`; nonregular: `‖e_q−e₀‖²=2`. Coherent: `2−2Re[e^(iIm⟨a,b⟩/2)e^(−‖b−a‖²/4)]→0` as `b→a` | holds for norm, fails for weak (Check states this) | statement scoped, Check added (line 754) |
| D8 regularity as cited | main D8 text | "regular if `t↦π(W(tf))` is strongly continuous for each f" | matches | contract line 55 |
| Contract items for D8 (line 55) | main D8 | `‖a(f)‖=‖f‖`; antisymmetric Fock + operators; Weyl `exp(−iσ/2)`; Stone fields with commutator; symmetric Fock rep + `exp(−‖f‖²/4)`; `‖W(f)−1‖=2`; simplicity; functoriality. Commutator sign: BCH gives `[Φ(f),Φ(g)]=iσ(f,g)` from `W(tf)W(sg)=e^(−itsσ)W(sg)W(tf)` | every item present on main; bosonic `a/a†` absent | corrected |
| P.2 corollary (§7.2) | `G=SO(3)`; `G=ℤ/2` with `t↦[C]` on `ℂ²` | connected `SO(3)` lands in `PU(2)`. `ℤ/2` is discrete and `C²=1`, so the map is a continuous homomorphism with odd image: connectedness is needed | holds at P.2's generality (separable `H≠0`) | citation; hypothesis named |
| §7.3 integrality via `sl₂`-triples | triple relations; decomposition; defining rep | `[h₁,E₁₂]=2E₁₂`, `[E₁₂,E₂₁]=h₁`; `s·diag(1,−1,0)+(s+t)·diag(0,1,−1)=diag(s,t,−s−t)`; `(k,l)=(a+b,b)`. `e₁`: `(a,b)=(1,0)→(1,0)`; `e₂`: `(−1,1)→(0,1)`; `e₃`: `(0,−1)→(−1,−1)` | reproduces the stated weights | route re-pointed |
| §9.1 spin-`j` ladder | `j=0,1/2,1` | `h=2S_z` eigenvalues: `{0}`; `{1,−1}→S_z=±1/2`; `{2,0,−2}→1,0,−1`; dimension `2j+1` | holds | route re-pointed |

## Lean signatures

`Suggested.lean` is unchanged, so there are no new or changed declarations to elaborate. Its 9 declarations, as elaborated in `scratch/signatures.md`, were compared with their README statements: §0.1 for `PreservesLines`, `projectiveCollineation_semilinear` and `projectiveCollineation_unique_scalar`; §0.2–0.3 for the two Kakutani–Mackey theorems; §2.2 for `FinitePOVM` and `naimark_dilation_finite`; §7.1 for `IsOrthogonal` and `uhlhorn`. None of the README edits touches those sections, and no section binder is missing. No `#check` scratch file was elaborated, because the only Lean command this job may run is the module build and the file did not change.

## Ownership, citations and sources

- Ownership against open pull requests was checked for the objects the repairs touch. OperatorAlgebraDynamics was checked on main and at #1097 and #1137; NoncompactQuantumSymmetry at #1015; RelativisticQuantumFieldTheory at #1772; LieHighestWeight at #1220, through `roadmaps show`. This roadmap owns the bosonic `a/a†` on `D_fin` because no roadmap on main does, and no notion was moved down from a later roadmap.
- Nothing is listed under "only an open revision defines".
- RelativisticQuantumFieldTheory at head `b6720a9` still cites this roadmap by labels it does not have: "QF4" at lines 19, 33, 398 and 3493, "QF5" at line 23 and "QF6b" at line 33. Its README needs updating to §6.3–6.4, §7 and §9.4–9.5. Line 3493 consumes "QF4's normalized creation" operators, which §6.4 now defines. Downstream consumers (line 1102) now names the bosonic operators.
- The three leads in `scratch/citations.md` are section ids, not Lean names, and all three exist. `M4.SpatialLocalization` is at NoncompactQuantumSymmetry line 2407 and `M5.AffineG5` at lines 103 and 5948 (both at head `1a39856`). `V2.NonmodularProjectionLattice` is at VonNeumannAlgebras main lines 871, 884, 1460 and 1463. After the edits, `roadmaps resolve` finds no unresolved cross-roadmap citations or Lean names. The new `TauCeti.*` names were checked by hand at the pin (`2fd255d`), since the resolver does not read pinned packages on this host.
- No new source is cited and no `needs-references.toml` was written. The review text contains no instructions to run anything; nothing suspicious.

## Build and gate

`lake build TauCetiRoadmap.QuantumFoundations.Suggested`: `Build completed successfully (8954 jobs).` This comes with six `declaration uses 'sorry'` warnings, at lines 55, 64, 76, 88, 109 and 126.

Gate: `gate QuantumFoundations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Depcheck: `depcheck: 239 roadmaps, 2349 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line).

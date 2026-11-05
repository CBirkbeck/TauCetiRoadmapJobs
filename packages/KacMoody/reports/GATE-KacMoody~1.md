# GATE-KacMoody~1: answers to human review

Points are numbered in the order they appear in the review thread. Line numbers refer to `TauCetiRoadmap/KacMoody/README.md` at the repair commit `d42952ae` unless stated otherwise.

## H01 (roed-math) — applied

KM5 already carries the admissible-string restriction at head `6fed4a0`. The string decomposition of homogeneous `u∈M_μ` requires `u_n∈ker(e_i)∩M_(μ+nα_i)` and `u_n=0` unless `0≤n≤⟨μ+nα_i,h_i⟩`. The equivalent direct-sum equivalence includes injectivity, raising and lowering have endpoint zero conventions, and the `L_v(2ω)⊕L_v(0)` counterexample is kept as a regression (line 82). Recomputed: the spurious term `f^(1)z` would need `1≤⟨0,h⟩=0`, which is false, so it is excluded.

## H02 (roed-math) — applied

KM9 (line 161) limits the classical all-root integral lattice to finite type, citing ReductiveGroups §9A (checked on main: heading `#### 9A. The full reductive integral enveloping form`), and names QuantumEnvelopingAlgebras QEA3–QEA4 for the quantum bases. The source passage is identified by title and physical pages (*Algebraic Varieties in Representation Theory*, pp. 84–86, dated 11 April 2003). No author is recorded, and neither the README nor the package metadata contains enough to supply one, so the bibliographic entry is still incomplete.

## H03 (roed-math) — applied

KM8 (line 145) names the Bott–Samelson transverse-chart order computation and the proper pushforward of the divisor cycle, keeping generic residue degrees and contracted divisors. It cites SchemeAndStackFoundations §§5.1–5.3 for cycles, the Cartier comparison and the first Chern class with its projection formula (checked on main: §5.3 "The first Chern class" exists). It assumes neither Schubert normality nor Cartier boundary components. The pinned commit links are now relative roadmap links. Before this change the gate refused them (`blob=9`); it now reports `blob=0`.

## H04 (roed-math) — applied

KM2 (line 48) cites `CoxeterSystem.strongExchange`, `CoxeterSystem.bruhatLE_iff_exists_sublist_wordProd_eq`, `TauCeti.matsumoto` and `CoxeterSystem.existsUnique_isMinimalCosetRep_mul` at the pinned Tau Ceti. Each comes with the hypothesis under which it is used, and the construction and faithfulness of the symmetrizable reflection representation stay as KM2 targets.

## H05 (kim-em) — answered

The status report matches the history. `git diff b955958 6fed4a0` touches only `README.md` (17 insertions, 4 deletions), so the claim that `Suggested.lean` and the metadata were unchanged in that commit is correct. The four repairs it lists are present, as recorded in H01–H04. `Suggested.lean` has since changed in this round; see "Additional repairs required by the gate".

## H06 (roed-math) — applied

The gap is real. At head, KM5 constructed the quantum highest module and "integrable category" in one sentence, with no complete reducibility and no split tensor maps. KM3 is classical only. KM5a covers only finite type. QEA4 (QuantumEnvelopingAlgebras at its open head) states that the generic type-1 classification and the integrable module comparison belong to the Kac–Moody module owner. A new KM5 paragraph (line 80) now constructs, before any crystal statement:

- the quantum Verma module `M_v(λ)` and its universal property;
- quantum `O_int` on the full lattice;
- `L_v(λ)=M_v(λ)/⟨F_i^(λ(h_i)+1)v_λ⟩` with proofs that it is integrable and simple and that its character equals the classical one;
- complete reducibility of `O_int`, routed through a locally finite quasi-R-matrix Casimir built from QEA's nondegenerate pairing on the nilpotent halves, with descent from `ℚ(t)` to `ℚ(v)`;
- closure of `O_int` under tensor products for the selected coproduct;
- the normalized `U_v`-linear maps `Φ_(λ,μ)` and `Ψ_(λ,μ)` with `ΨΦ=id`;
- the fact that every `U_v`-linear weight-preserving map commutes with the Kashiwara operators.

It also says explicitly that the universal property cannot produce `Ψ` and that KM7 is not an input. The induction sentence (line 82) now names these as its inputs.

Values checked by hand:
- **Casimir separation.** `(λ+ρ)²−(μ+ρ)²=Σn_i d_i(λ(h_i)+μ(h_i)+2)`, using `(α_i,λ)=d_iλ(h_i)` from the H07 normalization.
- **A1 trivial summand.** The selected coproduct forces the coefficient `v` in the vector spanning the trivial summand of `L_v(ω)⊗L_v(ω)`: `e(v_ω⊗fv_ω)=s v_ω⊗v_ω` and `e(fv_ω⊗v_ω)=s v^−1 v_ω⊗v_ω`. The dimension count is `4=3+1`.
- **Degenerate cases.** For `λ=μ=0` both maps are the unitor. For empty `I` the modules are one-dimensional. For affine `A1` at `Λ_0` the modules are infinite-dimensional and the weights are bounded by `2Λ_0`.

## H07 (roed-math) — applied

KM1 (line 34) states the invariant form explicitly:
- `(h_i,h)=α_i(h)/d_i` on the full Cartan, and zero on the chosen complement `H''`;
- `(e_i,f_j)=δ_ij/d_i`, and `g_α⊥g_β` unless `α+β=0`;
- perfect pairings `g_α×g_(−α)`, a nondegenerate form on `H`, and `ν(h_i)=α_i/d_i`, hence `(α_i,α_j)=d_ia_ij`;
- a comparison under change of complement.

It cites Kac, §2.1 and Theorems 2.2 and 9.11. Witnesses: the `sl2` trace form gives `(h,h)=2` and `(e,f)=1`. In affine `A1` the Gram matrix of `h_0,h_1,d` is `[[2,−2,1],[−2,2,0],[1,0,0]]` with determinant `−2`. The singular `(d_ia_ij)` extended by zero has `c` in its radical and fails `(c,d)=1`, which addresses the reviewer's warning about singular type.

## H08 (roed-math) — applied

The overlap is real: AffineLieAlgebras is on main, and its A2 owns the polynomial central extension `ĝ_κ` and level transport but adds no degree derivation. The Mathlib pin also already has `LieAlgebra.ofTwoCocycle` and `LieAlgebra.Extension.ofTwoCocycle` (`Algebra/Lie/Extension.lean`), so the old sentence "the native 2-cocycle alone is not already the central extension" overstated what was missing. Changes:
- **Owner bullet.** A new bullet (line 14) assigns `ĝ_κ` to AffineLieAlgebras A1–A2.
- **Construction (KM1, line 40).** KM1 consumes `LieAlgebra.loopAlgebra`, `LieAlgebra.LoopAlgebra.residuePairing`, `LieAlgebra.LoopAlgebra.twoCocycleOfBilinear` and the extension carriers above. It keeps only the degree derivation, the Chevalley–Serre isomorphism `e_0↦f_θ⊗t`, `f_0↦e_θ⊗t^−1`, `h_0↦K−θ^∨` (Kac, Theorem 7.4), the images `c↦K` and `d↦t d/dt`, the level `λ(c)`, and level transport along `κ=kκ_0`.
- **Sign convention.** From the pinned source, `residuePairing` evaluates to `nΦ(x,y)δ_(m+n,0)` on `x⊗t^m,y⊗t^n`, so the convention is `Φ=−κ`.
- **Checks.** `[e_0,f_0]=−θ^∨+K`, and the opposite sign would give `−θ^∨−K`. The affine form also satisfies `(h_0,d)=1=(K,d)`.

## H09 (roed-math) — answered

That is correct at the pin. `LieModule.weightSpace` (Mathlib `Algebra/Lie/Weights/Basic.lean`, line 61) is the simultaneous eigenspace; the generalized one is `genWeightSpace` (line 183). This matches KM3's weight modules, which are defined by a diagonalizable Cartan action, so `actualWeightSpace` correctly uses `weightSpace` and nothing needs to change.

## Additional repairs required by the gate (not raised by reviewers)

- **Imports.** `Suggested.lean` had six `Mathlib.<submodule>` imports and a Tau Ceti import it did not use. They are replaced by the single line `import Mathlib`.
- **Sorry'd data.** The definition `multiplyUpperCharacters`, whose body was `sorry`, is removed. The multiplication is the KM4 prose target at line 64, and the module docstring now says so. The other declarations' signatures are unchanged.
- **#check comparison not run.** The brief permits only `lake build` on this module, so I did not elaborate a scratch `#check` file. No surviving declaration's signature changed.
- **Structural defect left open.** The README backticks none of the Lean declaration names apart from `UpperCharacter`, and the file is closer to an API sample than to a headline acceptance test. No reviewer raised this, so the gate fixes stop at the mechanical items.

## Sources and ownership

- **Kashiwara 1991.** I fetched the author's PDF (key `Kashiwara1991`, author page), but it is an image-only scan and OCR is unavailable here, so the locator §4.1 cited in KM5 is the reviewer's and I have not checked it against the text.
- **Lusztig.** *Introduction to quantum groups* is paywalled. It is cited at chapter level (Chapter 6) and should be recorded as uncertified.
- **Kac.** The locators §2.1 and Theorems 2.2, 7.4 and 9.11 are standard textbook citations given from memory and are unverified.
- **Manifest.** This job may not edit `sources.toml`, so no manifest entry was written, and no `needs-references.toml` was created.
- **Ownership.**
  - The polynomial affine extension is now cited to AffineLieAlgebras A2 on main.
  - The quantum `O_int` theory is owned here: QEA4 assigns it to the Kac–Moody module owner, and `roadmaps grep` was not run beyond reading QEA at its open head.
  - Ownership against the other open pull requests was not checked.

## Adversarial pass (statements added or changed)

| statement | instances | computed values | result | change |
|---|---|---|---|---|
| KM1 form normalization | A1, d=1; affine A1, d=(1,1) | `(h,h)=2`, `(e,f)=1`; Gram `[[2,−2,1],[−2,2,0],[1,0,0]]`, det `−2`; `(c,h_i)=0`, `(c,d)=1` | holds; singular `(d_ia_ij)` degenerate | added as Checks |
| `(α_i,α_j)=d_ia_ij` from `ν(h_i)=α_i/d_i` | general | `d_id_j·a_ij/d_j=d_ia_ij` | agrees with KM5a | none |
| affine Chevalley map | `[e_0,f_0]` | `−θ^∨+1·κ_0(f_θ,e_θ)K=−θ^∨+K`; opposite sign `−θ^∨−K` | holds | Check added |
| residue sign | `x⊗t^m,y⊗t^n` | Mathlib `nΦ(x,y)δ`; A2 cocycle `−κ·n·δ=mκδ` | `Φ=−κ` | stated |
| `c↦K`, `(h_0,h_0)`, `(h_0,d)` | untwisted affine | `K−θ^∨+θ^∨=K`; `κ_0(θ^∨,θ^∨)=2`; `(K,d)=1=α_0(d)` | holds | stated |
| Casimir separation | dominant λ>μ | `Σn_id_i(λ(h_i)+μ(h_i)+2)>0` | holds | stated |
| Casimir local finiteness | weight μ in O | β∈Q_+ with μ+β in a finite union of cones `λ_j−Q_+`: finite by independence | holds | stated |
| Φ, Ψ | A1 ω⊗ω; λ=μ=0; I=∅; affine A1 Λ_0 | `4=3+1`, trivial-summand coefficient `v`; unitor; 1-dim; weights ≤2Λ_0 | holds | Checks added |
| U-linear maps commute with Kashiwara operators | admissible range | weight ν preserved ⇒ `⟨ν,h_i⟩` preserved | holds | stated |

## Build and gate

- `lake build TauCetiRoadmap.KacMoody.Suggested`: Build completed successfully (8976 jobs), with three `declaration uses sorry` warnings at lines 89, 117 and 132.
- Gate: `gate KacMoody: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`. The only failure is `depcheck: NOT IN ORDER: KacMoody (insert it after its last supplier)`, which the brief says is not a defect at the design stage.
- Depcheck `--movable`: `NOT IN ORDER: KacMoody (insert it after its last supplier)` / `depcheck: 148 roadmaps, 1006 edges, 1 problem(s)`. There are no UPWARD or CYCLE lines.
- Commit: `d42952ae` "KacMoody: review repairs (quantum O_int tensor splitting, form normalization, affine owner, gate fixes)". Not pushed.

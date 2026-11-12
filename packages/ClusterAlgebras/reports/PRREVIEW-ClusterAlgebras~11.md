# Review of ClusterAlgebras (pull request #2250 at 75d3b8e)

**Verdict:** needs changes

## R01 (P3) — §0.4 identifies Tau Ceti's torus with two other objects but states no map

**Location:** `TauCetiRoadmap/ClusterAlgebras/README.md`:439–443 "Define `T(R,u,Λ)` as `TauCeti.twistedMonoidAlgebra` … Over a commutative ring this is the full `QuantumMonoidAlgebra` of ScatteringDiagrams §4.3 … Use §4.3's coefficient and lattice maps over rings." Also :483 "This is the underlying linear map of `TwistedMonoidAlgebra.lift`".

**Claim:** This was introduced by the repair of the previous R03. §4.3's coefficient and lattice maps are defined on `QuantumMonoidAlgebra`, which is a different type from `T(R,u,Λ)`. No target states the isomorphism that transports them, and §0.4 :468 and Layer 0 :721 use them on `T`. The linear map of `lift` has domain `T(R,u,Λ)`, not `(ℤ^I →₀ R)`.

**Witness:** ScatteringDiagrams (main) :1394–1395 builds `QuantumMonoidAlgebra R q β` on the module of `AddMonoidAlgebra R L`. Tau Ceti `Twisted/Basic.lean`:288 makes `twistedMonoidAlgebra` a `Subalgebra k (Module.End k (G →₀ k))`, and :397 gives `lift` that domain.

**Repair:** (1) Replace "Over a commutative ring this is the full `QuantumMonoidAlgebra` of ScatteringDiagrams §4.3 with `q=u` and `β=Λ`." with: "Over a commutative ring, prove that `TwistedMonoidAlgebra.lift` of `a↦z^a` is an `R`-algebra isomorphism from `T(R,u,Λ)` onto the full `QuantumMonoidAlgebra` of ScatteringDiagrams §4.3 with `q=u` and `β=Λ`, sending `X^a` to `z^a`. Transport §4.3's coefficient and lattice maps along it." (2) Replace the sentence at :483–484 with: "It is `TwistedMonoidAlgebra.lift` of the monomial family composed with `(TwistedMonoidAlgebra.basis R (Multiplicative ℤ^I) α).repr.symm`." Both were tested. `lift` applies because §4.3's unit and multiplication rules are `z^0=1` and `z^az^b=u^{Λ(a,b)}z^{a+b}`. It is bijective because it sends the basis `of a` to the basis `z^a`. On a single, `eval(single a r)=r·M(a)=lift(r•of a)`.

## R02 (P3) — The description predates the finite-type count and the new torus supplier

**Location:** Pull-request description. The Checks section says "the eleven theorem targets are the only `sorry`s". The `Suggested.lean` section lists "New targets: `Seed.existsUnique_isMutation` …, `Seed.exists_laurentExpansion` … and `Seed.exists_laurentExpansion_of_isGenerating` (P3)."

**Claim:** At this head `Suggested.lean` has twelve sorried theorems. The new one, `ncard_clusterVariables` (§4.2), is not listed. The description also does not say that §0.4's based torus now comes from Tau Ceti rather than ScatteringDiagrams §4.3.

**Witness:** `lake env lean` at 75d3b8e gives 12 `declaration uses sorry` warnings, the new one at :443 `ncard_clusterVariables`. README :144–148 adds the Tau Ceti contract, and :152–153 narrows ScatteringDiagrams §4.3 to the coefficient and lattice maps.

**Repair:** Replace "the eleven theorem targets" with "the twelve theorem targets". Extend "New targets:" with ", and `ncard_clusterVariables` (§4.2: a binary seed over ℤ whose principal block has a finite reduced Cartan companion has `rank Φ + |Φ⁺|` cluster variables)". Under "Layer 0." add: "§0.4 defines the based torus as Tau Ceti's `twistedMonoidAlgebra`; ScatteringDiagrams §4.3 supplies its coefficient and lattice maps."

## Previous findings

- R01 — repaired: `Suggested.lean`:443–451 states `ncard_clusterVariables` with `hA : … = b.cartanMatrix (e j) (e i)`. This is FZ II's convention, which README §4.2 :2533–2536 defines as the transpose of `RootPairing.Base.cartanMatrix`. README :2552–2555 names it.
- R02 — repaired: the module docstring :30–35 names the §3.3 global-functions theorem, the §§5.1–5.2 mutation invariance and theta realization, and the §6.3 coordinate-ring theorem, each with its missing carrier.
- R03 — repaired: README :144–148 cites `TauCeti.twistedMonoidAlgebra`, `basis`, `of_mul_of`, `isUnit_of`, `lift` and `monoidAlgebraEquiv` at 2fd255d. §0.4 :439 defines `T(R,u,Λ)` by it. The repair introduced R01.
- R04 — repaired: :1158 "(FZ IV, Definition 2.12 and (2.13)–(2.15))"; :1836–1838 "Proposition 3.9 and (3.12)–(3.13) … Proposition 3.12 and (3.17) … Theorem 3.7 … Corollary 6.3".
- R05 — repaired: docstrings at :72, :250, :316 and :320–321. Section comment :81 reads "Layer 1: classical and quantum seeds and mutation". All five section comments match the README headings.
- R06 — repaired: :1173 "`IsRegular (2:C)` holds or every mutable column … is nonzero"; :1514–1517 "binary seed over ℤ at `u=1` … (BFZ III, Definition 1.1) … gives BFZ III, Corollary 1.9".

## Verified sound

| Statement | Instance | Left | Right | Result |
|---|---|---|---|---|
| `ncard_clusterVariables`, count | `A₂, B₂, G₂, A₁×A₁` | `2+3, 2+4, 2+6, 2+2` | 5, 6, 8, 4 (§4.2 Examples; FZ II Thm 1.9 line 298) | holds |
| same, convention | `B=((0,1),(−2,0))` | `A(B)₂₁=−2`; FZ `a_ij=⟨α_j,α_i^∨⟩` (FZ II line 289) | `cartanMatrix (e 1) (e 2)=pairing 1 2=⟨α₁,α₂^∨⟩=−2` (`Defs.lean`:252) | `(e j)(e i)` is FZ's; the transpose does not change the count |
| same, degenerate | `K=∅`; `BC₁` | `∅` has ncard 0; `b.support=∅` forces `ι=∅`, so `0+0` | `BC₁`: `1+2=3`, but 2 variables | holds; `[P.IsReduced]` needed |
| same, characteristic | `F` of characteristic `p` | `p·M(0)=0·M(0)` breaks ℤ-independence | no based chart, hypothesis empty | forces characteristic 0, as FZ |
| §0.4 factor set | `Λ` bilinear, alternating | `Λ(a+b,c)+Λ(a,b)=Λ(a,c)+Λ(b,c)+Λ(a,b)` | `=Λ(b,c)+Λ(a,b+c)`; `X^aX^{−a}=u^{−Λ(a,a)}=1` | `IsFactorSet` (`Twisted/Basic.lean`:99) holds |
| §0.4 quantum notation | `u=v`, rank 2 | `X_iX_j=v^{Λ_ij}X^{e_i+e_j}` | `X_jX_i=v^{−Λ_ij}X^{e_i+e_j}`, ratio `v^{2Λ_ij}` | agree |
| §0.4 `χ`↔chart over a semiring | `R=ℕ`, `Λ=0`, `M(a)=2^a∈ℚ` | `2·M(0)=M(1)`: not independent | `χ(2X⁰)=χ(X¹)=2`: not injective | the bijection holds over semirings |
| R01 comparison | rank 2, `Λ(e₁,e₂)=1` | Tau Ceti `of e₁·of e₂=u•of(e₁+e₂)` | §4.3 `z^{e₁}z^{e₂}=q z^{e₁+e₂}`, `q=u` | `lift` exists and is bijective; it is not stated |
| R01 chart map | `single a r` | `eval=r·M(a)` | `lift(repr.symm(single a r))=r·M(a)` | equal only after `repr.symm` |
| §1.4 exchange | column `(0,1)ᵀ` | `xx'=1+z` | FZ IV (2.15) line 500, Def 2.12 line 402 | agree |
| §1.4 regularity | `ℤ/6ℤ`, zero column; a nonzero column | numerator `2`, `2·3=0`: not regular | `X^a+X^b`, `a≠b`: unit leading coefficient, regular | holds |
| §2.1 BFZ case | `B̃=(0,1)ᵀ`, frozen inverted | `chartAlgebra ℤ`=`ℤ[x^{±1},z^{±1}]`=`ℤP[x^{±1}]` | BFZ III Def 1.1 line 117; Cor 1.9 line 232 (rank n, skew-symmetrizable) | agree |
| §2.3 locators | rank 1, principal coefficients | (3.17): `X'=(1+y)/((1⊕y)x)=(1+y)/x` | Cor 6.3 line 1083: `F=1+y`, `g=−1`, same | agree; (3.12) line 741, (3.13) line 744 |
| module docstring | §3.3, §§5.1–5.2, §6.3 | no scattering, broken-line or Bruhat carrier in Tau Ceti 2fd255d | each named with its carrier | holds |

The rows for statements this diff leaves untouched stand as in the previous review of b177dca.

- **Gate:** my run at 75d3b8e reports every counter 0, OK. Depcheck prints `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Nothing changes outside the folder.
- **Lean:** `lake env lean` gives 12 warnings, all `declaration uses sorry` on theorems, and no errors. The one-tactic probe (`rfl|simp|infer_instance|trivial|decide|aesop`) fails on `ncard_clusterVariables`. Its `#check @` type keeps `[Fintype I]`, `row` and `[Fintype K]` and matches §4.2.
- **Sources:** I checked 15 locators in the text and all hold:
  - FZ II: Thm 1.4 line 239, Thm 1.9 line 298 and the convention at line 289.
  - FZ IV: Def 2.12 line 402, (2.13) line 471, (2.15) line 500, Thm 3.7 line 650, Prop 3.9 line 666, (3.12) line 741, (3.13) line 744, Prop 3.12 line 760, (3.17) line 785 and Cor 6.3 line 1081.
  - BFZ III: Def 1.1 line 117 and Cor 1.9 line 232.
- **Seeded sample:** §§0.4, 1.4, 2.1 and 4.2 fall in the diff and were checked above. §§0.2, 1.1, 1.2, 1.5, 2.5, 2.7, 3.3–3.5, 5.1 and 6.3 are unchanged.
- **Library declarations at the pins:**
  - Mathlib 1b1ccf4: `CartanMatrix.lean`:53 and :107, `Defs.lean`:195 and :252, `Base.lean`:619.
  - Tau Ceti 2fd255d: `Twisted/Basic.lean`:99, 288, 336, 345, 356, 397 and 456.
  - Neither pin has a cluster-algebra object.
- **Cross-roadmap citations:** ScatteringDiagrams §4.3 (main 7342e8f, :1391–1449) resolves. The overlaps report lists no dropped or revision-only ids.
- **Overlap check:** I read ScatteringDiagrams (main, 0.18); the two open-roadmap lists are empty.
  - Tau Ceti owns the twisted lattice algebra carrier. ScatteringDiagrams §4.3 owns `QuantumMonoidAlgebra` and its maps. This roadmap owns seeds, mutation and the finite-type counts.
  - Searches of the 439 open heads and main for almost-positive roots, cluster variables and `twistedMonoidAlgebra` find only consumers of Tau Ceti's carrier: HeisenbergImprimitivity, CompactQuantumMetricSpaces, OperatorAlgebraDynamics, TemperleyLiebOperatorAlgebras and InductionRestriction.

## Not verifiable

- No item in the changed passages. Berenstein–Zelevinsky, *Total positivity in Schubert varieties*, (4.8)–(4.11), cited in the unchanged §6.1, stands as in the previous review.

## Source issues

- none
